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
        [string] $Node = $(if ((Get-CouchDBNode -Server $Server -Port $Port -Authorization $Authorization -Ssl:$Ssl).all_nodes -contains "couchdb@localhost") { "couchdb@localhost" } else { "couchdb@127.0.0.1" }),
        [Parameter(mandatory = $true)]
        [string] $Userid,
        [Parameter(mandatory = $true)]
        [SecureString] $Password,
        [string] $Authorization,
        [switch] $Ssl
    )
    $Database = "_node"
    $Document = "$Node/_config/admins/$Userid"
    $ClearPassword = ConvertTo-CouchDBPassword -SecurePassword $Password
    $Data = "`"$ClearPassword`""
    Send-CouchDBRequest -Server $Server -Port $Port -Method "PUT" -Database $Database -Document $Document -Data $Data -Authorization $Authorization -Ssl:$Ssl
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
        [Parameter(mandatory = $true)]
        [string] $Userid,
        [Parameter(mandatory = $true)]
        [SecureString] $Password,
        [array] $Roles,
        [string] $Authorization,
        [switch] $Ssl
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
    Send-CouchDBRequest -Server $Server -Port $Port -Method "PUT" -Database $Database -Document $Document -Data $Data -Authorization $Authorization -Ssl:$Ssl
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
        [Parameter(mandatory = $true, ValueFromPipeline = $true)]
        [string] $Database,
        $Data,
        [string] $Authorization,
        [switch] $Ssl
    )
    # Check data is string or PSCouchDBSecurity
    if ($Data -is [PSCouchDBSecurity]) {
        $Data = $Data.ToString()
    }
    $Document = '_security'
    Send-CouchDBRequest -Server $Server -Port $Port -Method "PUT" -Database $Database -Document $Document -Data $Data -Authorization $Authorization -Ssl:$Ssl
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
    .PARAMETER Authorization
    The CouchDB authorization form; user and password.
    Authorization format like this: user:password
    ATTENTION: if the password is not specified, it will be prompted.
    .PARAMETER Ssl
    Set ssl connection on CouchDB server.
    This modify protocol to https and port to 6984.
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
        [Parameter(mandatory = $true, ValueFromPipeline = $true)]
        [string] $Database,
        [string] $Authorization,
        [switch] $Ssl
    )
    $Document = "_security"
    Send-CouchDBRequest -Server $Server -Port $Port -Method "GET" -Database $Database -Document $Document -Authorization $Authorization -Ssl:$Ssl
}

function Revoke-CouchDBDatabasePermission () {
    <#
    .SYNOPSIS
    Revoke permission on database.
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
        [Parameter(mandatory = $true, ValueFromPipeline = $true)]
        [string] $Database,
        [string] $Authorization,
        [switch]$Force,
        [switch] $Ssl
    )
    if ($Force -or $PSCmdlet.ShouldContinue("Do you wish revoke all permission on database $Database ?", "Revoke all permission on database $Database")) {
        # Get a current security permission
        if (-not(Get-CouchDBDocument -Server $Server -Port $Port -Database $Database -Document '_security' -Info -Authorization $Authorization -Ssl:$Ssl -ErrorAction SilentlyContinue)) {
            throw "No security object found in database $Database"
        }
        # Create permission structure
        $permission = [PSCustomObject] @{
            admins  = @{ names = @(); roles = @() }
            members = @{ names = @(); roles = @() }
        }
        # Revoke data permission
        $Data = $permission | ConvertTo-Json -Depth 5
        $Document = "_security"
        Send-CouchDBRequest -Server $Server -Port $Port -Method "PUT" -Database $Database -Document $Document -Data $Data -Authorization $Authorization -Ssl:$Ssl
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
        [string] $Node = $(if ((Get-CouchDBNode -Server $Server -Port $Port -Authorization $Authorization -Ssl:$Ssl).all_nodes -contains "couchdb@localhost") { "couchdb@localhost" } else { "couchdb@127.0.0.1" }),
        [Parameter(mandatory = $true)]
        [string] $Userid,
        [string] $Authorization,
        [switch]$Force,
        [switch] $Ssl
    )
    $Database = "_node"
    $Document = "$Node/_config/admins/$Userid"
    if ($Force -or $PSCmdlet.ShouldContinue("Do you wish remove admin user $Userid ?", "Remove $Userid on node $Node")) {
        Send-CouchDBRequest -Server $Server -Port $Port -Method "DELETE" -Database $Database -Document $Document -Authorization $Authorization -Ssl:$Ssl
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
        [Parameter(mandatory = $true)]
        [string] $Userid,
        [Parameter(mandatory = $true)]
        [string] $Revision,
        [string] $Authorization,
        [switch]$Force,
        [switch] $Ssl
    )
    $Database = "_users"
    $Document = & { if ($Userid -like "org.couchdb.user:*") { $Userid } else { "org.couchdb.user:$Userid" } }
    if ($Force -or $PSCmdlet.ShouldContinue("Do you wish remove user $Userid ?", "Remove $Userid on database $Database")) {
        Send-CouchDBRequest -Server $Server -Port $Port -Method "DELETE" -Database $Database -Document $Document -Revision $Revision -Authorization $Authorization -Ssl:$Ssl
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
        [Parameter(mandatory = $true, ValueFromPipeline = $true)]
        [string] $Userid,
        [Parameter(mandatory = $true)]
        [SecureString] $Password,
        [array] $Roles,
        [Parameter(mandatory = $true)]
        [string] $Revision,
        [string] $Authorization,
        [switch] $Ssl
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
    Send-CouchDBRequest -Server $Server -Port $Port -Method "PUT" -Database $Database -Document $Document -Data $Data -Revision $Revision -Authorization $Authorization -Ssl:$Ssl
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
        [Parameter(mandatory = $true)]
        [string] $Userid,
        [Parameter(mandatory = $true)]
        [SecureString] $Password,
        [string] $Authorization,
        [switch] $Ssl
    )
    $Database = "_node"
    $Document = "$Node/_config/admins/$Userid"
    $ClearPassword = ConvertTo-CouchDBPassword -SecurePassword $Password
    $Data = "`"$ClearPassword`""
    Send-CouchDBRequest -Server $Server -Port $Port -Method "PUT" -Database $Database -Document $Document -Data $Data -Authorization $Authorization -Ssl:$Ssl
}