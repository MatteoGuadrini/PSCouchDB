:toctree:

    intro
    config
    permission
    server
    auth
    databases
    documents
    ddoc
    cmdlets
    classes
    uses
    support

Real uses
=========

Below are some examples of real-world applications that can give the idea of the module's potential together with CouchDB.

Scripts
_______

Scripts, automations and tools are the main use of this module.

Simple machine inventory
************************

This is a simple hardware inventory in business scenario, build in three steps.

First step, create database.

.. code-block:: powershell

    New-CouchDBDatabase -Database hw_inventory -Authorization "admin:password"

Second, edit a new file *hw_inventory.ps1* e paste this:

.. code-block:: powershell

    # Create an Active Directory session
    $session = New-PSSession -ComputerName "your_domain_controller.local"
    Import-PSSession -Session $session -module ActiveDirectory
    # Get all computer
    $AllComputers = Get-ADComputer -Filter * -Properties DNSHostName
    foreach ($ComputerName in $AllComputers.DNSHostName) {
        $info = @{}
        # Test connection of computer
        if (Test-Connection $ComputerName -Count 1 -Quiet) {
            # Select various info
            $info.Add('ComputerHW', (Get-CimInstance -Class Win32_ComputerSystem -ComputerName $ComputerName |
            select Manufacturer,
                   Model,
                   NumberOfProcessors,
                   @{Expression={$_.TotalPhysicalMemory / 1GB};Label="TotalPhysicalMemoryGB"}))
            $info.Add('ComputerCPU', (Get-CimInstance win32_processor -ComputerName $ComputerName |
            select DeviceID,
                   Name,
                   Manufacturer,
                   NumberOfCores,
                   NumberOfLogicalProcessors))
            $info.Add('ComputerDisks', (Get-CimInstance -Class Win32_LogicalDisk -Filter "DriveType=3" -ComputerName $ComputerName |
            select DeviceID,
                   VolumeName,
                   @{Expression={$_.Size / 1GB};Label="SizeGB"}))
            $info.Add("timestamp", (Get-Date -f MM-dd-yyyy_HH_mm_ss))
            # Write on database
            if (Get-CouchDBDocument -Database hw_inventory -Document $ComputerName -ErrorAction SilentlyContinue -Authorization "admin:password") {
                Set-CouchDBDocument -Database hw_inventory -Document $ComputerName -Data $info -Revision $(Get-CouchDBDocument -Database hw_inventory -Document $ComputerName -Authorization "admin:password")._rev -Replace -Authorization "admin:password"
            } else {
                New-CouchDBDocument -Database hw_inventory -Document $ComputerName -Data $info -Authorization "admin:password"
            }
        }
    }
    Get-PSSession | Remove-PSSession

Third, edit your *profile.ps1* and put this function:

.. code-block:: powershell

    # Find computer into inventory
    function Find-ComputerInventory () {
        param(
            [Parameter(mandatory=$true)]
            [string] $Computername
        )
        $docs = Find-CouchDBDocuments -Database hw_inventory -Selector "_id" -Operator regex -Value ".*$Computername.*" -Fields _id,ComputerHW,ComputerCPU,ComputerDisks,timestamp -Authorization "admin:password"
        $docs.docs
    }

Schedule the script at any hour or minute you want.

Log storage
***********

To create an application that stores logs from various machines in one steps.

Edit your *profile.ps1* and put this function:

.. code-block:: powershell

    using module PSCouchDB

    # Write log
    function Write-WindowsLog () {
        param(
            [Parameter(mandatory=$true)]
            [string] $ComputerName,
            $Authorization
        )
        # Define logs
        $Logs = @("Application","Security","System")
        # Loop foreach log
        foreach ($Log in $logs) {
            $count = 0
            $DBname = "${ComputerName}_$Log".ToLower()
            # Test if database log exists
            if ($null -eq (Test-CouchDBDatabase -Database $DBname -ErrorAction SilentlyContinue -Authorization $Authorization)) {
                New-CouchDBDatabase -Database $DBname -Authorization $Authorization
            }
            # Get log
            $LogList = Get-EventLog -LogName $Log -ComputerName $ComputerName
            $LogList | foreach {
                $count++
                # Write on database
                if (-not(Get-CouchDBDocument -Database $DBname -Document $_.Index -ErrorAction SilentlyContinue -Authorization $Authorization)) {
                    New-CouchDBDocument -Database $DBname -Document $_.Index -Data ($_ | Convertto-Json -Depth 10) -Authorization $Authorization | Out-Null
                }
                Write-Progress -Activity "Write log $Log in progress" -Status "Progress $count/$($LogList.count)" -PercentComplete ($count/$LogList.count*100)
            }
        }
    }

    # Find log with criteria
    function Find-WindowsLog () {
        param(
            [Parameter(mandatory=$true)]
            [string] $ComputerName,
            [Parameter(mandatory=$true)]
            [ValidateSet("Application","Security","System")]
            [string] $Log,
            $SearchCriteria
        )
        # Check if criteria is a string or a int
        if ($SearchCriteria.GetType() -eq  [int]) {
            $SearchCriteria = [int]$SearchCriteria
        }
        # Create Mango query
        $q = New-Object -TypeName PSCouchDBQuery
        $q.AddSelector("CategoryNumber",$SearchCriteria)
        $q.AddSelector("EventID",$SearchCriteria)
        $q.AddSelector("Message","")
        $q.AddSelector("UserName","")
        $q.AddSelector("Source","")
        $q.AddSelectorOperator('$regex',"Message",".*$SearchCriteria.*")
        $q.AddSelectorOperator('$regex',"UserName",".*$SearchCriteria.*")
        $q.AddSelectorOperator('$regex',"Source",".*$SearchCriteria.*")
        $q.AddLogicalOperator('$or')
        $q.AddFields("_id")
        $q.AddFields("MachineName")
        $q.AddFields("Data")
        $q.AddFields("Index")
        $q.AddFields("CategoryNumber")
        $q.AddFields("EventID")
        $q.AddFields("EntryType")
        $q.AddFields("Message")
        $q.AddFields("Source")
        $q.AddFields("ReplacementStrings")
        $q.AddFields("InstanceId")
        $q.AddFields("UserName")
        $docs = Find-CouchDBDocuments -Database "${ComputerName}_$($Log.ToLower())" -Find $q.GetNativeQuery() -Authorization "admin:password"
        $docs.docs
    }

OOP
___

This module has classes representing the various types of documents that exist in CouchDB. You can use them to create objects, extend them to create new custom classes and much more. 
Everything you know about OOP, you can take advantage of it and use it.

Custom document
***************

Creating a custom document to reflect a specific template is very easy.

::

    using module PSCouchDB

    class PersonDocument : PSCouchDBDocument {
        [string] $Name
        [string] $Surname
        [int] $Age
        [string] $Title

        PersonDocument ([string]$Name, [string]$Surname) {
            $this.Name = $Name
            $this.Surname = $Surname
            $this.SetElement('Name', $Name)
            $this.SetElement('Surname', $Surname)
        }
    }

    # Create instance
    $person = New-Object PersonDocument -ArgumentList 'Matteo','Guadrini'

    # Add my age
    $person.SetElement('Age', 34)
    $person.Age = 34

    # View CouchDB document
    $person.ToJson()

    # Write on database
    New-CouchDBDocument -Database 'persons' -Document $person._id -Data $person -Authorization "admin:password"

.. note::
    **With PSCouchDB, with just a few lines of code, you can create simple applications for complex tasks.**