# Private functions of CouchDB module

function ConvertTo-CouchDBPassword ([SecureString] $SecurePassword) {
    <#
    .SYNOPSIS
    Convert SecureString.
    .DESCRIPTION
    Convert to SecureString to simple string.
    .PARAMETER SecurePassword
    Password format in [SecureString].
    .EXAMPLE
    $password = "password" | ConvertTo-SecureString -AsPlainText -Force
    ConvertTo-CouchDBPassword -SecurePassword $password
    This example return a readable password.
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/permission.html#create-admin-user
    #>
    $UnsecurePassword = [System.Net.NetworkCredential]::new("", $SecurePassword).Password
    return $UnsecurePassword
}

function Register-TemporaryEvent () {
    <#
    .SYNOPSIS
    Registers an event action for an object, and automatically unregisters
    itself afterward. In PowerShell version three, use the -MaxTriggerCount
    parameter of the Register-*Event cmdlets.
    .DESCRIPTION
    Registers an event action for an object, and automatically unregisters
    itself afterward. In PowerShell version three, use the -MaxTriggerCount
    parameter of the Register-*Event cmdlets.
    .PARAMETER Object
    Job object to execute in background.
    .PARAMETER Event
    Event catched.
    .PARAMETER Action
    ScriptBlock powershell commands to post execution.
    .EXAMPLE
    PS > $timer = New-Object Timers.Timer
    PS > Register-TemporaryEvent $timer Disposed { [Console]::Beep(100,100) }
    PS > $timer.Dispose()
    PS > Get-EventSubscriber
    PS > Get-Job
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/documents.html#get-a-bulk-documents
    #>
    param(
        $Object,
        $EventName,
        [ScriptBlock] $Action
    )

    $actionText = $Action.ToString()
    $actionText += @'
    $eventSubscriber | Unregister-Event
    $eventSubscriber.Action | Remove-Job
'@

    $eventAction = [ScriptBlock]::Create($actionText)
    $null = Register-ObjectEvent $Object $EventName -Action $eventAction

}