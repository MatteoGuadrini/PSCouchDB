function Send-CouchDBRequest {
    <#
    .SYNOPSIS
    Sends a request to a CouchDB database server.
    .DESCRIPTION
    Sends a REST request to a CouchDB database server.
    .EXAMPLE
    Send-CouchDBRequest -Method PUT -Database example -Authorization "admin:passw0rd"
    #>
    param (
        [string] $Method,
        [string] $Server,
        [int] $Port,
        [string] $Database,
        [string] $Document,
        [string] $Authorization,
        [string] $Revision,
        [string] $Attachment,
        [string] $Data
    )
    # Set default server
    if (-not($Server)) {
        $Server = 'localhost'
    }
    # Set default port
     if (-not($Port)) {
        $Port = 5984
    }
    # Initialize option of command
    $options = @{}
    # Analize method for web request
    switch ($Method) {
        "GET"       { $options.Add("Method","GET") }
        "PUT"       { $options.Add("Method","PUT") }
        "DELETE"    { $options.Add("Method","DELETE") }
        "POST"      { $options.Add("Method","POST") }
        Default     { $options.Add("Method","GET") }
    }
    # Build the url
    $url = "http://${Server}:$Port"
    # Set database
    if ($Database) {
        $url += "/$Database"
    }
    # Set document
    if (($Document) -and ($Database)) {
        $url += "/$Document"
    }
    # Set attachment
    if (($Attachment) -and ($Document) -and ($Database)) {
        if (Test-Path $Attachment) {
            $AttachmentName = (Get-Item $Attachment).Name
            $options.Add("ContentType","multipart/form-data")
            $options.Add("InFile",$Attachment)
        } else {
            $AttachmentName = $Attachment
        }
        $url += "/$AttachmentName"
    }
    # Check revision
    if ($Revision) {
        $url += "?rev=$Revision"
    }
    # Add url
    $options.Add("Uri",$url)
    # Check the credential for access on database
    if ($Authorization) {
        $base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(($Authorization)))
        $options.Add("Headers",@{Authorization=("Basic {0}" -f $base64AuthInfo)})
    }
    # Build the json data
    if (($Data) -and ($Document) -and ($Database)) {
        $options.Add("ContentType","application/json")
        $options.Add("Body",$Data)
    }
    # Invoke REST with method
    $results = Invoke-RestMethod @options
    return $results
}

function Get-CouchDBDatabase ($Server, $Port, $Database = "_all_dbs", $Authorization) {
    <#
    .SYNOPSIS
    Get a database.
    .DESCRIPTION
    Get a CouchDB database informations. 
    .EXAMPLE
    New-CouchDBDatabase -Database example -Authorization "admin:passw0rd"
    #>
    Send-CouchDBRequest -Server $Server -Port $Port -Method "GET" -Database $Database -Authorization $Authorization
}

function Get-CouchDBDocument ($Server, $Port, $Database = $(throw "Please specify the database name."), $Document = "_all_docs", $Data, $Authorization) {
    <#
    .SYNOPSIS
    Get a document.
    .DESCRIPTION
    Get a CouchDB document json data. 
    .EXAMPLE
    $data = '{"album":"Kill em all", "band":"Metallica"}'
    New-CouchDBDatabase -Database example -Document "001" -Data $data -Authorization "admin:passw0rd"
    #>
    Send-CouchDBRequest -Server $Server -Port $Port -Method "GET" -Database $Database -Document $Document -Data $Data -Authorization $Authorization
}

# TODO: Add outfile parameter on ivoke-restmethod for download file attachment
function Get-CouchDBAttachment ($Server, $Port, $Database = $(throw "Please specify the database name."), $Document = $(throw "Please specify the document id."), $Attachment, $Authorization) {
    <#
    .SYNOPSIS
    Get attachment.
    .DESCRIPTION
    Get attachment from CouchDB document. 
    .EXAMPLE
    New-CouchDBDatabase -Database example -Document "001" -Attachment test.html -Authorization "admin:passw0rd"
    #>
    Send-CouchDBRequest -Server $Server -Port $Port -Method "GET" -Database $Database -Document $Document -Attachment $Attachment -Authorization $Authorization
}

function Get-CouchDBUser ($Server, $Port, $Database = "_users", $Userid = $(throw "Please specify the username."), $Authorization) {
    <#
    .SYNOPSIS
    Get an user.
    .DESCRIPTION
    Get a CouchDB user. 
    .EXAMPLE
    Get-CouchDBUser -Userid test_user -Authorization "admin:passw0rd"
    #>
    $Document = "org.couchdb.user:$Userid"
    Send-CouchDBRequest -Server $Server -Port $Port -Method "GET" -Database $Database -Document $Document -Authorization $Authorization
}

function Set-CouchDBDocument ($Server, $Port, $Database = $(throw "Please specify the database name."), $Document = $(throw "Please specify the document id."), $Revision = $(throw "Please specify the revision id."), $Data, $Authorization) {
    <#
    .SYNOPSIS
    Modify a document.
    .DESCRIPTION
    Modify a CouchDB document json data. 
    .EXAMPLE
    $data = '{"album":"...and justice for all", "band":"Metallica"}'
    Set-CouchDBDatabase -Database example -Document "001" -Revision "2-4705a219cdcca7c72aac4f623f5c46a8" -Data $data -Authorization "admin:passw0rd"
    #>
    Send-CouchDBRequest -Server $Server -Port $Port -Method "PUT" -Database $Database -Document $Document -Revision $Revision -Data $Data -Authorization $Authorization
}

function Set-CouchDBAttachment ($Server, $Port, $Database = $(throw "Please specify the database name."), $Document = $(throw "Please specify the document id."), $Revision = $(throw "Please specify the revision id."), $Attachment, $Authorization) {
    <#
    .SYNOPSIS
    Modify attachment.
    .DESCRIPTION
    Modify attachment from CouchDB document. 
    .EXAMPLE
    Set-CouchDBDatabase -Database example -Document "001" -Attachment test.html -Authorization "admin:passw0rd"
    #>
    Send-CouchDBRequest -Server $Server -Port $Port -Method "PUT" -Database $Database -Document $Document -Revision $Revision -Attachment $Attachment -Authorization $Authorization
}

function Set-CouchDBUser ($Server, $Port, $Database = "_users", $Userid = $(throw "Please specify the username."), $Password = $(throw "Please specify a password for username $Userid"), $Roles, $Revision = $(throw "Please specify the revision id."), $Authorization) {
    <#
    .SYNOPSIS
    Set an user properties.
    .DESCRIPTION
    Set a CouchDB user properties with roles. Reset password user.
    .EXAMPLE
    Set-CouchDBUser -Userid test_user -Password Passw0rd -Revision "2-4705a219cdcca7c72aac4f623f5c46a8" -Authorization "admin:passw0rd"
    #>
    $Document = "org.couchdb.user:$Userid"
    if ($Roles) {
        $Roles = $Roles | ConvertTo-Json
    } else {
        $Roles = '[]'
    }
    $Data = "{
        `"_id`": `"org.couchdb.user:$Userid`",
        `"name`": `"$Userid`",
        `"roles`": $Roles,
        `"type`": `"user`",
        `"password`": `"$Password`"
}"
    Send-CouchDBRequest -Server $Server -Port $Port -Method "PUT" -Database $Database -Document $Document -Data $Data -Revision $Revision -Authorization $Authorization
}

function Grant-CouchDBDatabasePermission ($Server, $Port, $Database = $(throw "Please specify the database name."), [array]$AdminUser, [array]$AdminRoles, [array]$ReaderUser, [array]$UserRoles, $Authorization) {
    <#
    .SYNOPSIS
    Grant permission on database.
    .DESCRIPTION
    Grant permission on database. Specify Admins and/or Readers. 
    .EXAMPLE
    Grant-CouchDBDatabasePermission -Database example -AdminUser admin,technician -ReaderUser user1 -Authorization "admin:passw0rd"
    #>
    # Check if admin user exists
    foreach ($User in $AdminUser) {
        if (-not((Get-CouchDBUser -Database '_users' -Userid $User -Authorization $Authorization).name -eq $User)) {
            throw "Admin user $User not exists!"
        }
    }
    # Check if reader user exists
    foreach ($User in $ReaderUser) {
        if (-not((Get-CouchDBUser -Database '_users' -Userid $User -Authorization $Authorization).name -eq $User)) {
            throw "Reader user $User not exists!"
        }
    }
    if ($AdminUser.Count -eq 1) {
        $AdminUser = "[$($AdminUser | ConvertTo-Json)]"
    } elseif ($AdminUser.Count -gt 1) {
        $AdminUser = $AdminUser | ConvertTo-Json
    } else {
        $AdminUser = '[]'
    }
    if ($AdminRoles.Count -eq 1) {
        $AdminRoles = "[$($AdminRoles | ConvertTo-Json)]"
    } elseif ($AdminRoles.Count -gt 1) {
        $AdminRoles = $AdminRoles | ConvertTo-Json
    } else {
        $AdminRoles = '[]'
    }
    if ($ReaderUser.Count -eq 1) {
        $ReaderUser = "[$($ReaderUser | ConvertTo-Json)]"
    } elseif ($ReaderUser.Count -gt 1) {
        $ReaderUser = $ReaderUser | ConvertTo-Json
    } else {
        $ReaderUser = '[]'
    }
    if ($UserRoles.Count -eq 1) {
        $UserRoles = "[$($UserRoles | ConvertTo-Json)]"
    } elseif ($UserRoles.Count -gt 1) {
        $UserRoles = $UserRoles | ConvertTo-Json
    } else {
        $UserRoles = '[]'
    }
    # Create data permission
    $Data = "
    {
        `"admins`": {
            `"names`": $AdminUser, 
            `"roles`": $AdminRoles
        }, 
        `"members`": {
            `"names`": $ReaderUser,
            `"roles`": $UserRoles
        }
    }
    "
    $Document = "_security"
    Send-CouchDBRequest -Server $Server -Port $Port -Method "PUT" -Database $Database -Document $Document -Data $Data -Authorization $Authorization
}

function Revoke-CouchDBDatabasePermission ($Server, $Port, $Database = $(throw "Please specify the database name."), $Authorization) {
    <#
    .SYNOPSIS
    Revoke permission on database.
    .DESCRIPTION
    Revoke permission on database. Specify Admins and/or Readers. 
    .EXAMPLE
    Revoke-CouchDBDatabasePermission -Database example -Authorization "admin:passw0rd"
    #>
    # Get a current security permission
    if (-not(Get-CouchDBDocument -Database $Database -Document '_security' -Authorization $Authorization)) {
        throw "No security object found in database $Database"
    }
    # Revoke data permission
    $Data = "
    {
        `"admins`": {
            `"names`": [], 
            `"roles`": []
        }, 
        `"members`": {
            `"names`": [],
            `"roles`": []
        }
    }
    "
    $Document = "_security"
    Send-CouchDBRequest -Server $Server -Port $Port -Method "PUT" -Database $Database -Document $Document -Data $Data -Authorization $Authorization
}

function New-CouchDBDatabase ($Server, $Port, $Database = $(throw "Please specify the database name."), $Authorization) {
    <#
    .SYNOPSIS
    Create a new database.
    .DESCRIPTION
    Create a new CouchDB database. 
    .EXAMPLE
    New-CouchDBDatabase -Database example -Authorization "admin:passw0rd"
    #>
    Send-CouchDBRequest -Server $Server -Port $Port -Method "PUT" -Database $Database -Authorization $Authorization
}

function New-CouchDBDocument ($Server, $Port, $Database = $(throw "Please specify the database name."), $Document = $(throw "Please specify the document id."), $Data = $(throw "Please specify a valid json data."), $Authorization) {
    <#
    .SYNOPSIS
    Create a new document.
    .DESCRIPTION
    Create a new CouchDB document with json data. 
    .EXAMPLE
    $data = '{"name":"Jhon", "surname":"Lennon"}'
    New-CouchDBDatabase -Database example -Document "001" -Data $data -Authorization "admin:passw0rd"
    #>
    Send-CouchDBRequest -Server $Server -Port $Port -Method "PUT" -Database $Database -Document $Document -Data $Data -Authorization $Authorization
}

function New-CouchDBAttachment ($Server, $Port, $Database = $(throw "Please specify the database name."), $Document = $(throw "Please specify the document id."), $Attachment = $(throw "Please specify the path of attachment."), $Revision = $(throw "Please specify the revision id."), $Authorization) {
    <#
    .SYNOPSIS
    Create a new attachment document.
    .DESCRIPTION
    Create a new CouchDB attachment document. 
    .EXAMPLE
    New-CouchDBDatabase -Database example -Document "001" -Attachment C:\test.html -Revision "2-4705a219cdcca7c72aac4f623f5c46a8" -Authorization "admin:passw0rd"
    #>
    Send-CouchDBRequest -Server $Server -Port $Port -Method "PUT" -Database $Database -Document $Document -Attachment $Attachment -Revision $Revision -Authorization $Authorization
}

function New-CouchDBUser ($Server, $Port, $Database = "_users", $Userid = $(throw "Please specify the username."), $Password = $(throw "Please specify a password for username $Userid"), $Roles, $Authorization) {
    <#
    .SYNOPSIS
    Create a new user.
    .DESCRIPTION
    Create a new CouchDB user with roles. 
    .EXAMPLE
    New-CouchDBUser -Userid test_user -Password Passw0rd -Authorization "admin:passw0rd"
    #>
    $Document = "org.couchdb.user:$Userid"
    if ($Roles.Count -eq 1) {
        $Roles = "[$($Roles | ConvertTo-Json)]"
    } elseif ($Roles.Count -gt 1) {
        $Roles = $Roles | ConvertTo-Json
    } else {
        $Roles = '[]'
    }
    $Data = "{
        `"_id`": `"org.couchdb.user:$Userid`",
        `"name`": `"$Userid`",
        `"roles`": $Roles,
        `"type`": `"user`",
        `"password`": `"$Password`"
}"
    Send-CouchDBRequest -Server $Server -Port $Port -Method "PUT" -Database $Database -Document $Document -Data $Data -Authorization $Authorization
}

function Remove-CouchDBDatabase () {
    <#
    .SYNOPSIS
    Remove a database.
    .DESCRIPTION
    Remove a CouchDB database. 
    .EXAMPLE
    Remove-CouchDBDatabase -Database example -Authorization "admin:passw0rd"
    #>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        $Server, 
        $Port, 
        $Database = $(throw "Please specify the database name."), 
        $Authorization
    )
    if ($PSCmdlet.ShouldContinue("Do you wish remove database $Database?","Remove database $Databasee")) {
        Send-CouchDBRequest -Server $Server -Port $Port -Method "DELETE" -Database $Database -Authorization $Authorization
    }
}

function Remove-CouchDBDocument () {
    <#
    .SYNOPSIS
    Remove a document.
    .DESCRIPTION
    Remove a CouchDB document with json data. 
    .EXAMPLE
    Remove-CouchDBDatabase -Database example -Document "001" -Revision "2-4705a219cdcca7c72aac4f623f5c46a8" -Authorization "admin:passw0rd"
    #>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        $Server, 
        $Port, 
        $Database = $(throw "Please specify the database name."), 
        $Document = $(throw "Please specify the document id."), 
        $Revision = $(throw "Please specify the revision id."), 
        $Authorization
    )
    if ($PSCmdlet.ShouldContinue("Do you wish remove document $Document on database $Database?","Remove document $Document on database $Databasee")) {
        Send-CouchDBRequest -Server $Server -Port $Port -Method "DELETE" -Database $Database -Document $Document -Revision $Revision -Authorization $Authorization
    }
}

function Remove-CouchDBAttachment () {
    <#
    .SYNOPSIS
    Remove an attachment document.
    .DESCRIPTION
    Remove a CouchDB attachment document. 
    .EXAMPLE
    Remove-CouchDBDatabase -Database example -Document "001" -Attachment test.html -Revision "2-4705a219cdcca7c72aac4f623f5c46a8" -Authorization "admin:passw0rd"
    #>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        $Server, 
        $Port, 
        $Database = $(throw "Please specify the database name."), 
        $Document = $(throw "Please specify the document id."), 
        $Attachment = $(throw "Please specify the path of attachment."), 
        $Revision = $(throw "Please specify the revision id."), 
        $Authorization
    )
    if ($PSCmdlet.ShouldContinue("Do you wish remove attachment $Attachment in document $Document on database $Database?","Remove attachment $Attachment in document $Document on database $Databasee")) {
        Send-CouchDBRequest -Server $Server -Port $Port -Method "DELETE" -Database $Database -Document $Document -Attachment $Attachment -Revision $Revision -Authorization $Authorization
    }
}

function Remove-CouchDBUser () {
    <#
    .SYNOPSIS
    Remove an user.
    .DESCRIPTION
    Remove a CouchDB user with roles. 
    .EXAMPLE
    Remove-CouchDBUser -Userid test_user -Revision "2-4705a219cdcca7c72aac4f623f5c46a8" -Authorization "admin:passw0rd"
    #>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        $Server, 
        $Port, 
        $Database = "_users", 
        $Userid = $(throw "Please specify the username."), 
        $Revision = $(throw "Please specify the revision id."), 
        $Authorization
    )
    $Document = "org.couchdb.user:$Userid"
    if ($PSCmdlet.ShouldContinue("Do you wish remove user $Userid?","Remove $Userid on database $Database")) {
        Send-CouchDBRequest -Server $Server -Port $Port -Method "DELETE" -Database $Database -Document $Document -Revision $Revision -Authorization $Authorization
    }
}

function Find-CouchDBDocuments () {
    <#
    .SYNOPSIS
    Find document data in a database.
    .DESCRIPTION
    Find document data in a CouchDB database.
    .EXAMPLE
    Find-CouchDBDocuments -Database example -Selector "color" -Value "red" -Fields _id,color -Operator eq -Authorization "read_user:passw0rd"
    #>
    [cmdletbinding()]
    param (
        $Server, 
        $Port, 
        $Database = $(throw "Please specify the database name."), 
        $Selector, 
        $Value, 
        [array]$Fields,
        $Sort,
        [ValidateSet('lt','lte','eq','ne','gte','gt','exists','type','in','nin','size','regex')]
        [string]$Operator,
        $Authorization
    )

    $Document = '_find'
    # Compose JSON data
    $Data = '{"selector": {'
    if ($Selector -and $Value) {
        $Data += "`"$Selector`":{"
    }
    switch ($Operator) {
        'lt'        { $Data += '"$lt":' ;       if ($Selector -and $Value) { $Data += "`"$Value`"}}" } }
        'lte'       { $Data += '"$lte":' ;      if ($Selector -and $Value) { $Data += "`"$Value`"}}" } }
        'eq'        { $Data += '"$eq":' ;       if ($Selector -and $Value) { $Data += "`"$Value`"}}" } }
        'ne'        { $Data += '"$ne":' ;       if ($Selector -and $Value) { $Data += "`"$Value`"}}" } }
        'gte'       { $Data += '"$gte":' ;      if ($Selector -and $Value) { $Data += "`"$Value`"}}" } }
        'gt'        { $Data += '"$gt":' ;       if ($Selector -and $Value) { $Data += "`"$Value`"}}" } }
        'exists'    { $Data += '"$exists":' ;   if ($Selector -and $Value) { $Data += "$Value}}" } } 
        'type'      { $Data += '"$type":' ;     if ($Selector -and $Value) { $Data += "`"$Value`"}}" } }
        'in'        { $Data += '"$in":' ;       if ($Selector -and $Value) { $Data += "[`"$Value`"]}}" } }
        'nin'       { $Data += '"$nin":' ;      if ($Selector -and $Value) { $Data += "[`"$Value`"]}}" } }
        'size'      { $Data += '"$size":' ;     if ($Selector -and $Value) { $Data += "$Value}}" } }
        'regex'     { $Data += '"$regex":' ;    if ($Selector -and $Value) { $Data += "`"$Value`"}}" } }
    }
    if ($Fields) {
        if ($Fields.Count -gt 1) {
            $Fields = $Fields | ConvertTo-Json
        } else {
            $Fields = "[`"$Fields`"]"
        }
        $Data += ",`"fields`": $Fields"
    }
    if ($Sort) {
        $Data += ",`"sort`": [{`"$($Sort)`": `"asc`"}]"
    }
    $Data += '}'
    Send-CouchDBRequest -Server $Server -Port $Port -Method "POST" -Database $Database -Document $Document -Data $Data -Authorization $Authorization
}