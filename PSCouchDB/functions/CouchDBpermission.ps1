# Permission functions of CouchDB module

function New-CouchDBAdmin () {
    <#
    .SYNOPSIS
    Create a new admin user.
    .DESCRIPTION
    Create a new CouchDB admin user.
    .NOTES
    CouchDB API:
        PUT /_node/{node-name}/_config/{section}/{key}
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER Node
    The CouchDB node of cluster. Default is couchdb@localhost.
    .PARAMETER Userid
    The user_id than exists in _users database.
    .PARAMETER Password
    The password in SecureString.
    .PARAMETER Authorization
    The CouchDB authorization form; user and password.
    Authorization format like this: user:password
    ATTENTION: if the password is not specified, it will be prompted.
    .PARAMETER Ssl
    Set ssl connection on CouchDB server.
    This modify protocol to https and port to 6984.
    .PARAMETER ProxyServer
    Proxy server through which all non-local calls pass.
    Ex. ... -ProxyServer 'http://myproxy.local:8080' ...
    .PARAMETER ProxyCredential
    Proxy server credential. It must be specified with a PSCredential object.
    .EXAMPLE
    $password = "password" | ConvertTo-SecureString -AsPlainText -Force
    New-CouchDBAdmin -Userid admin -Password $password -Authorization "admin:password"
    This example creates "admin" user admin with password "password".
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/permission.html#create-admin-user
    #>
    [CmdletBinding()]
    param(
        [Parameter(ValueFromPipeline = $true)]
        [string] $Server,
        [int] $Port,
        [string] $Node,
        [Parameter(mandatory = $true, Position = 0)]
        [string] $Userid,
        [Parameter(mandatory = $true, Position = 1)]
        [SecureString] $Password,
        $Authorization,
        [switch] $Ssl,
        [string] $ProxyServer,
        [pscredential] $ProxyCredential
    )
    # Check node
    if (-not($Node)) {
        if ((Get-CouchDBNode -Server $Server -Port $Port -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential).name) {
            $Node = (Get-CouchDBNode -Server $Server -Port $Port -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential).name
        } else {
            $Node = Read-Host "Enter the node name (ex. couchdb@localhost)"
        }
    }
    $Database = "_node"
    $Document = "$Node/_config/admins/$Userid"
    $ClearPassword = ConvertTo-CouchDBPassword -SecurePassword $Password
    $Data = "`"$ClearPassword`""
    Send-CouchDBRequest -Server $Server -Port $Port -Method "PUT" -Database $Database -Document $Document -Data $Data -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential
}

function New-CouchDBUser () {
    <#
    .SYNOPSIS
    Create a new user.
    .DESCRIPTION
    Create a new CouchDB user with roles.
    .NOTES
    CouchDB API:
        PUT /_users
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER Userid
    The user_id than exists in _users database.
    .PARAMETER Password
    The password in SecureString.
    .PARAMETER Roles
    Array of roles.
    .PARAMETER Authorization
    The CouchDB authorization form; user and password.
    Authorization format like this: user:password
    ATTENTION: if the password is not specified, it will be prompted.
    .PARAMETER Ssl
    Set ssl connection on CouchDB server.
    This modify protocol to https and port to 6984.
    .PARAMETER ProxyServer
    Proxy server through which all non-local calls pass.
    Ex. ... -ProxyServer 'http://myproxy.local:8080' ...
    .PARAMETER ProxyCredential
    Proxy server credential. It must be specified with a PSCredential object.
    .EXAMPLE
    $password = "password" | ConvertTo-SecureString -AsPlainText -Force
    New-CouchDBUser -Userid test_user -Password $password -Authorization "admin:password"
    This example creates user "test_user" of password "password".
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/permission.html#create-admin-user
    #>
    [CmdletBinding()]
    param(
        [Parameter(ValueFromPipeline = $true)]
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory = $true, Position = 0)]
        [string] $Userid,
        [Parameter(mandatory = $true, Position = 1)]
        [SecureString] $Password,
        [array] $Roles,
        $Authorization,
        [switch] $Ssl,
        [string] $ProxyServer,
        [pscredential] $ProxyCredential
    )
    $Database = "_users"
    $Document = "org.couchdb.user:$Userid"
    if ($Roles.Count -eq 1) {
        $Roles = "[$($Roles | ConvertTo-Json)]"
    } elseif ($Roles.Count -gt 1) {
        $Roles = $Roles | ConvertTo-Json
    } else {
        $Roles = '[]'
    }
    $ClearPassword = ConvertTo-CouchDBPassword -SecurePassword $Password
    $Data = "{
        `"_id`": `"org.couchdb.user:$Userid`",
        `"name`": `"$Userid`",
        `"roles`": $Roles,
        `"type`": `"user`",
        `"password`": `"$ClearPassword`"
}"
    Send-CouchDBRequest -Server $Server -Port $Port -Method "PUT" -Database $Database -Document $Document -Data $Data -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential
}

function Grant-CouchDBDatabasePermission () {
    <#
    .SYNOPSIS
    Grant the security object for the given database.
    .DESCRIPTION
    Grant the security object for the given CouchDB database. Specify Admins and/or Members.
    .NOTES
    CouchDB API:
        PUT /{db}/_security
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER Database
    The CouchDB database.
    .PARAMETER Data
    The data in Json format or PSCouchDBSecurity.
    .PARAMETER Authorization
    The CouchDB authorization form; user and password.
    Authorization format like this: user:password
    ATTENTION: if the password is not specified, it will be prompted.
    .PARAMETER Ssl
    Set ssl connection on CouchDB server.
    This modify protocol to https and port to 6984.
    .PARAMETER ProxyServer
    Proxy server through which all non-local calls pass.
    Ex. ... -ProxyServer 'http://myproxy.local:8080' ...
    .PARAMETER ProxyCredential
    Proxy server credential. It must be specified with a PSCredential object.
    .EXAMPLE
    using module PSCouchDB
    $sec = New-Object PSCouchDBSecurity -ArgumentList 'myadmin'
    Grant-CouchDBDatabasePermission -Database test -Data $sec -Authorization "admin:password"
    This example grant "myadmin" admin user on "test" database on CouchDB server.
    .EXAMPLE
    $sec = @"
    {
        "admins": {
            "names": [],
            "roles": []
        },
        "members": {
            "names": ["reader"],
            "roles": []
        }
    }
    "@
    Grant-CouchDBDatabasePermission -Database test -Data $sec -Authorization "admin:password"
    This example grant "reader" member user on "test" database on CouchDB server.
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/permission.html#limit-read-access
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory = $true, ValueFromPipeline = $true, Position = 0)]
        [string] $Database,
        [Parameter(Position = 1)]
        $Data,
        $Authorization,
        [switch] $Ssl,
        [string] $ProxyServer,
        [pscredential] $ProxyCredential
    )
    # Check data is string or PSCouchDBSecurity
    if ($Data -is [PSCouchDBSecurity]) {
        $Data = $Data.ToString()
    }
    $Document = '_security'
    Send-CouchDBRequest -Server $Server -Port $Port -Method "PUT" -Database $Database -Document $Document -Data $Data -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential
}

function Get-CouchDBDatabaseSecurity () {
    <#
    .SYNOPSIS
    Get the current security object from the specified database.
    .DESCRIPTION
    Returns the current security object from the specified database.
    .NOTES
    CouchDB API:
        GET /{db}/_security
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER Database
    The CouchDB database.
    .PARAMETER Variable
    Export into a PSCouchDBSecurity variable object.
    .PARAMETER Authorization
    The CouchDB authorization form; user and password.
    Authorization format like this: user:password
    ATTENTION: if the password is not specified, it will be prompted.
    .PARAMETER Ssl
    Set ssl connection on CouchDB server.
    This modify protocol to https and port to 6984.
    .PARAMETER ProxyServer
    Proxy server through which all non-local calls pass.
    Ex. ... -ProxyServer 'http://myproxy.local:8080' ...
    .PARAMETER ProxyCredential
    Proxy server credential. It must be specified with a PSCredential object.
    .EXAMPLE
    Get-CouchDBDatabaseSecurity -Database test -Authorization "admin:password"
    This example get the security object from database "test".
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/permission.html#limit-read-access
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory = $true, ValueFromPipeline = $true, Position = 0)]
        [string] $Database,
        [string] $Variable,
        $Authorization,
        [switch] $Ssl,
        [string] $ProxyServer,
        [pscredential] $ProxyCredential
    )
    $Document = "_security"
    if ($Variable) {
        $sec = Send-CouchDBRequest -Server $Server -Port $Port -Method "GET" -Database $Database -Document $Document -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential
        $var = New-Object PSCouchDBSecurity
        # Check admins names
        if ($sec.admins.names) {$var.AddAdmins($sec.admins.names)}
        # Check admins name and roles
        elseif ($sec.admins.names -and $sec.admins.roles) {$var.AddAdmins($sec.admins.names, $sec.admins.roles)}
        # Check members names
        if ($sec.members.names) {$var.AddMembers($sec.members.names)}
        # Check members name and roles
        elseif ($sec.members.names -and $sec.members.roles) {$var.AddMembers($sec.members.names, $sec.members.roles)}
        Set-Variable -Name $Variable -Value $var -Scope Global
        return $null
    }
    Send-CouchDBRequest -Server $Server -Port $Port -Method "GET" -Database $Database -Document $Document -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential
}

function Revoke-CouchDBDatabasePermission () {
    <#
    .SYNOPSIS
    Revoke all permission on database.
    .DESCRIPTION
    Revoke permission on database. Specify Admins and/or Readers.
    .NOTES
    CouchDB API:
        PUT /{db}/_security
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER Database
    The CouchDB database.
    .PARAMETER Force
    No confirmation prompt.
    .PARAMETER ProxyServer
    Proxy server through which all non-local calls pass.
    Ex. ... -ProxyServer 'http://myproxy.local:8080' ...
    .PARAMETER ProxyCredential
    Proxy server credential. It must be specified with a PSCredential object.
    .EXAMPLE
    Revoke-CouchDBDatabasePermission -Database test -Authorization "admin:password"
    This example revoke all permission on database "test".
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/permission.html#revoke-database-permissions
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory = $true, ValueFromPipeline = $true, Position = 0)]
        [string] $Database,
        $Authorization,
        [switch]$Force,
        [switch] $Ssl,
        [string] $ProxyServer,
        [pscredential] $ProxyCredential
    )
    if ($Force -or $PSCmdlet.ShouldContinue("Do you wish revoke all permission on database $Database ?", "Revoke all permission on database $Database")) {
        # Get a current security permission
        if ($null -eq (Get-CouchDBDocument -Server $Server -Port $Port -Database $Database -Document '_security' -Info -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential -ErrorAction SilentlyContinue)) {
            throw "No security object found in database $Database"
        }
        # Create permission structure
        $sec = New-Object PSCouchDBSecurity
        # Revoke data permission
        $Data = $sec.ToString()
        $Document = "_security"
        Send-CouchDBRequest -Server $Server -Port $Port -Method "PUT" -Database $Database -Document $Document -Data $Data -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential
    }
}

function Remove-CouchDBAdmin () {
    <#
    .SYNOPSIS
    Remove an admin user.
    .DESCRIPTION
    Remove a CouchDB admin user.
    .NOTES
    CouchDB API:
        DELETE /_node/{node-name}/_config/{section}/{key}
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER Userid
    The user_id than exists admin.
    .PARAMETER Authorization
    The CouchDB authorization form; user and password.
    Authorization format like this: user:password
    ATTENTION: if the password is not specified, it will be prompted.
    .PARAMETER Force
    No confirmation prompt.
    .PARAMETER Ssl
    Set ssl connection on CouchDB server.
    This modify protocol to https and port to 6984.
    .PARAMETER ProxyServer
    Proxy server through which all non-local calls pass.
    Ex. ... -ProxyServer 'http://myproxy.local:8080' ...
    .PARAMETER ProxyCredential
    Proxy server credential. It must be specified with a PSCredential object.
    .EXAMPLE
    Remove-CouchDBAdmin -Userid admin -Authorization "admin:password"
    The example removes "admin" user admin.
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/permission.html#remove-an-admin
    #>
    [CmdletBinding()]
    param(
        [Parameter(ValueFromPipeline = $true)]
        [string] $Server,
        [int] $Port,
        [string] $Node = $(if ((Get-CouchDBNode -Server $Server -Port $Port -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential).all_nodes -contains "couchdb@localhost") { "couchdb@localhost" } else { "couchdb@127.0.0.1" }),
        [Parameter(mandatory = $true, Position = 0)]
        [string] $Userid,
        $Authorization,
        [switch]$Force,
        [switch] $Ssl,
        [string] $ProxyServer,
        [pscredential] $ProxyCredential
    )
    $Database = "_node"
    $Document = "$Node/_config/admins/$Userid"
    if ($Force -or $PSCmdlet.ShouldContinue("Do you wish remove admin user $Userid ?", "Remove $Userid on node $Node")) {
        Send-CouchDBRequest -Server $Server -Port $Port -Method "DELETE" -Database $Database -Document $Document -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential
    }
}

function Remove-CouchDBUser () {
    <#
    .SYNOPSIS
    Remove an user.
    .DESCRIPTION
    Remove a CouchDB user with roles.
    .NOTES
    CouchDB API:
        DELETE /_users
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER Userid
    The user_id than exists in _users database.
    .PARAMETER Revision
    The revision document of user_id.
    .PARAMETER Authorization
    The CouchDB authorization form; user and password.
    Authorization format like this: user:password
    ATTENTION: if the password is not specified, it will be prompted.
    .PARAMETER Force
    No confirmation prompt.
    .PARAMETER Ssl
    Set ssl connection on CouchDB server.
    This modify protocol to https and port to 6984.
    .PARAMETER ProxyServer
    Proxy server through which all non-local calls pass.
    Ex. ... -ProxyServer 'http://myproxy.local:8080' ...
    .PARAMETER ProxyCredential
    Proxy server credential. It must be specified with a PSCredential object.
    .EXAMPLE
    Remove-CouchDBUser -Userid test_user -Revision "2-4705a219cdcca7c72aac4f623f5c46a8" -Authorization "admin:password"
    The example removes test_user standard user.
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/permission.html#remove-a-user
    #>
    [CmdletBinding()]
    param(
        [Parameter(ValueFromPipeline = $true)]
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory = $true, Position = 0)]
        [string] $Userid,
        [Parameter(mandatory = $true, Position = 1)]
        [string] $Revision,
        $Authorization,
        [switch]$Force,
        [switch] $Ssl,
        [string] $ProxyServer,
        [pscredential] $ProxyCredential
    )
    $Database = "_users"
    $Document = & { if ($Userid -like "org.couchdb.user:*") { $Userid } else { "org.couchdb.user:$Userid" } }
    if ($Force -or $PSCmdlet.ShouldContinue("Do you wish remove user $Userid ?", "Remove $Userid on database $Database")) {
        Send-CouchDBRequest -Server $Server -Port $Port -Method "DELETE" -Database $Database -Document $Document -Revision $Revision -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential
    }
}

function Set-CouchDBUser () {
    <#
    .SYNOPSIS
    Set an user properties.
    .DESCRIPTION
    Set a CouchDB user properties with roles. Reset password user.
    .NOTES
    CouchDB API:
        PUT /_users
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER Userid
    The user_id than exists in _users database.
    .PARAMETER Password
    The password in SecureString.
    .PARAMETER Roles
    Array of roles.
    .PARAMETER Revision
    The revision document of user_id.
    .PARAMETER Authorization
    The CouchDB authorization form; user and password.
    Authorization format like this: user:password
    ATTENTION: if the password is not specified, it will be prompted.
    .PARAMETER Ssl
    Set ssl connection on CouchDB server.
    This modify protocol to https and port to 6984.
    .PARAMETER ProxyServer
    Proxy server through which all non-local calls pass.
    Ex. ... -ProxyServer 'http://myproxy.local:8080' ...
    .PARAMETER ProxyCredential
    Proxy server credential. It must be specified with a PSCredential object.
    .EXAMPLE
    $password = "password" | ConvertTo-SecureString -AsPlainText -Force
    Set-CouchDBUser -Userid test_user -Password $password -Revision "2-4705a219cdcca7c72aac4f623f5c46a8" -Authorization "admin:password"
    This example reset password of user "test_user".
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/permission.html#reset-user-password
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory = $true, ValueFromPipeline = $true, Position = 0)]
        [string] $Userid,
        [Parameter(mandatory = $true, Position = 1)]
        [SecureString] $Password,
        [array] $Roles,
        [Parameter(mandatory = $true, Position = 2)]
        [string] $Revision,
        $Authorization,
        [switch] $Ssl,
        [string] $ProxyServer,
        [pscredential] $ProxyCredential
    )
    $Database = "_users"
    $Document = "org.couchdb.user:$Userid"
    if ($Roles.Count -eq 1) {
        $Roles = "[$($Roles | ConvertTo-Json)]"
    } elseif ($Roles.Count -gt 1) {
        $Roles = $Roles | ConvertTo-Json
    } else {
        $Roles = '[]'
    }
    $ClearPassword = ConvertTo-CouchDBPassword -SecurePassword $Password
    $Data = "{
        `"_id`": `"org.couchdb.user:$Userid`",
        `"name`": `"$Userid`",
        `"roles`": $Roles,
        `"type`": `"user`",
        `"password`": `"$ClearPassword`"
}"
    Send-CouchDBRequest -Server $Server -Port $Port -Method "PUT" -Database $Database -Document $Document -Data $Data -Revision $Revision -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential
}

function Set-CouchDBAdmin () {
    <#
    .SYNOPSIS
    Reset password of admin user.
    .DESCRIPTION
    Reset password of CouchDB admin user.
    .NOTES
    CouchDB API:
        PUT /_node/{node-name}/_config/{section}/{key}
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER Node
    The CouchDB node of cluster. Default is couchdb@localhost.
    .PARAMETER Userid
    The user_id than exists in _users database.
    .PARAMETER Password
    The password in SecureString.
    .PARAMETER Authorization
    The CouchDB authorization form; user and password.
    Authorization format like this: user:password
    ATTENTION: if the password is not specified, it will be prompted.
    .PARAMETER Ssl
    Set ssl connection on CouchDB server.
    This modify protocol to https and port to 6984.
    .PARAMETER ProxyServer
    Proxy server through which all non-local calls pass.
    Ex. ... -ProxyServer 'http://myproxy.local:8080' ...
    .PARAMETER ProxyCredential
    Proxy server credential. It must be specified with a PSCredential object.
    .EXAMPLE
    $password = "password" | ConvertTo-SecureString -AsPlainText -Force
    Set-CouchDBAdmin -Userid admin -Password $password -Authorization "admin:password"
    This example reset password of "admin" user admin.
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/permission.html#reset-admin-password
    #>
    [CmdletBinding()]
    param(
        [Parameter(ValueFromPipeline = $true)]
        [string] $Server,
        [int] $Port,
        [string] $Node = $(if ((Get-CouchDBNode -Server $Server -Port $Port -Authorization $Authorization -Ssl:$Ssl).all_nodes -contains "couchdb@localhost") { "couchdb@localhost" } else { "couchdb@127.0.0.1" }),
        [Parameter(mandatory = $true, Position = 0)]
        [string] $Userid,
        [Parameter(mandatory = $true, Position = 1)]
        [SecureString] $Password,
        $Authorization,
        [switch] $Ssl,
        [string] $ProxyServer,
        [pscredential] $ProxyCredential
    )
    $Database = "_node"
    $Document = "$Node/_config/admins/$Userid"
    $ClearPassword = ConvertTo-CouchDBPassword -SecurePassword $Password
    $Data = "`"$ClearPassword`""
    Send-CouchDBRequest -Server $Server -Port $Port -Method "PUT" -Database $Database -Document $Document -Data $Data -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential
}