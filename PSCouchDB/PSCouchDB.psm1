function Send-CouchDBRequest {
    <#
    .SYNOPSIS
    Sends a request to a CouchDB database server.
    .DESCRIPTION
    Sends a REST request to a CouchDB database server.
    .EXAMPLE
    Send-CouchDBRequest -Method PUT -Database example -Authorization "admin:passw0rd"
    #>
    [CmdletBinding()]
    param (
        [string] $Method,
        [string] $Server,
        [int] $Port,
        [string] $Database,
        [string] $Document,
        [string] $Authorization,
        [string] $Revision,
        [string] $Attachment,
        [string] $Data,
        [string] $OutFile
    )
    # Set default server
    Write-Verbose -Message "Check if variable `$Server is null, else set variable to 'localhost'"
    if (-not($Server)) {
        $Server = 'localhost'
        Write-Debug -Message "`$Server is $Server"
    }
    # Set default port
    Write-Verbose -Message "Check if variable `$Port is null, else set variable to '5984'"
     if (-not($Port)) {
        $Port = 5984
        Write-Debug -Message "`$Port is $Port"
    }
    # Initialize option of command
    $options = @{}
    # Analize method for web request
    Write-Verbose -Message "Check http method, default is GET"
    Write-Debug -Message "`$Method is $Method"
    switch ($Method) {
        "GET"       { $options.Add("Method","GET") }
        "PUT"       { $options.Add("Method","PUT") }
        "DELETE"    { $options.Add("Method","DELETE") }
        "POST"      { $options.Add("Method","POST") }
        Default     { $options.Add("Method","GET") }
    }
    # Build the url
    Write-Verbose -Message "Build the url"
    $url = "http://${Server}:$Port"
    # Set database
    Write-Verbose -Message "Add database to url, if exists"
    if ($Database) {
        $url += "/$Database"
        Write-Debug -Message "`$Database is $Database"
    }
    # Set document
    Write-Verbose -Message "Add document to url, if exists"
    if (($Document) -and ($Database)) {
        $url += "/$Document"
        Write-Debug -Message "`$Document is $Document"
    }
    # Set attachment
    Write-Verbose -Message "Add attachment to url, if exists"
    if (($Attachment) -and ($Document) -and ($Database)) {
        Write-Debug -Message "`$Attachment is $Attachment"
        if (Test-Path $Attachment) {
            $AttachmentName = (Get-Item $Attachment).Name
            $options.Add("ContentType","multipart/form-data")
            $options.Add("InFile",$Attachment)
            Write-Debug -Message "Tested attachment path $Attachment"
        } else {
            $AttachmentName = $Attachment
            Write-Debug -Message "Tested name of attachment $AttachmentName"
            if ($OutFile) {
                $options.Add("OutFile",$OutFile)
                Write-Debug -Message "Get attachment $AttachmentName to file $OutFile"
            }
        }
        $url += "/$AttachmentName"
    }
    # Check revision
    Write-Verbose -Message "Add revision to url, if exists"
    if ($Revision) {
        $url += "?rev=$Revision"
        Write-Debug -Message "`$Revision is $Revision"
    }
    # Add url
    Write-Verbose -Message "Compose the url: $url"
    $options.Add("Uri",$url)
    # Check the credential for access on database
    Write-Verbose -Message "Check authorization"
    if ($Authorization) {
        $base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(($Authorization)))
        $options.Add("Headers",@{Authorization=("Basic {0}" -f $base64AuthInfo)})
        Write-Debug -Message "`$Authorization is $Authorization"
    }
    # Build the json data
    Write-Verbose -Message "Check json data"
    if (($Data) -and ($Document) -and ($Database)) {
        $options.Add("ContentType","application/json")
        $options.Add("Body",([System.Text.Encoding]::UTF8.GetBytes($Data)))
        Write-Debug -Message "`$Data is $Data"
    }
    # Invoke REST with method
    Write-Verbose -Message "Finally, send request to CouchDB server $Server"
    $results = Invoke-RestMethod @options
    return $results
}

function Get-CouchDBDatabase () {
    <#
    .SYNOPSIS
    Get a database.
    .DESCRIPTION
    Get a CouchDB database informations. 
    .EXAMPLE
    Get-CouchDBDatabase -Database example -Authorization "admin:passw0rd"
    #>
    [CmdletBinding()]
    param(
        [string] $Server, 
        [int] $Port, 
        [string] $Database = "_all_dbs", 
        [string] $Authorization
    )
    Send-CouchDBRequest -Server $Server -Port $Port -Method "GET" -Database $Database -Authorization $Authorization
}

function Get-CouchDBDocument () {
    <#
    .SYNOPSIS
    Get a document.
    .DESCRIPTION
    Get a CouchDB document json data. 
    .EXAMPLE
    Get-CouchDBDocument -Database example -Document "001"
    #>
    [CmdletBinding()]
    param(
        [string] $Server, 
        [int] $Port, 
        [string] $Database = $(throw "Please specify the database name."),
        [string] $Document = "_all_docs", 
        [string] $Data, 
        [string] $Authorization
    )
    Send-CouchDBRequest -Server $Server -Port $Port -Method "GET" -Database $Database -Document $Document -Data $Data -Authorization $Authorization
}

# TODO: Add outfile parameter on ivoke-restmethod for download file attachment
function Get-CouchDBAttachment () {
    <#
    .SYNOPSIS
    Get attachment.
    .DESCRIPTION
    Get attachment from CouchDB document. 
    .EXAMPLE
    Get-CouchDBAttachment -Database example -Document "001" -Attachment test.html -Authorization "admin:passw0rd"
    .EXAMPLE
    Get-CouchDBAttachment -Database example -Document "001" -Attachment test.html -OutFile C:\out.html -Authorization "admin:passw0rd"
    #>
    [CmdletBinding()]
    param(
        [string] $Server, 
        [int] $Port, 
        [string] $Database = $(throw "Please specify the database name."), 
        [string] $Document = $(throw "Please specify the document id."), 
        [string] $Attachment,
        [string] $OutFile,
        [string] $Authorization
    )
    Send-CouchDBRequest -Server $Server -Port $Port -Method "GET" -Database $Database -Document $Document -Attachment $Attachment -OutFile $OutFile -Authorization $Authorization
}

function Get-CouchDBUser () {
    <#
    .SYNOPSIS
    Get an user.
    .DESCRIPTION
    Get a CouchDB user. 
    .EXAMPLE
    Get-CouchDBUser -Userid test_user -Authorization "admin:passw0rd"
    #>
    [CmdletBinding()]
    param(
        [string] $Server, 
        [int] $Port, 
        [string] $Database = "_users", 
        [string] $Userid = $(throw "Please specify the username."), 
        [string] $Authorization
    )
    $Document = "org.couchdb.user:$Userid"
    Send-CouchDBRequest -Server $Server -Port $Port -Method "GET" -Database $Database -Document $Document -Authorization $Authorization
}

function Get-CouchDBAdmin () {
    <#
    .SYNOPSIS
    Get an admin user.
    .DESCRIPTION
    Get a CouchDB admin user. 
    .EXAMPLE
    Get-CouchDBAdmin -Authorization "admin:passw0rd"
    #>
    [CmdletBinding()]
    param(
        [string] $Server, 
        [int] $Port, 
        [string] $Database = "_node",
        [string] $Node = "couchdb@localhost",
        [string] $Authorization
    )
    $Document = "$Node/_config/admins"
    Send-CouchDBRequest -Server $Server -Port $Port -Method "GET" -Database $Database -Document $Document -Data $Data -Authorization $Authorization
}

function Get-CouchDBConfiguration () {
    <#
    .SYNOPSIS
    Get configuration.
    .DESCRIPTION
    Get configuration of CouchDB. 
    .EXAMPLE
    Get-CouchDBConfiguration -Authorization "admin:passw0rd"
    #>
    [CmdletBinding()]
    param(
        [string] $Server, 
        [int] $Port, 
        [string] $Database = "_node",
        [string] $Node = "couchdb@localhost",
        [string] $Authorization
    )
    $Document = "$Node/_config"
    Send-CouchDBRequest -Server $Server -Port $Port -Method "GET" -Database $Database -Document $Document -Data $Data -Authorization $Authorization
}

function Set-CouchDBDocument () {
    <#
    .SYNOPSIS
    Modify a document.
    .DESCRIPTION
    Modify a CouchDB document json data. 
    .EXAMPLE
    $data = '{"album":"...and justice for all", "band":"Metallica"}'
    Set-CouchDBDocument -Database example -Document "001" -Revision "2-4705a219cdcca7c72aac4f623f5c46a8" -Data $data -Authorization "admin:passw0rd"
    #>
    [CmdletBinding()]
    param(
        [string] $Server, 
        [int] $Port, 
        [string] $Database = $(throw "Please specify the database name."), 
        [string] $Document = $(throw "Please specify the document id."), 
        [string] $Revision = $(throw "Please specify the revision id."), 
        [string] $Data, 
        [string] $Authorization
    )
    Send-CouchDBRequest -Server $Server -Port $Port -Method "PUT" -Database $Database -Document $Document -Revision $Revision -Data $Data -Authorization $Authorization
}

function Set-CouchDBAttachment () {
    <#
    .SYNOPSIS
    Modify attachment.
    .DESCRIPTION
    Modify attachment from CouchDB document. 
    .EXAMPLE
    Set-CouchDBAttachment -Database example -Document "001" -Attachment C:\test.html -Authorization "admin:passw0rd"
    #>
    [CmdletBinding()]
    param(
        [string] $Server, 
        [int] $Port, 
        [string] $Database = $(throw "Please specify the database name."), 
        [string] $Document = $(throw "Please specify the document id."), 
        [string] $Revision = $(throw "Please specify the revision id."), 
        [string] $Attachment, 
        [string] $Authorization
    )
    Send-CouchDBRequest -Server $Server -Port $Port -Method "PUT" -Database $Database -Document $Document -Revision $Revision -Attachment $Attachment -Authorization $Authorization
}

function Set-CouchDBUser () {
    <#
    .SYNOPSIS
    Set an user properties.
    .DESCRIPTION
    Set a CouchDB user properties with roles. Reset password user.
    .EXAMPLE
    Set-CouchDBUser -Userid test_user -Password Passw0rd -Revision "2-4705a219cdcca7c72aac4f623f5c46a8" -Authorization "admin:passw0rd"
    #>
    [CmdletBinding()]
    param(
        [string] $Server, 
        [int] $Port, 
        [string] $Database = "_users", 
        [string] $Userid = $(throw "Please specify the username."), 
        [string] $Password = $(throw "Please specify a password for username $Userid"), 
        [array] $Roles, 
        [string] $Revision = $(throw "Please specify the revision id."), 
        [string] $Authorization
    )
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
    Send-CouchDBRequest -Server $Server -Port $Port -Method "PUT" -Database $Database -Document $Document -Data $Data -Revision $Revision -Authorization $Authorization
}

function Set-CouchDBAdmin () {
    <#
    .SYNOPSIS
    Reset password of admin user.
    .DESCRIPTION
    Reset password of CouchDB admin user. 
    .EXAMPLE
    Set-CouchDBAdmin -Userid test_user -Authorization "admin:passw0rd"
    #>
    [CmdletBinding()]
    param(
        [string] $Server, 
        [int] $Port, 
        [string] $Database = "_node",
        [string] $Node = "couchdb@localhost",
        [string] $Userid = $(throw "Please specify the admin username."),
        [string] $Password = $(throw "Please specify a password for username $Userid"),
        [string] $Authorization
    )
    $Document = "$Node/_config/admins/$Userid"
    $Data = "`"$Password`""
    Send-CouchDBRequest -Server $Server -Port $Port -Method "PUT" -Database $Database -Document $Document -Data $Data -Authorization $Authorization
}

function Set-CouchDBConfiguration () {
    <#
    .SYNOPSIS
    Set element configuration.
    .DESCRIPTION
    Set element configuration of CouchDB. 
    .EXAMPLE
    Set-CouchDBConfiguration -Element attachments -Key compression_level -Value 10 -Authorization "admin:passw0rd"
    #>
    [CmdletBinding()]
    param(
        [string] $Server, 
        [int] $Port, 
        [string] $Database = "_node",
        [string] $Node = "couchdb@localhost",
        [string] $Element = $(throw "Please specify an element."),
        [string] $Key = $(throw "Please specify a key of element $Element"),
        [string] $Value = $(throw "Please specify a value of key $Key"),
        [string] $Authorization
    )
    $Document = "$Node/_config"
    if ((Get-CouchDBConfiguration -Authorization $Authorization).$Element) {
        $Document += "/$Element/$Key"
    } else {
        throw "Element $Element not exist!"
    }
    $Data = "$Value" | ConvertTo-Json
    Send-CouchDBRequest -Server $Server -Port $Port -Method "PUT" -Database $Database -Document $Document -Data $Data -Authorization $Authorization
}

function Grant-CouchDBDatabasePermission () {
    <#
    .SYNOPSIS
    Grant permission on database.
    .DESCRIPTION
    Grant permission on database. Specify Admins and/or Readers. 
    .EXAMPLE
    Grant-CouchDBDatabasePermission -Database example -AdminUser admin -AdminRoles technician -ReaderUser user1 -Authorization "admin:passw0rd"
    #>
    [CmdletBinding()]
    param(
        [string] $Server, 
        [int] $Port, 
        [string] $Database = $(throw "Please specify the database name."), 
        [array]$AdminUser, 
        [array]$AdminRoles, 
        [array]$ReaderUser, 
        [array]$UserRoles, 
        [string] $Authorization
    )
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

function Revoke-CouchDBDatabasePermission () {
    <#
    .SYNOPSIS
    Revoke permission on database.
    .DESCRIPTION
    Revoke permission on database. Specify Admins and/or Readers. 
    .EXAMPLE
    Revoke-CouchDBDatabasePermission -Database example -Authorization "admin:passw0rd"
    #>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [string] $Server, 
        [int] $Port, 
        [string] $Database = $(throw "Please specify the database name."), 
        [string] $Authorization,
        [switch]$Force
    )
    if ($Force -or $PSCmdlet.ShouldContinue("Do you wish revoke all permission on database $Database ?","Revoke all permission on database $Database")) {
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
}

function New-CouchDBDatabase () {
    <#
    .SYNOPSIS
    Create a new database.
    .DESCRIPTION
    Create a new CouchDB database. 
    .EXAMPLE
    New-CouchDBDatabase -Database example -Authorization "admin:passw0rd"
    #>
    [CmdletBinding()]
    param(
        [string] $Server, 
        [int] $Port, 
        [string] $Database = $(throw "Please specify the database name."), 
        [string] $Authorization
    )
    Send-CouchDBRequest -Server $Server -Port $Port -Method "PUT" -Database $Database -Authorization $Authorization
}

function New-CouchDBDocument () {
    <#
    .SYNOPSIS
    Create a new document.
    .DESCRIPTION
    Create a new CouchDB document with json data. 
    .EXAMPLE
    $data = '{"name":"Jhon", "surname":"Lennon"}'
    New-CouchDBDocument -Database example -Document "001" -Data $data -Authorization "admin:passw0rd"
    #>
    [CmdletBinding()]
    param(
        [string] $Server, 
        [int] $Port, 
        [string] $Database = $(throw "Please specify the database name."), 
        [string] $Document = $(throw "Please specify the document id."), 
        [string] $Data = $(throw "Please specify a valid json data."), 
        [string] $Authorization
    )
    Send-CouchDBRequest -Server $Server -Port $Port -Method "PUT" -Database $Database -Document $Document -Data $Data -Authorization $Authorization
}

function New-CouchDBAttachment () {
    <#
    .SYNOPSIS
    Create a new attachment document.
    .DESCRIPTION
    Create a new CouchDB attachment document. 
    .EXAMPLE
    New-CouchDBAttachment -Database example -Document "001" -Attachment C:\test.html -Revision "2-4705a219cdcca7c72aac4f623f5c46a8" -Authorization "admin:passw0rd"
    #>
    [CmdletBinding()]
    param(
        [string] $Server, 
        [int] $Port, 
        [string] $Database = $(throw "Please specify the database name."), 
        [string] $Document = $(throw "Please specify the document id."), 
        [string] $Attachment = $(throw "Please specify the path of attachment."), 
        [string] $Revision = $(throw "Please specify the revision id."), 
        [string] $Authorization
    )
    Send-CouchDBRequest -Server $Server -Port $Port -Method "PUT" -Database $Database -Document $Document -Attachment $Attachment -Revision $Revision -Authorization $Authorization
}

function New-CouchDBUser () {
    <#
    .SYNOPSIS
    Create a new user.
    .DESCRIPTION
    Create a new CouchDB user with roles. 
    .EXAMPLE
    New-CouchDBUser -Userid test_user -Password Passw0rd -Authorization "admin:passw0rd"
    #>
    [CmdletBinding()]
    param(
        [string] $Server, 
        [int] $Port, 
        [string] $Database = "_users", 
        [string] $Userid = $(throw "Please specify the username."), 
        [string] $Password = $(throw "Please specify a password for username $Userid"), 
        [array] $Roles, 
        [string] $Authorization
    )
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

function New-CouchDBAdmin () {
    <#
    .SYNOPSIS
    Create a new admin user.
    .DESCRIPTION
    Create a new CouchDB admin user. 
    .EXAMPLE
    New-CouchDBAdmin -Userid test_user -Password Passw0rd -Authorization "admin:passw0rd"
    #>
    [CmdletBinding()]
    param(
        [string] $Server, 
        [int] $Port, 
        [string] $Database = "_node",
        [string] $Node = "couchdb@localhost",
        [string] $Userid = $(throw "Please specify the admin username."), 
        [string] $Password = $(throw "Please specify a password for admin username $Userid"), 
        [string] $Authorization
    )
    $Document = "$Node/_config/admins/$Userid"
    $Data = "`"$Password`""
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
        [string] $Server, 
        [int] $Port, 
        [string] $Database = $(throw "Please specify the database name."), 
        [string] $Authorization,
        [switch]$Force
    )
    if ($Force -or $PSCmdlet.ShouldContinue("Do you wish remove database $Database ?","Remove database $Database")) {
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
    Remove-CouchDBDocument -Database example -Document "001" -Revision "2-4705a219cdcca7c72aac4f623f5c46a8" -Authorization "admin:passw0rd"
    #>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [string] $Server, 
        [int] $Port, 
        [string] $Database = $(throw "Please specify the database name."), 
        [string] $Document = $(throw "Please specify the document id."), 
        [string] $Revision = $(throw "Please specify the revision id."), 
        [string] $Authorization,
        [switch]$Force
    )
    if ($Force -or $PSCmdlet.ShouldContinue("Do you wish remove document $Document on database $Database ?","Remove document $Document on database $Database")) {
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
    Remove-CouchDBAttachment -Database example -Document "001" -Attachment test.html -Revision "2-4705a219cdcca7c72aac4f623f5c46a8" -Authorization "admin:passw0rd"
    #>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [string] $Server, 
        [int] $Port, 
        [string] $Database = $(throw "Please specify the database name."), 
        [string] $Document = $(throw "Please specify the document id."), 
        [string] $Attachment = $(throw "Please specify the path of attachment."), 
        [string] $Revision = $(throw "Please specify the revision id."), 
        [string] $Authorization
    )
    if ($PSCmdlet.ShouldContinue("Do you wish remove attachment $Attachment in document $Document on database $Database ?","Remove attachment $Attachment in document $Document on database $Database")) {
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
        [string] $Server, 
        [int] $Port, 
        [string] $Database = "_users", 
        [string] $Userid = $(throw "Please specify the username."), 
        [string] $Revision = $(throw "Please specify the revision id."), 
        [string] $Authorization,
        [switch]$Force
    )
    $Document = "org.couchdb.user:$Userid"
    if ($Force -or $PSCmdlet.ShouldContinue("Do you wish remove user $Userid ?","Remove $Userid on database $Database")) {
        Send-CouchDBRequest -Server $Server -Port $Port -Method "DELETE" -Database $Database -Document $Document -Revision $Revision -Authorization $Authorization
    }
}

function Remove-CouchDBAdmin () {
    <#
    .SYNOPSIS
    Remove an admin user.
    .DESCRIPTION
    Remove a CouchDB admin user. 
    .EXAMPLE
    Remove-CouchDBAdmin -Userid test_user -Authorization "admin:passw0rd"
    #>
    [CmdletBinding()]
    param(
        [string] $Server, 
        [int] $Port, 
        [string] $Database = "_node",
        [string] $Node = "couchdb@localhost",
        [string] $Userid = $(throw "Please specify the admin username."),
        [string] $Authorization
    )
    $Document = "$Node/_config/admins/$Userid"
    Send-CouchDBRequest -Server $Server -Port $Port -Method "DELETE" -Database $Database -Document $Document -Data $Data -Authorization $Authorization
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
    [CmdletBinding()]
    param (
        [string] $Server, 
        [int] $Port, 
        [string] $Database = $(throw "Please specify the database name."), 
        [string] $Selector, 
        [string] $Value, 
        [array]$Fields,
        [string] $Sort,
        [ValidateSet('lt','lte','eq','ne','gte','gt','exists','type','in','nin','size','regex')]
        [string] $Operator,
        [string] $Authorization
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