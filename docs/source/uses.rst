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

Simple machine inventory
________________________

This is a simple hardware inventory in business scenario, build in three steps.

First step, create database.

.. code-block:: powershell

    New-CouchDBDatabase -Database hw_inventory

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
            if (Get-CouchDBDocument -Database hw_inventory -Document $ComputerName -ErrorAction SilentlyContinue) {
                Set-CouchDBDocument -Database hw_inventory -Document $ComputerName -Data $info -Revision $(Get-CouchDBDocument -Database hw_inventory -Document $ComputerName)._rev -Replace
            } else {
                New-CouchDBDocument -Database hw_inventory -Document $ComputerName -Data $info
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
        $docs = Find-CouchDBDocuments -Database hw_inventory -Selector "_id" -Operator regex -Value ".*$Computername.*" -Fields _id,ComputerHW,ComputerCPU,ComputerDisks,timestamp
        $docs.docs
    }

Schedule the script every six hours.

Log storage
___________

To create an application that stores logs from various machines in two steps.

First, edit your *profile.ps1* and put this function:

.. code-block:: powershell

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
            if ($null -eq (Test-CouchDBDatabase -Database $DBname -ErrorAction SilentlyContinue)) {
                New-CouchDBDatabase -Database $DBname -Authorization $Authorization
            }
            # Get log
            $LogList = Get-EventLog -LogName $Log -ComputerName $ComputerName
            $LogList | foreach {
                $count++
                # Write on database
                if (-not(Get-CouchDBDocument -Database $DBname -Document $_.Index -ErrorAction SilentlyContinue)) {
                    New-CouchDBDocument -Database $DBname -Document $_.Index -Data ($_ | Convertto-Json -Depth 10) -Authorization $Authorization | Out-Null
                }
                Write-Progress -Activity "Write log $Log in progress" -Status "Progress $count/$($LogList.count)" -PercentComplete ($count/$LogList.count*100)
            }
        }
    }

Second, edit again your *profile.ps1* and put this function: 

.. code-block:: powershell

    using module PSCouchDB
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
        $docs = Find-CouchDBDocuments -Database "${ComputerName}_$($Log.ToLower())" -Find $q.GetNativeQuery()
        $docs.docs
    }

.. note::
    **With PSCouchDB, with just a few lines of code, you can create simple applications for complex tasks.**