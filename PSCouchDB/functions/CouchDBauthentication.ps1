# Authentication functions of CouchDB module

function Set-CouchDBSession () {
    <#
    .SYNOPSIS
    Set cookie authentication.
    .DESCRIPTION
    Set cookie authentication (RFC 2109) CouchDB generates a token that the client can use for the next few requests to CouchDB. 
    Tokens are valid until a timeout.
    .NOTES
    CouchDB API:
        POST /_session
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER UserId
    The CouchDB user_id.
    .PARAMETER Password
    The password of user_id in SecureString.
    .PARAMETER Authorization
    The CouchDB authorization form; user and password.
    Authorization format like this: user:password
    ATTENTION: if the password is not specified, it will be prompted.
    .PARAMETER Ssl
    Set ssl connection on CouchDB server.
    This modify protocol to https and port to 6984.
    .EXAMPLE
    $password = "password" | ConvertTo-SecureString -AsPlainText -Force
    Set-CouchDBSession -UserId admin -Password $password
    This example manually set the web session on CouchDB server.
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/auth.html
    #>
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory = $true)]
        [string] $UserId,
        [Parameter(mandatory = $true)]
        [SecureString] $Password,
        [switch] $Ssl
    )
    $Database = '/_session'
    $ClearPassword = ConvertTo-CouchDBPassword -SecurePassword $Password
    $Data = "{
        `"name`": `"$UserId`",
        `"password`": `"$ClearPassword`"
        }"
    $Authorization = "${UserId}:${ClearPassword}" 
    Send-CouchDBRequest -Server $Server -Port $Port -Method "POST" -Database $Database -Data $Data -Authorization $Authorization -Ssl:$Ssl
}

function Get-CouchDBSession () {
    <#
    .SYNOPSIS
    Get cookie authentication.
    .DESCRIPTION
    Get cookie authentication for current session.
    .NOTES
    CouchDB API:
        GET /_session
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER Authorization
    The CouchDB authorization form; user and password.
    Authorization format like this: user:password
    ATTENTION: if the password is not specified, it will be prompted.
    .PARAMETER Ssl
    Set ssl connection on CouchDB server.
    This modify protocol to https and port to 6984.
    .EXAMPLE
    Get-CouchDBSession
    This example get the web session on CouchDB server.
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/auth.html
    #>
    param(
        [Parameter(ValueFromPipeline = $true)]
        [string] $Server,
        [int] $Port,
        [string] $Authorization,
        [switch] $Ssl
    )
    $Database = '/_session'
    Send-CouchDBRequest -Server $Server -Port $Port -Method "GET" -Database $Database -Authorization $Authorization -Ssl:$Ssl
}

function Remove-CouchDBSession () {
    <#
    .SYNOPSIS
    Remove current cookie authentication.
    .DESCRIPTION
    Remove cookie authentication for current session.
    .NOTES
    CouchDB API:
        DELETE /_session
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER Authorization
    The CouchDB authorization form; user and password.
    Authorization format like this: user:password
    ATTENTION: if the password is not specified, it will be prompted.
    .PARAMETER Ssl
    Set ssl connection on CouchDB server.
    This modify protocol to https and port to 6984.
    .EXAMPLE
    Remove-CouchDBSession -Authorization "admin:password"
    The example remove current session. 
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/auth.html
    #>
    param(
        [Parameter(ValueFromPipeline = $true)]
        [string] $Server,
        [int] $Port,
        [string] $Authorization,
        [switch] $Ssl
    )
    $Database = '_session'
    Clear-Variable -Name couchdb_session -Scope Global
    Send-CouchDBRequest -Server $Server -Port $Port -Method "DELETE" -Database $Database -Authorization $Authorization -Ssl:$Ssl
}