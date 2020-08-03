# Authentication functions of CouchDB module

function Set-CouchDBSession () {
    <#
    .SYNOPSIS
    Set cookie authentication.
    .DESCRIPTION
    Set cookie authentication. This create the global variable CouchDBCredential.
    .PARAMETER UserId
    The CouchDB user_id.
    .PARAMETER Password
    The password of user_id in SecureString.
    .EXAMPLE
    $password = "password" | ConvertTo-SecureString -AsPlainText -Force
    Set-CouchDBSession -UserId admin -Password $password
    This example manually set the web session on CouchDB server.
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/auth.html
    #>
    param(
        [Parameter(mandatory = $true)]
        [string] $UserId,
        [Parameter(mandatory = $true)]
        [SecureString] $Password
    )
    [PSCredential]$credOject = New-Object System.Management.Automation.PSCredential ($UserId, $Password)
    $Global:CouchDBCredential = $credOject
    return $Global:CouchDBCredential
}

function Get-CouchDBSession () {
    <#
    .SYNOPSIS
    Get cookie authentication.
    .DESCRIPTION
    Get the global variable CouchDBCredential.
    .PARAMETER Clear
    The CouchDB authorization form.
    .EXAMPLE
    Get-CouchDBSession
    This example get the web session on CouchDB server.
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/auth.html
    #>
    param(
        [switch] $Clear
    )
    if ($Clear.IsPresent) {
        if ($Global:CouchDBCredential -is [pscredential]) {
            return "$($Global:CouchDBCredential.UserName):$($Global:CouchDBCredential.GetNetworkCredential().Password)"
        } else {
            return $Global:CouchDBCredential
        }
    } else {
        return $Global:CouchDBCredential
    }
}

function Remove-CouchDBSession () {
    <#
    .SYNOPSIS
    Remove current cookie authentication.
    .DESCRIPTION
    Remove cookie authentication for current session.
    .EXAMPLE
    Remove-CouchDBSession
    The example remove current session. 
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/auth.html
    #>
    Remove-Variable CouchDBCredential -Scope global -ErrorAction SilentlyContinue
}