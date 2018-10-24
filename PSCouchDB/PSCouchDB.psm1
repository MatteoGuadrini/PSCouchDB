# Alias for all export cmdlets
New-Alias -Name "gcdb" -Value Get-CouchDBDatabase -Option ReadOnly
New-Alias -Name "gcdbc" -Value Get-CouchDBDatabaseChanges -Option ReadOnly
New-Alias -Name "gcdoc" -Value Get-CouchDBDocument -Option ReadOnly
New-Alias -Name "gcddoc" -Value Get-CouchDBDesignDocument -Option ReadOnly
New-Alias -Name "gcatt" -Value Get-CouchDBAttachment -Option ReadOnly
New-Alias -Name "gcusr" -Value Get-CouchDBUser -Option ReadOnly
New-Alias -Name "gcadm" -Value Get-CouchDBAdmin -Option ReadOnly
New-Alias -Name "gcconf" -Value Get-CouchDBConfiguration -Option ReadOnly
New-Alias -Name "gcnode" -Value Get-CouchDBNode -Option ReadOnly
New-Alias -Name "gcrpl" -Value Get-CouchDBReplication -Option ReadOnly
New-Alias -Name "gcrpls" -Value Get-CouchDBReplicationScheduler -Option ReadOnly
New-Alias -Name "gctsk" -Value Get-CouchDBActiveTask -Option ReadOnly
New-Alias -Name "gcidx" -Value Get-CouchDBIndex -Option ReadOnly
New-Alias -Name "mcsts" -Value Measure-CouchDBStatistics -Option ReadOnly
New-Alias -Name "eccl" -Value Enable-CouchDBCluster -Option ReadOnly
New-Alias -Name "acnode" -Value Add-CouchDBNode -Option ReadOnly
New-Alias -Name "ccdb" -Value Compress-CouchDBDatabase -Option ReadOnly
New-Alias -Name "ccview" -Value Clear-CouchDBView -Option ReadOnly
New-Alias -Name "scdoc" -Value Set-CouchDBDocument -Option ReadOnly
New-Alias -Name "scddoc" -Value Set-CouchDBDesignDocument -Option ReadOnly
New-Alias -Name "scatt" -Value Set-CouchDBAttachment -Option ReadOnly
New-Alias -Name "scusr" -Value Set-CouchDBUser -Option ReadOnly
New-Alias -Name "scadm" -Value Set-CouchDBAdmin -Option ReadOnly
New-Alias -Name "scconf" -Value Set-CouchDBConfiguration -Option ReadOnly
New-Alias -Name "scrpl" -Value Set-CouchDBReplication -Option ReadOnly
New-Alias -Name "gcdbp" -Value Grant-CouchDBDatabasePermission -Option ReadOnly
New-Alias -Name "rcdbp" -Value Revoke-CouchDBDatabasePermission -Option ReadOnly
New-Alias -Name "ncdb" -Value New-CouchDBDatabase -Option ReadOnly
New-Alias -Name "ncdoc" -Value New-CouchDBDocument -Option ReadOnly
New-Alias -Name "ncddoc" -Value New-CouchDBDesignDocument -Option ReadOnly
New-Alias -Name "ncatt" -Value New-CouchDBAttachment -Option ReadOnly
New-Alias -Name "ncusr" -Value New-CouchDBUser -Option ReadOnly
New-Alias -Name "ncadm" -Value New-CouchDBAdmin -Option ReadOnly
New-Alias -Name "ncrpl" -Value New-CouchDBReplication -Option ReadOnly
New-Alias -Name "ncuuid" -Value New-CouchDBUuids -Option ReadOnly
New-Alias -Name "ncidx" -Value New-CouchDBIndex -Option ReadOnly
New-Alias -Name "rcdb" -Value Remove-CouchDBDatabase -Option ReadOnly
New-Alias -Name "rcdoc" -Value Remove-CouchDBDocument -Option ReadOnly
New-Alias -Name "rcddoc" -Value Remove-CouchDBDesignDocument -Option ReadOnly
New-Alias -Name "rcatt" -Value Remove-CouchDBAttachment -Option ReadOnly
New-Alias -Name "rcusr" -Value Remove-CouchDBUser -Option ReadOnly
New-Alias -Name "rcadm" -Value Remove-CouchDBAdmin -Option ReadOnly
New-Alias -Name "rcnode" -Value Remove-CouchDBNode -Option ReadOnly
New-Alias -Name "rcrpl" -Value Remove-CouchDBReplication -Option ReadOnly
New-Alias -Name "rcidx" -Value Remove-CouchDBIndex -Option ReadOnly
New-Alias -Name "rcsrv" -Value Restart-CouchDBServer -Option ReadOnly
New-Alias -Name "fcdoc" -Value Find-CouchDBDocuments -Option ReadOnly
New-Alias -Name "finddoc" -Value Find-CouchDBDocuments -Option ReadOnly

# Native Powershell CouchDB class
class PSCouchDBQuery {
    <#
    .SYNOPSIS
    Native query of CouchDB
    .DESCRIPTION
    Class than representing the native query of CouchDB
    .EXAMPLE
    using module PSCouchDB
    $query = New-Object PSCouchDBQuery
    #>
    # Properties of query
    [hashtable]$selector = @{}
    [int]$limit
    [int]$skip
    [array]$sort = @()
    [array]$fields = @()
    [array]$use_index = @()
    [int]$r
    [string]$bookmark
    [bool]$update = $true
    [bool]$stable
    [string]$stale
    [bool]$execution_stats

    # Hidden properties
    hidden [int]$Depth
    hidden [ValidateSet('$and','$or','$not','$nor','$all','$elemMatch','$allMatch')]
    [string]$LogicalOperator
    hidden [ValidateSet('$lt','$lte','$eq','$ne','$gte','$gt','$exists','$type','$in','$nin','$size','$mod','$regex')]
    [string]$operator

    # Method for add selector key=value
    AddSelector ($key, $value) {
        if (-not($this.selector.ContainsKey($key))) {
            $this.selector.Add($key, $value)
        } else {
            throw "selector $key already exists!"
        }
    }

    # Method for replace selector key=value
    ReplaceSelector ($key, $value) {
        if (-not($this.selector.ContainsKey($key))) {
            $this.selector.Add($key, $value)
        } else {
            $this.RemoveSelector($key)
            $this.selector.Add($key, $value)
        }
    }

    # Method for remove specific selector
    RemoveSelector ($key) {
        if ($this.selector.ContainsKey($key)) {
            $this.selector.Remove($key)
        } else {
            throw "selector $key not exists!"
        }
        $this.selector
    }

    # Method for setting limit properties
    SetLimit ($limit) { $this.limit = $limit }

    # Method for setting skip properties
    SetSkip ($skip) { $this.skip = $skip }

    # Method for adding sort properties to sort array
    AddSortAsc ($selector) {
        foreach ($condition in $this.sort) {
            if ($condition.Values -contains 'desc') {
                throw 'Sort "desc" id defined! Remove it before add "asc"'
            }
        }
        $this.sort += @{ $selector = 'asc' }
    }
    AddSortDesc ($selector) {
        foreach ($condition in $this.sort) {
            if ($condition.Values -contains 'asc') {
                throw 'Sort "asc" id defined! Remove it before add "desc"'
            }
        }
        $this.sort += @{ $selector = 'desc' }
    }

    # Method for removing all sort properties
    RemoveSort () {
        $this.sort = @()
    }

    # Method for adding field properties to fields array
    AddFields ($fields) {
        $this.fields += $fields
    }

    # Method for adding index properties to indexies array
    AddIndexies ($indexies) {
        $this.use_index += $indexies
    }

    # Method for removing fields properties to fields array
    RemoveFields () {
        $this.fields = @()
    }

    # Method for adding indexies properties to indexies array
    RemoveIndexies () {
        $this.use_index = @()
    }

    # Method for setting read quorum
    SetReadQuorum ($r) {
        $this.r = $r
    }

    # Method for setting bookmark
    SetBookmark ($bookmark) {
        $this.bookmark = $bookmark
    }

    # Method for disabling update
    DisableUpdate () {
        $this.update = $false
    }

    # Method for setting update
    SetStable ($bool) {
        $this.stable = $bool
    }

    # Method for setting stale
    SetStale () {
        $this.DisableUpdate()
        $this.stable = $true
        $this.stale = 'ok'
    }

    # Method for setting update
    SetExecutionStat ($bool) {
        $this.execution_stats = $bool
    }

    # Method for adding logical operator
    AddLogicalOperator ($operator) {
        if ($this.selector.Count -ne 0) {
            $this.LogicalOperator = $operator
            $clone_selector = $this.selector.Clone()
            $this.selector.Clear()
            # Check if array or selector
            if (('$and','$or','$nor','$all') -contains $operator ) {
                # Array
                $this.selector.Add($operator, @())
                foreach ($selector in $clone_selector.Keys) {
                    $this.selector."$operator" += @{ $selector = $clone_selector[$selector] }
                }
                $this.Depth = $this.Depth +2
            } else {
                # Selector
                $this.selector.Add($operator, $clone_selector)
                $this.Depth = $this.Depth +1
            }
        } else {
            throw "One or more selector are required!"
        }
    }

    # Method for adding operator to selector
    AddSelectorOperator ($operator) {
        if ($this.selector.Count -ne 0) {
            $this.operator = $operator
            $clone_selector = $this.selector.Clone()
            $this.selector.Clear()
            # Check if array, selector or json
            if (('$lt','$lte','$eq','$ne','$gte','$gt','$exists','$type','$mod','$regex') -contains $operator) {
                # JSON
                foreach ($selector in $clone_selector.Keys) {
                    if (('$and','$or','$not','$nor','$all','$elemMatch','$allMatch') -contains $selector) {
                        $this.selector.Add($selector, $clone_selector[$selector])
                        continue
                    }
                    $this.selector.Add($selector, @{})
                    if (($clone_selector[$selector] -as [int]) -ne $null) {
                        $this.selector.$selector.Add($operator, [int]$clone_selector[$selector])
                    } elseif (($clone_selector[$selector] -eq "true") -or ($clone_selector[$selector] -eq "false")) {
                        $this.selector.$selector.Add($operator, [bool]$clone_selector[$selector])
                    } else {
                        $this.selector.$selector.Add($operator, $clone_selector[$selector])
                    }
                }
            } elseif (('$in','$nin','$size') -contains $operator) {
                # Array
                foreach ($selector in $clone_selector.Keys) {
                    if (('$and','$or','$not','$nor','$all','$elemMatch','$allMatch') -contains $selector) {
                        $this.selector.Add($selector, $clone_selector[$selector])
                        continue
                    }
                    $this.selector.Add($selector, @{})
                    if (($clone_selector[$selector] -as [int]) -ne $null) {
                        $this.selector.$selector.Add($operator, @([int]$clone_selector[$selector]))
                    } elseif (($clone_selector[$selector] -eq "true") -or ($clone_selector[$selector] -eq "false")) {
                        $this.selector.$selector.Add($operator, @([bool]$clone_selector[$selector]))
                    } else {
                        $this.selector.$selector.Add($operator, @($clone_selector[$selector]))
                    }
                }
            }
            $this.Depth = $this.Depth +3
        } else {
            throw "One or more selector are required!"
        }
    }

    # Method for adding operator to selector and value
    AddSelectorOperator ($operator, $key, $value) {
        if ($this.selector.Count -ne 0) {
            $this.operator = $operator
            if ($this.selector.ContainsKey($key)) {
                if (-not(('$and','$or','$not','$nor','$all','$elemMatch','$allMatch') -contains $key)) {
                    # Check if array, selector or json
                    $this.selector.$key = @{}
                    if (('$lt','$lte','$eq','$ne','$gte','$gt','$exists','$type','$mod','$regex') -contains $operator) {
                        # JSON
                        if (($value -as [int]) -ne $null) {
                            $this.selector.$key.Add($operator, [int]$value)
                        } elseif (($value -eq "true") -or ($value -eq "false")) {
                            $this.selector.$key.Add($operator, [bool]$value)
                        } else {
                            $this.selector.$key.Add($operator, $value)
                        }
                    } elseif (('$in','$nin','$size') -contains $operator) {
                        # Array
                        if (($value -as [int]) -ne $null) {
                            $this.selector.$key.Add($operator, @([int]$value))
                        } elseif (($value -eq "true") -or ($value -eq "false")) {
                            $this.selector.$key.Add($operator, @([bool]$value))
                        } else {
                            $this.selector.$key.Add($operator, @($value))
                        }
                    }
                }
                $this.Depth = $this.Depth +3
            } else {
                throw "selector $key not exists!"
            }
        } else {
            throw "One or more selector are required!"
        }
    }

    # Method for get a native query in json format
    [string] GetNativeQuery () {
        [hashtable]$query = @{}
        if ($this.selector.PSBase.Count -ne 0) {
            $query.selector = $this.selector
            $this.Depth = $this.Depth + $query.selector.PSBase.Count
        } else {
            throw "One selector is required."
        }
        if ($this.limit) { $query.limit = $this.limit }
        if ($this.skip) { $query.skip = $this.skip }
        if ($this.sort) { $query.sort = $this.sort }
        if ($this.fields) { $query.fields = $this.fields }
        if ($this.use_index) { $query.use_index = $this.use_index }
        if ($this.r) { $query.r = $this.r }
        if ($this.bookmark) { $query.bookmark = $this.bookmark }
        $query.update = $this.update
        if ($this.stable) { $query.stable = $this.stable }
        if ($this.stale) { $query.stale = $this.stale }
        if ($this.execution_stats) { $query.execution_stats = $this.execution_stats }
        return $query | ConvertTo-Json -Depth ($this.Depth +1)
    }
}

class PSCouchDBDesignDoc {
    <#
    .SYNOPSIS
    Native design documents of CouchDB
    .DESCRIPTION
    Class of documents, are used to build indexes, validate document updates, format query results, and filter replications.
    .EXAMPLE
    using module PSCouchDB
    $design_doc = New-Object PSCouchDBDesignDoc
    #>
    # Properties of design document
    [hashtable]$views = @{}
    [hashtable]$shows = @{}
    [hashtable]$lists = @{}
    [string]$validate_doc_update

    # Hidden properties
    hidden [int]$Depth = 1
    hidden [string]$language = 'javascript'

    # Method for change name of design document
    SetName ($name) {
        $this.id = "_design/$name"
    }

    # Method for adding new view; ALL DOCS
    # GET /_design/{design-doc-id}/_view/{view-function-name}
    AddView ($name) {
        if (-not($this.views.ContainsKey($name))) {
            $map = @"
function(doc) {
    emit(doc._id, doc._rev)
}
"@
            $this.views.Add("$name", @{})
            $this.views.$name.Add("map", $map)
            $this.Depth++
        } else {
            throw "The view function $name already exists!"
        }
    }

    # Method for adding new view; KEY EXISTS
    # GET /_design/{design-doc-id}/_view/{view-function-name}
    AddView ($name, $key) {
        if (-not($this.views.ContainsKey($name))) {
            $map = @"
function(doc) {
    if (doc.$key) {
        emit(doc._id, doc._rev)
    }
}
"@
            $this.views.Add("$name", @{})
            $this.views.$name.Add("map", $map)
            $this.Depth++
        } else {
            throw "The view function $name already exists!"
        }
    }

    # Method for adding new view; KEY EXISTS AND KEY EQUAL VALUE
    # GET /_design/{design-doc-id}/_view/{view-function-name}
    AddView ($name, $key, $value) {
        if (-not($this.views.ContainsKey($name))) {
            $map = @"
function(doc) {
    if (doc.$key && doc.$key == "$value") {
        emit(doc._id, doc._rev)
    }
}
"@
            $this.views.Add("$name", @{})
            $this.views.$name.Add("map", $map)
            $this.Depth++
        } else {
            throw "The view function $name already exists!"
        }
    }

    # Method for adding new view; KEY EXISTS AND KEY EQUAL VALUE WITH RETURN DOC
    # GET /_design/{design-doc-id}/_view/{view-function-name}
    AddView ($name, $key, $value, $doc) {
        if ($doc -eq $true) {
            $doc = 'doc'
        } else {
            throw "Parameter $doc not found! This value must be `$true"
        }
        if (-not($this.views.ContainsKey($name))) {
            $map = @"
function(doc) {
    if (doc.$key && doc.$key == "$value") {
        emit(doc._id, $doc)
    }
}
"@
            $this.views.Add("$name", @{})
            $this.views.$name.Add("map", $map)
            $this.Depth++
        } else {
            throw "The view function $name already exists!"
        }
    }

    # Method for adding new show; ALL DOCS
    # GET /_design/{design-doc-id}/_show/{show-function-name}/{document-id}
    AddShow ($name) {
        if (-not($this.shows.ContainsKey($name))) {
            $fun = @"
function(doc, req) {
    return {
        body: "<h1>" + doc._id + "</h1>" +
        "<h2>" + doc._rev + "</h2>" +
        "<br>"
    }
}
"@
            $this.shows.Add("$name", $fun)
            $this.Depth++
        } else {
            throw "The show function $name already exists!"
        }
    }

    # Method for adding new show; KEY EXISTS
    # GET /_design/{design-doc-id}/_show/{show-function-name}/{document-id}
    AddShow ($name, $key) {
        if (-not($this.shows.ContainsKey($name))) {
            $fun = @"
function(doc, req) {
    if (doc.$key) {
        return {
            body: "<h1>" + doc._id + "</h1>" +
            "<h2>" + doc._rev + "</h2>" +
            "<p>" + "$key" + "</p>" +
            "<br>"
        }
    }
}
"@
            $this.shows.Add("$name", $fun)
            $this.Depth++
        } else {
            throw "The show function $name already exists!"
        }
    }

    # Method for adding new show; KEY EXISTS AND KEY EQUAL VALUE
    # GET /_design/{design-doc-id}/_show/{show-function-name}/{document-id}
    AddShow ($name, $key, $value) {
        if (-not($this.shows.ContainsKey($name))) {
            $fun = @"
function(doc, req) {
    if (doc.$key && doc.$key == "$value") {
        return {
            body: "<h1>" + doc._id + "</h1>" +
            "<h2>" + doc._rev + "</h2>" +
            "<p>" + "$key" + ": " + doc.$key + "</p>" +
            "<br>"
        }
    }
}
"@
            $this.shows.Add("$name", $fun)
            $this.Depth++
        } else {
            throw "The show function $name already exists!"
        }
    }

    # Method for adding new list; ALL DOCS
    # GET /_design/{design-document-id}/_list/{list-name}/{view-name}
    AddList ($name) {
        if ($this.views.PSBase.Count -eq 0) {
            throw "First you must add at least one view"
        }
        if (-not($this.lists.ContainsKey($name))) {
            $map = @"
function(head, req) {
    start({
        'headers': {
            'Content-Type': 'text/html'
        }
    });
    send('<html><body><table>');
    send('<tr><th>ID</th><th>Key</th><th>Value</th></tr>')
    while(row = getRow()){
        send(''.concat(
            '<tr>',
            '<td>' + toJSON(row.id) + '</td>',
            '<td>' + toJSON(row.key) + '</td>',
            '<td>' + toJSON(row.value) + '</td>',
            '</tr>'
        ));
    }
    send('</table></body></html>');
}
"@
            $this.lists.Add("$name", $map)
            $this.Depth++
        } else {
            throw "The list function $name already exists!"
        }
    }

    # Method for adding new validation update function; ALL DOCS WITH REQUIREMENTS
    AddValidation ([array]$requirements) {
        if (-not($this.validate_doc_update)) {
            $map = @"
function(newDoc, oldDoc, userCtx) {
    function require(field, message) {
        message = message || "Document must have a " + field;
        if (!newDoc[field]) throw({forbidden : message});
    };
"@
            foreach ($requirement in $requirements) {
                $map += "require(`"$requirement`");"
            }
            $map += @"
            }
"@
            $this.validate_doc_update = $map
            $this.Depth++
        } else {
            throw "There can be only one validation function in a design document."
        }
    }

    # Method for adding new validation update function; ALL DOCS WITH REQUIREMENTS AND AUTHOR
    AddValidation ([array]$requirements, $author) {
        if ($author -ne $true) {
            throw "Parameter $author not found! This value must be `$true"
        }
        if (-not($this.validate_doc_update)) {
            $map = @"
function(newDoc, oldDoc, userCtx) {
    function require(field, message) {
        message = message || "Document must have a " + field;
        if (!newDoc[field]) throw({forbidden : message});
    };
"@
            foreach ($requirement in $requirements) {
                $map += "require(`"$requirement`");"
            }
            $map += @"
    if (newDoc.author) {
        enforce(newDoc.author == userCtx.name,
        "You may only update documents with author " + userCtx.name);
    }
}
"@
            $this.validate_doc_update = $map
            $this.Depth++
        } else {
            throw "There can be only one validation function in a design document."
        }
    }

    # Method for get native json design documents format
    [string] GetDesignDocuments () {
        [hashtable]$json = @{}
        if ($this.views.PSBase.Count -ne 0) { $json.Add('views', $this.views) }
        if ($this.shows.PSBase.Count -ne 0) { $json.Add('shows', $this.shows) }
        if ($this.lists.PSBase.Count -ne 0) { $json.Add('lists', $this.lists) }
        if ($this.validate_doc_update) { $json.Add('validate_doc_update', $this.validate_doc_update) }
        $json.Add('language', $this.language)
        return $json | ConvertTo-Json -Depth ($this.Depth +1)
    }
}


# Functions of CouchDB module
function Send-CouchDBRequest {
    <#
    .SYNOPSIS
    Sends a request to a CouchDB database server.
    .DESCRIPTION
    Sends a REST request to a CouchDB database server.
    .EXAMPLE
    Send-CouchDBRequest -Method PUT -Database example -Authorization "admin:password"
    #>
    [CmdletBinding()]
    param (
        [ValidateSet("HEAD","GET","PUT","DELETE","POST")] [string] $Method,
        [string] $Server,
        [int] $Port,
        [string] $Database,
        [string] $Document,
        [string] $Authorization,
        [string] $Revision,
        [string] $Attachment,
        [string] $Data,
        [string] $OutFile,
        [switch] $Ssl
    )
    # Set default server
    Write-Verbose -Message "Check if variable `$Server is null, else set variable to 'localhost'"
    if (-not($Server)) {
        $Server = 'localhost'
        Write-Debug -Message "`$Server is $Server"
    }
    # Set protocol
    Write-Verbose -Message "Check if SSL is enable"
    if ($Ssl.IsPresent) {
        # Set default port
        Write-Verbose -Message "Check if variable `$Port is null, else set variable to '6984'"
        if (-not($Port)) {
            $Port = 6984
            Write-Debug -Message "`$Port is $Port"
        }
        # Set SSL protocol
        $Protocol = 'https'
        Write-Debug -Message "`$Protocol is $Protocol"
    } else {
        # Set default port
        Write-Verbose -Message "Check if variable `$Port is null, else set variable to '5984'"
        if (-not($Port)) {
            $Port = 5984
            Write-Debug -Message "`$Port is $Port"
        }
        # Set deafult protocol
        $Protocol = 'http'
        Write-Debug -Message "`$Protocol is $Protocol"
    }
    # Initialize option of command
    $options = @{}
    # Analize method for web request
    Write-Verbose -Message "Check http method, default is GET"
    Write-Debug -Message "`$Method is $Method"
    switch ($Method) {
        "HEAD"      { $options.Add("Method","HEAD") }
        "GET"       { $options.Add("Method","GET") }
        "PUT"       { $options.Add("Method","PUT") }
        "DELETE"    { $options.Add("Method","DELETE") }
        "POST"      { $options.Add("Method","POST") }
        Default     { $options.Add("Method","GET") }
    }
    # Build the url
    Write-Verbose -Message "Build the url"
    $url = "${Protocol}://${Server}:$Port"
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
    if (($Data) -and ($Database)) {
        $options.Add("ContentType","application/json")
        $options.Add("Body",([System.Text.Encoding]::UTF8.GetBytes($Data)))
        Write-Debug -Message "`$Data is $Data"
    }
    # Invoke REST with method
    Write-Verbose -Message "Finally, send request to CouchDB server $Server"
    $results = Invoke-RestMethod @options
    return $results
}

function ConvertTo-CouchDBPassword ([SecureString] $SecurePassword) {
    $BSTR = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($SecurePassword)
    $UnsecurePassword = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)
    return $UnsecurePassword
}

function Get-CouchDBDatabase () {
    <#
    .SYNOPSIS
    Get a database information.
    .DESCRIPTION
    Get a CouchDB database informations.
    .EXAMPLE
    Get-CouchDBDatabase -Database test -Authorization "admin:password"
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [string] $Database = "_all_dbs",
        [string] $Authorization,
        [switch] $Ssl
    )
    Send-CouchDBRequest -Server $Server -Port $Port -Method "GET" -Database $Database -Authorization $Authorization -Ssl:$Ssl
}

function Get-CouchDBDatabaseChanges () {
    <#
    .SYNOPSIS
    Get database changelogs.
    .DESCRIPTION
    Get database changelogs of CouchDB database.
    .EXAMPLE
    Get-CouchDBDatabaseChanges -Database test -Authorization "admin:password"
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory=$true)]
        [string] $Database,
        [string] $Authorization,
        [switch] $Ssl
    )
    if (-not(Get-CouchDBDatabase -Database $Database -Authorization $Authorization -Ssl:$Ssl)) {
        throw "Database replicator $Database is not exists."
    }
    $Document = '_changes'
    Send-CouchDBRequest -Server $Server -Port $Port -Method "GET" -Database $Database -Document $Document -Authorization $Authorization -Ssl:$Ssl
}

function Get-CouchDBDocument () {
    <#
    .SYNOPSIS
    Get a document.
    .DESCRIPTION
    Get a CouchDB document json data.
    .EXAMPLE
    Get-CouchDBDocument -Database test -Document "001"
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory=$true)]
        [string] $Database,
        [string] $Document = "_all_docs",
        [switch] $Local,
        [string] $Authorization,
        [switch] $Ssl
    )
    if ($Local.IsPresent) {
        $Document = "_local_docs"
    }
    Send-CouchDBRequest -Server $Server -Port $Port -Method "GET" -Database $Database -Document $Document -Authorization $Authorization -Ssl:$Ssl
}

function Get-CouchDBDesignDocument () {
    <#
    .SYNOPSIS
    Get a design document.
    .DESCRIPTION
    Get a CouchDB design document json data.
    .EXAMPLE
    Get-CouchDBDesignDocument -Database test -Document "mydesigndoc"
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory=$true)]
        [string] $Database,
        [Parameter(mandatory=$true)]
        [string] $Document,
        [string] $Authorization,
        [switch] $Ssl
    )
    $Document = "_design/$Document"
    Send-CouchDBRequest -Server $Server -Port $Port -Method "GET" -Database $Database -Document $Document -Authorization $Authorization -Ssl:$Ssl
}

function Get-CouchDBAttachment () {
    <#
    .SYNOPSIS
    Get or save attachment.
    .DESCRIPTION
    Get or save attachment from CouchDB document.
    .EXAMPLE
    Get-CouchDBAttachment -Database test -Document "001" -Attachment test.html -Authorization "admin:password"
    .EXAMPLE
    Get-CouchDBAttachment -Database test -Document "001" -Attachment test.html -OutFile C:\out.html -Authorization "admin:password"
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory=$true)]
        [string] $Database,
        [Parameter(mandatory=$true)]
        [string] $Document,
        [Parameter(mandatory=$true)]
        [string] $Attachment,
        [string] $OutFile,
        [string] $Authorization,
        [switch] $Ssl
    )
    Send-CouchDBRequest -Server $Server -Port $Port -Method "GET" -Database $Database -Document $Document -Attachment $Attachment -OutFile $OutFile -Authorization $Authorization -Ssl:$Ssl
}

function Get-CouchDBUser () {
    <#
    .SYNOPSIS
    Get an user.
    .DESCRIPTION
    Get a CouchDB user.
    .EXAMPLE
    Get-CouchDBUser -Userid test_user -Authorization "admin:password"
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [string] $Database = "_users",
        [Parameter(mandatory=$true)]
        [string] $Userid,
        [string] $Authorization,
        [switch] $Ssl
    )
    $Document = "org.couchdb.user:$Userid"
    Send-CouchDBRequest -Server $Server -Port $Port -Method "GET" -Database $Database -Document $Document -Authorization $Authorization -Ssl:$Ssl
}

function Get-CouchDBAdmin () {
    <#
    .SYNOPSIS
    Get an admin user.
    .DESCRIPTION
    Get a CouchDB admin user.
    .EXAMPLE
    Get-CouchDBAdmin -Authorization "admin:password"
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [string] $Database = "_node",
        [string] $Node = "couchdb@localhost",
        [string] $Authorization,
        [switch] $Ssl
    )
    $Document = "$Node/_config/admins"
    Send-CouchDBRequest -Server $Server -Port $Port -Method "GET" -Database $Database -Document $Document -Authorization $Authorization -Ssl:$Ssl
}

function Get-CouchDBDatabaseSecurity () {
    <#
    .SYNOPSIS
    Get the current security object from the specified database.
    .DESCRIPTION
    Get the current security object from the specified CouchDB database.
    .EXAMPLE
    Get-CouchDBDatabaseSecurity -Database test -Authorization "admin:password"
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory=$true)]
        [string] $Database,
        [string] $Authorization,
        [switch] $Ssl
    )
    $Document = "_security"
    Send-CouchDBRequest -Server $Server -Port $Port -Method "GET" -Database $Database -Document $Document -Authorization $Authorization -Ssl:$Ssl
}

function Get-CouchDBConfiguration () {
    <#
    .SYNOPSIS
    Get configuration.
    .DESCRIPTION
    Get configuration of CouchDB.
    .EXAMPLE
    Get-CouchDBConfiguration -Authorization "admin:password"
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [string] $Database = "_node",
        [string] $Node = "couchdb@localhost",
        [string] $Authorization,
        [switch] $Ssl
    )
    $Document = "$Node/_config"
    Send-CouchDBRequest -Server $Server -Port $Port -Method "GET" -Database $Database -Document $Document -Authorization $Authorization -Ssl:$Ssl
}

function Get-CouchDBNode () {
    <#
    .SYNOPSIS
    Get server nodes.
    .DESCRIPTION
    Get server nodes of CouchDB.
    .EXAMPLE
    Get-CouchDBNode -Authorization "admin:password"
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [string] $Database = "_membership",
        [string] $Authorization,
        [switch] $Ssl
    )
    Send-CouchDBRequest -Server $Server -Port $Port -Method "GET" -Database $Database -Document $Document -Authorization $Authorization -Ssl:$Ssl
}

function Get-CouchDBReplication () {
    <#
    .SYNOPSIS
    Get database replication.
    .DESCRIPTION
    Get database replication of CouchDB.
    .EXAMPLE
    Get-CouchDBReplication -Authorization "admin:password"
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [string] $Database = "_replicator",
        [string] $Document = '_all_docs',
        [string] $Authorization,
        [switch] $Ssl
    )
    if (-not(Get-CouchDBDatabase -Database $Database -Authorization $Authorization -Ssl:$Ssl -ErrorAction SilentlyContinue)) {
        throw "Database replicator $Database is not exists."
    }
    Send-CouchDBRequest -Server $Server -Port $Port -Method "GET" -Database $Database -Document $Document -Authorization $Authorization -Ssl:$Ssl
}

function Get-CouchDBReplicationScheduler () {
    <#
    .SYNOPSIS
    Get more details of database replication.
    .DESCRIPTION
    Get more details of database replication of CouchDB.
    .EXAMPLE
    Get-CouchDBReplicationScheduler -Authorization "admin:password"
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [string] $Authorization,
        [switch] $Ssl
    )
    $Database = "_scheduler"
    $Document = 'jobs'
    Send-CouchDBRequest -Server $Server -Port $Port -Method "GET" -Database $Database -Document $Document -Authorization $Authorization -Ssl:$Ssl
}

function Get-CouchDBActiveTask () {
    <#
    .SYNOPSIS
    Get an active task.
    .DESCRIPTION
    Get a CouchDB active task.
    .EXAMPLE
    Get-CouchDBActiveTask -Authorization "admin:password"
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [string] $Authorization,
        [switch] $Ssl
    )
    $Database = "_active_tasks"
    Send-CouchDBRequest -Server $Server -Port $Port -Method "GET" -Database $Database -Authorization $Authorization -Ssl:$Ssl
}

function Get-CouchDBIndex () {
    <#
    .SYNOPSIS
    Get indexes of database.
    .DESCRIPTION
    Get indexes of CouchDB database.
    .EXAMPLE
    Get-CouchDBIndex -Database test -Authorization "admin:password"
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory=$true)]
        [string] $Database,
        [string] $Authorization,
        [switch] $Ssl
    )
    $Document = '_index'
    Send-CouchDBRequest -Server $Server -Port $Port -Method "GET" -Database $Database -Document $Document -Authorization $Authorization -Ssl:$Ssl
}

function Measure-CouchDBStatistics () {
    <#
    .SYNOPSIS
    Measure server statistics.
    .DESCRIPTION
    Measure CouchDB server statistics.
    .EXAMPLE
    Measure-CouchDBStatistics -DatabaseReads -OpenDatabases -RequestTime -Authorization "admin:password"
    #>
    [CmdletBinding()]
    param(
        [string] $Server = 'localhost',
        [int] $Port,
        [string] $Authorization,
        [switch] $Ssl
    )
    $Database = "_node/couchdb@$Server/_stats"
    $Document = "couchdb"
    Send-CouchDBRequest -Server $Server -Port $Port -Method "GET" -Database $Database -Document $Document -Authorization $Authorization -Ssl:$Ssl
}

function Clear-CouchDBView () {
    <#
    .SYNOPSIS
    Clean view indexes.
    .DESCRIPTION
    Clean up all outdated view indexes.
    .EXAMPLE
    Clear-CouchDBView -Database test -Authorization "admin:password"
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory=$true)]
        [string] $Database,
        [string] $Authorization,
        [switch] $Ssl
    )
    $Document = "_view_cleanup"
    Send-CouchDBRequest -Server $Server -Port $Port -Method "POST" -Database $Database -Document $Document -Authorization $Authorization -Ssl:$Ssl
}

function Clear-CouchDBDocuments () {
    <#
    .SYNOPSIS
    A database purge permanently document.
    .DESCRIPTION
    A CouchDB database purge permanently document.
    .EXAMPLE
    Clear-CouchDBDatabase -Database test -Document test -Authorization "admin:password"
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory=$true)]
        [string] $Database,
        [Parameter(mandatory=$true)]
        [string] $Document,
        [string] $Authorization,
        [switch] $Ssl
    )
    $Data = @{$Document = @((Get-CouchDBDocument -Server $Server -Port $Port -Database $Database -Document $Document -Authorization $Authorization -Ssl:$Ssl)._rev)}
    $Data = $Data | ConvertTo-Json
    $Database = $Database + '/_purge'
    Send-CouchDBRequest -Server $Server -Port $Port -Method "POST" -Database $Database -Data $Data -Authorization $Authorization -Ssl:$Ssl
}

function Add-CouchDBNode () {
    <#
    .SYNOPSIS
    Add server nodes.
    .DESCRIPTION
    Add server nodes of CouchDB.
    .EXAMPLE
    Add-CouchDBNode -BindAddress server1 -Authorization "admin:password"
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory=$true)]
        [string] $BindAddress,
        [string] $Authorization,
        [switch] $Ssl
    )
    $Database = "_cluster_setup"
    $Credential = $Authorization -split ":"
    $Data = "
    {
        `"action`": `"add_node`",
        `"host`": `"$BindAddress`",
        `"port`": `"$Port`",
        `"username`": `"$($Credential[0])`",
        `"password`": `"$($Credential[1])`"
    }
    "
    Send-CouchDBRequest -Server $Server -Port $Port -Method "POST" -Database $Database -Data $Data -Authorization $Authorization -Ssl:$Ssl
}

function Compress-CouchDBDatabase () {
    <#
    .SYNOPSIS
    Compress database.
    .DESCRIPTION
    Compress database of CouchDB.
    .EXAMPLE
    Compress-CouchDBDatabase -Database test -Authorization "admin:password"
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory=$true)]
        [string] $Database,
        [string] $Authorization,
        [switch] $Ssl
    )
    $Document = '_compact'
    $Data = '{}'
    Send-CouchDBRequest -Server $Server -Port $Port -Method "POST" -Database $Database -Document $Document -Data $Data -Authorization $Authorization -Ssl:$Ssl
}

function Set-CouchDBDocument () {
    <#
    .SYNOPSIS
    Modify a document.
    .DESCRIPTION
    Modify a CouchDB document json data.
    .EXAMPLE
    $data = '{"album":"...and justice for all", "band":"Metallica"}'
    Set-CouchDBDocument -Database test -Document "001" -Revision "2-4705a219cdcca7c72aac4f623f5c46a8" -Data $data -Authorization "admin:password"
    .EXAMPLE
    $data = @{"album"="...and justice for all", "band"="Metallica"}
    Set-CouchDBDocument -Database test -Document "001" -Revision "2-4705a219cdcca7c72aac4f623f5c46a8" -Data $data -Authorization "admin:password"
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory=$true)]
        [string] $Database,
        [Parameter(mandatory=$true)]
        [string] $Document,
        [Parameter(mandatory=$true)]
        [string] $Revision,
        $Data,
        [switch] $Replace,
        [string] $Authorization,
        [switch] $Ssl
    )
    if (($Data -as [hashtable]) -eq $null) {
        # Hashtable Data
        $Json = $Data | ConvertFrom-Json
        $Data = @{}
        $Json.psobject.properties | ForEach-Object {
            $Data.Add($_.Name, $_.Value)
        }
    }
    if (-not($Replace.IsPresent)) {
        $OldDoc = Get-CouchDBDocument -Server $Server -Port $Port -Database $Database -Document $Document -Authorization $Authorization -Ssl:$Ssl
        $OldDoc.psobject.properties | ForEach-Object {
            if (-not($Data.$($_.Name))) {
                $Data.Add($_.Name, $_.Value)
            }
        }
    }
    $Data = $Data | ConvertTo-Json -Depth 99
    Send-CouchDBRequest -Server $Server -Port $Port -Method "PUT" -Database $Database -Document $Document -Revision $Revision -Data $Data -Authorization $Authorization -Ssl:$Ssl
}

function Set-CouchDBDesignDocument () {
    <#
    .SYNOPSIS
    Modify a design document.
    .DESCRIPTION
    Modify a CouchDB design document with json data.
    .EXAMPLE
    Set-CouchDBDesignDocument -Database test -Document "mydesigndoc" -ViewName "data_test" -Authorization "admin:password"
    .EXAMPLE
    $data = '{"views":{"data_test":{"map":"function(doc) {emit(doc._id, doc._rev)}"}}}'
    Set-CouchDBDesignDocument -Database test -Document "mydesigndoc" -Data $data -Authorization "admin:password"
    .EXAMPLE
    $data = @{"views"=@{"data_test"=@{"map"="function(doc) {emit(doc._id, doc._rev)}"}}}
    Set-CouchDBDesignDocument -Database test -Document "mydesigndoc" -Data $data -Authorization "admin:password"
    #>
    [CmdletBinding(DefaultParameterSetName = "View")]
    param(
        [Parameter(ParameterSetName = "View")]
        [Parameter(ParameterSetName = "List")]
        [Parameter(ParameterSetName = "Show")]
        [Parameter(ParameterSetName = "Validation")]
        [Parameter(ParameterSetName = "CustomData")]
        [string] $Server,
        [Parameter(ParameterSetName = "View")]
        [Parameter(ParameterSetName = "List")]
        [Parameter(ParameterSetName = "Show")]
        [Parameter(ParameterSetName = "Validation")]
        [Parameter(ParameterSetName = "CustomData")]
        [int] $Port,
        [Parameter(ParameterSetName = "View")]
        [Parameter(ParameterSetName = "List")]
        [Parameter(ParameterSetName = "Show")]
        [Parameter(ParameterSetName = "Validation")]
        [Parameter(ParameterSetName = "CustomData")]
        [Parameter(mandatory=$true)]
        [string] $Database,
        [Parameter(ParameterSetName = "View")]
        [Parameter(ParameterSetName = "List")]
        [Parameter(ParameterSetName = "Show")]
        [Parameter(ParameterSetName = "Validation")]
        [Parameter(ParameterSetName = "CustomData")]
        [Parameter(mandatory=$true)]
        [string] $Document,
        [Parameter(ParameterSetName = "View")]
        [Parameter(ParameterSetName = "List")]
        [string] $ViewName,
        [Parameter(ParameterSetName = "View")]
        [Parameter(ParameterSetName = "List")]
        [string] $ViewKey,
        [Parameter(ParameterSetName = "View")]
        [Parameter(ParameterSetName = "List")]
        [string] $ViewValue,
        [Parameter(ParameterSetName = "View")]
        [Parameter(ParameterSetName = "List")]
        [switch] $GetDoc,
        [Parameter(ParameterSetName = "List")]
        [string] $ListName,
        [Parameter(ParameterSetName = "Show")]
        [string] $ShowName,
        [Parameter(ParameterSetName = "Show")]
        [string] $ShowKey,
        [Parameter(ParameterSetName = "Show")]
        [string] $ShowValue,
        [Parameter(ParameterSetName = "Validation")]
        [array] $ValidationRequirements,
        [Parameter(ParameterSetName = "Validation")]
        [switch] $ValidationAuthor,
        [Parameter(ParameterSetName = "CustomData")]
        $Data,
        [Parameter(ParameterSetName = "View")]
        [Parameter(ParameterSetName = "List")]
        [Parameter(ParameterSetName = "Show")]
        [Parameter(ParameterSetName = "Validation")]
        [Parameter(ParameterSetName = "CustomData")]
        [switch] $Replace,
        [Parameter(ParameterSetName = "View")]
        [Parameter(ParameterSetName = "List")]
        [Parameter(ParameterSetName = "Show")]
        [Parameter(ParameterSetName = "Validation")]
        [Parameter(ParameterSetName = "CustomData")]
        [string] $Authorization,
        [Parameter(ParameterSetName = "View")]
        [Parameter(ParameterSetName = "List")]
        [Parameter(ParameterSetName = "Show")]
        [Parameter(ParameterSetName = "Validation")]
        [Parameter(ParameterSetName = "CustomData")]
        [switch] $Ssl
    )
    # Instance new PSCouchDBDesignDoc object
    $DesignDoc = New-Object PSCouchDBDesignDoc
    # Get old design document
    $OldDesignDoc = Get-CouchDBDesignDocument -Server $Server -Port $Port -Database $Database -Document $Document -Authorization $Authorization -Ssl:$Ssl -ErrorAction SilentlyContinue
    # View
    if ($PsCmdlet.ParameterSetName -eq "View") {
        if ($ViewName -and $ViewKey -and $ViewValue -and $GetDoc) {
            $DesignDoc.AddView($ViewName, $ViewKey, $ViewValue, $GetDoc.IsPresent)
        } elseif ($ViewName -and $ViewKey -and $ViewValue) {
            $DesignDoc.AddView($ViewName, $ViewKey, $ViewValue)
        } elseif ($ViewName -and $ViewKey) {
            $DesignDoc.AddView($ViewName, $ViewKey)
        } elseif ($ViewName) {
            $DesignDoc.AddView($ViewName)
        }
    }
    # List
    if ($PsCmdlet.ParameterSetName -eq "List") {
        if ($ViewName -and $ViewKey -and $ViewValue -and $GetDoc) {
            $DesignDoc.AddView($ViewName, $ViewKey, $ViewValue, $GetDoc.IsPresent)
        } elseif ($ViewName -and $ViewKey -and $ViewValue) {
            $DesignDoc.AddView($ViewName, $ViewKey, $ViewValue)
        } elseif ($ViewName -and $ViewKey) {
            $DesignDoc.AddView($ViewName, $ViewKey)
        } elseif ($ViewName) {
            $DesignDoc.AddView($ViewName)
        }
        if ($ListName) {
            $DesignDoc.AddList($ListName)
        }
    }
    # Show
    if ($PsCmdlet.ParameterSetName -eq "Show") {
        if ($ShowName -and $ShowKey -and $ShowValue) {
            $DesignDoc.AddShow($ShowName, $ShowKey, $ShowValue)
        } elseif ($ShowName -and $ShowKey) {
            $DesignDoc.AddShow($ShowName, $ShowKey)
        } elseif ($ShowName) {
            $DesignDoc.AddShow($ShowName)
        }
    }
    # Validation
    if ($PsCmdlet.ParameterSetName -eq "Validation") {
        if ($ValidationRequirements -and $ValidationAuthor) {
            $DesignDoc.AddValidation($ValidationRequirements, $ValidationAuthor.IsPresent)
        } elseif ($ValidationRequirements) {
            $DesignDoc.AddValidation($ValidationRequirements)
        }
    }
    # CustomData
    if ($PsCmdlet.ParameterSetName -eq "CustomData") {
        if (($Data -as [hashtable]) -ne $null) {
            if (-not($Data.ContainsKey('language'))) { $Data.Add('language', 'javascript') }
            if (-not($Data.ContainsKey('views'))) { $Data.Add('views', @{}) }
            if (-not($Data.ContainsKey('shows'))) { $Data.Add('shows', @{}) }
            if (-not($Data.ContainsKey('lists'))) { $Data.Add('lists', @{}) }
            if (-not($Data.ContainsKey('validate_doc_update'))) { $Data.Add('validate_doc_update', "") }
        } else {
            $Json = $Data | ConvertFrom-Json
            $Data = @{}
            if (-not($Json.language.psobject.properties)) {
                $Data.language = "javascript"
            }
            if (-not($Json.views.psobject.properties)) {
                $Data.views = @{}
            } else {
                $Data.views = @{}
                $Json.views.psobject.properties | ForEach-Object {
                    $Data.views.Add($_.Name, $_.Value)
                }
            }
            if (-not($Json.shows.psobject.properties)) {
                $Data.shows = @{}
            } else {
                $Data.shows = @{}
                $Json.shows.psobject.properties | ForEach-Object {
                    $Data.shows.Add($_.Name, $_.Value)
                }
            }
            if (-not($Json.lists.psobject.properties)) {
                $Data.lists = @{}
            } else {
                $Data.lists = @{}
                $Json.lists.psobject.properties | ForEach-Object {
                    $Data.lists.Add($_.Name, $_.Value)
                }
            }
            if (-not($Json.validate_doc_update.psobject.properties)) {
                $Data.validate_doc_update = ''
            } else {
                $Data.validate_doc_update = $Json.validate_doc_update
            }
        }
        $DesignDoc = $Data
    }
    if (-not($Replace.IsPresent)) {
        # Build new design doc
        if (($OldDesignDoc.views.Count -ne 0) -and ($DesignDoc.views.Count -eq 0)) {
            $OldDesignDoc.views.psobject.properties | ForEach-Object {
                $DesignDoc.views.Add($_.Name, $_.Value)
            }
        } elseif (($OldDesignDoc.views.Count -ne 0) -and ($DesignDoc.views.Count -ne 0)) {
            $prop = Get-Member -InputObject $OldDesignDoc.views -MemberType NoteProperty
            foreach ($view in $prop) {
                if (-not($DesignDoc.views.$($view.Name))) {
                    $DesignDoc.views.Add("$($view.Name)", $OldDesignDoc.views.$($view.Name))
                }
            }
        }
        if (($OldDesignDoc.shows.Count -ne 0) -and ($DesignDoc.shows.Count -eq 0)) {
            $OldDesignDoc.shows.psobject.properties | ForEach-Object {
                $DesignDoc.shows.Add($_.Name, $_.Value)
            }
        } elseif (($OldDesignDoc.shows.Count -ne 0) -and ($DesignDoc.shows.Count -ne 0)) {
            $prop = Get-Member -InputObject $OldDesignDoc.shows -MemberType NoteProperty
            foreach ($show in $prop) {
                if (-not($DesignDoc.shows.$($show.Name))) {
                    $DesignDoc.shows.Add("$($show.Name)", $OldDesignDoc.shows.$($show.Name))
                }
            }
        }
        if (($OldDesignDoc.lists.Count -ne 0) -and ($DesignDoc.lists.Count -eq 0)) {
            $OldDesignDoc.lists.psobject.properties | ForEach-Object {
                $DesignDoc.lists.Add($_.Name, $_.Value)
            }
        } elseif (($OldDesignDoc.lists.Count -ne 0) -and ($DesignDoc.lists.Count -ne 0)) {
            $prop = Get-Member -InputObject $OldDesignDoc.lists -MemberType NoteProperty
            foreach ($list in $prop) {
                if (-not($DesignDoc.lists.$($list.Name))) {
                    $DesignDoc.lists.Add("$($list.Name)", $OldDesignDoc.lists.$($list.Name))
                }
            }
        }
        if (($OldDesignDoc.validate_doc_update -ne $null) -and ($DesignDoc.validate_doc_update -eq $null)) {
            $DesignDoc.validate_doc_update = $OldDesignDoc.validate_doc_update
        } else {
            $DesignDoc.Remove('validate_doc_update')
        }
    }
    if ($OldDesignDoc._rev) {
        $Revision = (Remove-CouchDBDesignDocument -Server $Server -Port $Port -Database $Database -Document $Document -Revision $OldDesignDoc._rev -Authorization $Authorization -Force -Ssl:$Ssl -ErrorAction SilentlyContinue)._rev
    }
    $Document = "_design/$Document"
    # CustomData
    if ($PsCmdlet.ParameterSetName -eq "CustomData") {
        $Data = $Data | ConvertTo-Json -Depth 99
    } else {
        $Data = $DesignDoc.GetDesignDocuments()
    }
    Send-CouchDBRequest -Server $Server -Port $Port -Method "PUT" -Database $Database -Document $Document -Revision $Revision -Data $Data -Authorization $Authorization -Ssl:$Ssl
}

function Set-CouchDBAttachment () {
    <#
    .SYNOPSIS
    Modify attachment.
    .DESCRIPTION
    Modify attachment from CouchDB document.
    .EXAMPLE
    Set-CouchDBAttachment -Database test -Document "001" -Attachment C:\test.html -Authorization "admin:password"
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory=$true)]
        [string] $Database,
        [Parameter(mandatory=$true)]
        [string] $Document,
        [Parameter(mandatory=$true)]
        [string] $Revision,
        [string] $Attachment,
        [string] $Authorization,
        [switch] $Ssl
    )
    Send-CouchDBRequest -Server $Server -Port $Port -Method "PUT" -Database $Database -Document $Document -Revision $Revision -Attachment $Attachment -Authorization $Authorization -Ssl:$Ssl
}

function Set-CouchDBUser () {
    <#
    .SYNOPSIS
    Set an user properties.
    .DESCRIPTION
    Set a CouchDB user properties with roles. Reset password user.
    .EXAMPLE
    $password = "password" | ConvertTo-SecureString -AsPlainText -Force
    Set-CouchDBUser -Userid test_user -Password $password -Revision "2-4705a219cdcca7c72aac4f623f5c46a8" -Authorization "admin:password"
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [string] $Database = "_users",
        [Parameter(mandatory=$true)]
        [string] $Userid,
        [Parameter(mandatory=$true)]
        [SecureString] $Password,
        [array] $Roles,
        [Parameter(mandatory=$true)]
        [string] $Revision,
        [string] $Authorization,
        [switch] $Ssl
    )
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
    .EXAMPLE
    $password = "password" | ConvertTo-SecureString -AsPlainText -Force
    Set-CouchDBAdmin -Userid test_user -Password $password -Authorization "admin:password"
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [string] $Database = "_node",
        [string] $Node = "couchdb@localhost",
        [Parameter(mandatory=$true)]
        [string] $Userid,
        [Parameter(mandatory=$true)]
        [SecureString] $Password,
        [string] $Authorization,
        [switch] $Ssl
    )
    $Document = "$Node/_config/admins/$Userid"
    $ClearPassword = ConvertTo-CouchDBPassword -SecurePassword $Password
    $Data = "`"$ClearPassword`""
    Send-CouchDBRequest -Server $Server -Port $Port -Method "PUT" -Database $Database -Document $Document -Data $Data -Authorization $Authorization -Ssl:$Ssl
}

function Set-CouchDBConfiguration () {
    <#
    .SYNOPSIS
    Set element configuration.
    .DESCRIPTION
    Set element configuration of CouchDB.
    .EXAMPLE
    Set-CouchDBConfiguration -Element attachments -Key compression_level -Value 10 -Authorization "admin:password"
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [string] $Database = "_node",
        [string] $Node = "couchdb@localhost",
        [Parameter(mandatory=$true)]
        [string] $Element,
        [Parameter(mandatory=$true)]
        [string] $Key,
        [Parameter(mandatory=$true)]
        [string] $Value,
        [string] $Authorization,
        [switch] $Ssl
    )
    $Document = "$Node/_config"
    if ((Get-CouchDBConfiguration -Authorization $Authorization -Ssl:$Ssl).$Element) {
        $Document += "/$Element/$Key"
    } else {
        throw "Element $Element not exist!"
    }
    $Data = "$Value" | ConvertTo-Json
    Send-CouchDBRequest -Server $Server -Port $Port -Method "PUT" -Database $Database -Document $Document -Data $Data -Authorization $Authorization -Ssl:$Ssl
}

function Set-CouchDBReplication () {
    <#
    .SYNOPSIS
    Modify database replication.
    .DESCRIPTION
    Modify database of CouchDB.
    .EXAMPLE
    Set-CouchDBReplication -Document replica_id1 -Revision "2-4705a219cdcca7c72aac4f623f5c46a8" -Continuous -Authorization "admin:password"
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [string] $Database = "_replicator",
        [Parameter(mandatory=$true)]
        [string] $Document,
        [Parameter(mandatory=$true)]
        [string] $Revision,
        [switch] $Continuous,
        [string] $Authorization,
        [switch] $Ssl
    )
    if (-not(Get-CouchDBDatabase -Database $Database -Authorization $Authorization -Ssl:$Ssl)) {
        throw "Database replicator $Database is not exists."
    }
    if ($Continuous.IsPresent) {
        $Continuous_value = $true
    } else {
        $Continuous_value = $false
    }
    $Data = Get-CouchDBReplication -Document $Document -Authorization $Authorization -Ssl:$Ssl
    $Data.continuous = $Continuous_value
    $Data = $Data | ConvertTo-Json
    Send-CouchDBRequest -Server $Server -Port $Port -Method "PUT" -Database $Database -Document $Document -Revision $Revision -Data $Data -Authorization $Authorization -Ssl:$Ssl
}

function Grant-CouchDBDatabasePermission () {
    <#
    .SYNOPSIS
    Grant permission on database.
    .DESCRIPTION
    Grant permission on database. Specify Admins and/or Readers.
    .EXAMPLE
    Grant-CouchDBDatabasePermission -Database example -AdminUser admin -AdminRoles technician -ReaderUser user1 -Authorization "admin:password"
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [array]$AdminUser,
        [array]$AdminRoles,
        [array]$ReaderUser,
        [array]$UserRoles,
        [string] $Authorization,
        [switch] $Ssl
    )
    [string] $Database = '_users'
    # Check if admin user exists
    foreach ($User in $AdminUser) {
        if (-not((Get-CouchDBUser -Database $Database -Userid $User -Authorization $Authorization -Ssl:$Ssl -ErrorAction SilentlyContinue).name -eq $User)) {
            throw "Admin user $User not exists!"
        }
    }
    # Check if reader user exists
    foreach ($User in $ReaderUser) {
        if (-not((Get-CouchDBUser -Database $Database -Userid $User -Authorization $Authorization -Ssl:$Ssl -ErrorAction SilentlyContinue).name -eq $User)) {
            throw "Reader user $User not exists!"
        }
    }
    # TODO migrate to hashtable and convert to json
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
    Send-CouchDBRequest -Server $Server -Port $Port -Method "PUT" -Database $Database -Document $Document -Data $Data -Authorization $Authorization -Ssl:$Ssl
}

function Grant-CouchDBDatabaseSecurity () {
    <#
    .SYNOPSIS
    Grant the security object for the given database.
    .DESCRIPTION
    Grant the security object for the given CouchDB database. Specify Admins and/or Readers.
    .EXAMPLE
    Grant-CouchDBDatabaseSecurity -Database example -AdminUser admin -AdminRoles technician -ReaderUser user1 -Authorization "admin:password"
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory=$true)]
        [string] $Database,
        [array]$AdminUser,
        [array]$AdminRoles,
        [array]$ReaderUser,
        [array]$UserRoles,
        [string] $Authorization,
        [switch] $Ssl
    )
    [string] $Document = '_security'
    # Check if admin user exists
    foreach ($User in $AdminUser) {
        if (-not((Get-CouchDBUser -Database '_users' -Userid $User -Authorization $Authorization -Ssl:$Ssl -ErrorAction SilentlyContinue).name -eq $User)) {
            throw "Admin user $User not exists!"
        }
    }
    # Check if reader user exists
    foreach ($User in $ReaderUser) {
        if (-not((Get-CouchDBUser -Database '_users' -Userid $User -Authorization $Authorization -Ssl:$Ssl -ErrorAction SilentlyContinue).name -eq $User)) {
            throw "Reader user $User not exists!"
        }
    }
    # TODO migrate to hashtable and convert to json
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
    Send-CouchDBRequest -Server $Server -Port $Port -Method "PUT" -Database $Database -Document $Document -Data $Data -Authorization $Authorization -Ssl:$Ssl
}

function Revoke-CouchDBDatabasePermission () {
    <#
    .SYNOPSIS
    Revoke permission on database.
    .DESCRIPTION
    Revoke permission on database. Specify Admins and/or Readers.
    .EXAMPLE
    Revoke-CouchDBDatabasePermission -Database example -Authorization "admin:password"
    #>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory=$true)]
        [string] $Database,
        [string] $Authorization,
        [switch]$Force,
        [switch] $Ssl
    )
    if ($Force -or $PSCmdlet.ShouldContinue("Do you wish revoke all permission on database $Database ?","Revoke all permission on database $Database")) {
        # Get a current security permission
        if (-not(Get-CouchDBDocument -Database $Database -Document '_security' -Authorization $Authorization -Ssl:$Ssl)) {
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
        Send-CouchDBRequest -Server $Server -Port $Port -Method "PUT" -Database $Database -Document $Document -Data $Data -Authorization $Authorization -Ssl:$Ssl
    }
}

function New-CouchDBDatabase () {
    <#
    .SYNOPSIS
    Create a new database.
    .DESCRIPTION
    Create a new CouchDB database.
    .EXAMPLE
    New-CouchDBDatabase -Database test -Authorization "admin:password"
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory=$true)]
        [string] $Database,
        [string] $Authorization,
        [switch] $Ssl
    )
    Send-CouchDBRequest -Server $Server -Port $Port -Method "PUT" -Database $Database -Authorization $Authorization -Ssl:$Ssl
}

function New-CouchDBDocument () {
    <#
    .SYNOPSIS
    Create a new document.
    .DESCRIPTION
    Create a new CouchDB document with json data.
    .EXAMPLE
    $data = '{"name":"Jhon", "surname":"Lennon"}'
    New-CouchDBDocument -Database test -Document "001" -Data $data -Authorization "admin:password"
    .EXAMPLE
    $data = @{"name"="Jhon", "surname"="Lennon"}
    New-CouchDBDocument -Database test -Document "001" -Data $data -Authorization "admin:password"
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory=$true)]
        [string] $Database,
        [Parameter(mandatory=$true)]
        [string] $Document,
        [Parameter(mandatory=$true)]
        $Data,
        [string] $Authorization,
        [switch] $Ssl
    )
    if (($Data -as [hashtable]) -ne $null) {
        # Json Data
        $Data = $Data | ConvertTo-Json -Depth 99
    }
    Send-CouchDBRequest -Server $Server -Port $Port -Method "PUT" -Database $Database -Document $Document -Data $Data -Authorization $Authorization -Ssl:$Ssl
}

function New-CouchDBDesignDocument () {
    <#
    .SYNOPSIS
    Create a new design document.
    .DESCRIPTION
    Create a new CouchDB design document with json data.
    .EXAMPLE
    New-CouchDBDesignDocument -Database test -Document "mydesigndoc" -ViewName "data_test" -Authorization "admin:password"
    .EXAMPLE
    $data = '{"views":{"data_test":{"map":"function(doc) {emit(doc._id, doc._rev)}"}}}'
    New-CouchDBDesignDocument -Database test -Document "mydesigndoc" -Data $data -Authorization "admin:password"
    .EXAMPLE
    $data = @{"views"=@{"data_test"=@{"map"="function(doc) {emit(doc._id, doc._rev)}"}}}
    New-CouchDBDesignDocument -Database test -Document "mydesigndoc" -Data $data -Authorization "admin:password"
    #>
    [CmdletBinding(DefaultParameterSetName = "View")]
    param(
        [Parameter(ParameterSetName = "View")]
        [Parameter(ParameterSetName = "List")]
        [Parameter(ParameterSetName = "Show")]
        [Parameter(ParameterSetName = "Validation")]
        [Parameter(ParameterSetName = "CustomData")]
        [string] $Server,
        [Parameter(ParameterSetName = "View")]
        [Parameter(ParameterSetName = "List")]
        [Parameter(ParameterSetName = "Show")]
        [Parameter(ParameterSetName = "Validation")]
        [Parameter(ParameterSetName = "CustomData")]
        [int] $Port,
        [Parameter(ParameterSetName = "View")]
        [Parameter(ParameterSetName = "List")]
        [Parameter(ParameterSetName = "Show")]
        [Parameter(ParameterSetName = "Validation")]
        [Parameter(ParameterSetName = "CustomData")]
        [Parameter(mandatory=$true)]
        [string] $Database,
        [Parameter(ParameterSetName = "View")]
        [Parameter(ParameterSetName = "List")]
        [Parameter(ParameterSetName = "Show")]
        [Parameter(ParameterSetName = "Validation")]
        [Parameter(ParameterSetName = "CustomData")]
        [Parameter(mandatory=$true)]
        [string] $Document,
        [Parameter(ParameterSetName = "View")]
        [Parameter(ParameterSetName = "List")]
        [string] $ViewName,
        [Parameter(ParameterSetName = "View")]
        [Parameter(ParameterSetName = "List")]
        [string] $ViewKey,
        [Parameter(ParameterSetName = "View")]
        [Parameter(ParameterSetName = "List")]
        [string] $ViewValue,
        [Parameter(ParameterSetName = "View")]
        [Parameter(ParameterSetName = "List")]
        [switch] $GetDoc,
        [Parameter(ParameterSetName = "List")]
        [string] $ListName,
        [Parameter(ParameterSetName = "Show")]
        [string] $ShowName,
        [Parameter(ParameterSetName = "Show")]
        [string] $ShowKey,
        [Parameter(ParameterSetName = "Show")]
        [string] $ShowValue,
        [Parameter(ParameterSetName = "Validation")]
        [array] $ValidationRequirements,
        [Parameter(ParameterSetName = "Validation")]
        [switch] $ValidationAuthor,
        [Parameter(ParameterSetName = "CustomData")]
        $Data,
        [Parameter(ParameterSetName = "View")]
        [Parameter(ParameterSetName = "List")]
        [Parameter(ParameterSetName = "Show")]
        [Parameter(ParameterSetName = "Validation")]
        [Parameter(ParameterSetName = "CustomData")]
        [string] $Authorization,
        [Parameter(ParameterSetName = "View")]
        [Parameter(ParameterSetName = "List")]
        [Parameter(ParameterSetName = "Show")]
        [Parameter(ParameterSetName = "Validation")]
        [Parameter(ParameterSetName = "CustomData")]
        [switch] $Ssl
    )
    $Document = "_design/$Document"
    # Instance new PSCouchDBDesignDoc object
    $DesignDoc = New-Object PSCouchDBDesignDoc
    # View
    if ($PsCmdlet.ParameterSetName -eq "View") {
        if ($ViewName -and $ViewKey -and $ViewValue -and $GetDoc) {
            $DesignDoc.AddView($ViewName, $ViewKey, $ViewValue, $GetDoc.IsPresent)
        } elseif ($ViewName -and $ViewKey -and $ViewValue) {
            $DesignDoc.AddView($ViewName, $ViewKey, $ViewValue)
        } elseif ($ViewName -and $ViewKey) {
            $DesignDoc.AddView($ViewName, $ViewKey)
        } elseif ($ViewName) {
            $DesignDoc.AddView($ViewName)
        }
        $Data = $DesignDoc.GetDesignDocuments()
    }
    # List
    if ($PsCmdlet.ParameterSetName -eq "List") {
        if ($ViewName -and $ViewKey -and $ViewValue -and $GetDoc) {
            $DesignDoc.AddView($ViewName, $ViewKey, $ViewValue, $GetDoc.IsPresent)
        } elseif ($ViewName -and $ViewKey -and $ViewValue) {
            $DesignDoc.AddView($ViewName, $ViewKey, $ViewValue)
        } elseif ($ViewName -and $ViewKey) {
            $DesignDoc.AddView($ViewName, $ViewKey)
        } elseif ($ViewName) {
            $DesignDoc.AddView($ViewName)
        }
        if ($ListName) {
            $DesignDoc.AddList($ListName)
        }
        $Data = $DesignDoc.GetDesignDocuments()
    }
    # Show
    if ($PsCmdlet.ParameterSetName -eq "Show") {
        if ($ShowName -and $ShowKey -and $ShowValue) {
            $DesignDoc.AddShow($ShowName, $ShowKey, $ShowValue)
        } elseif ($ShowName -and $ShowKey) {
            $DesignDoc.AddShow($ShowName, $ShowKey)
        } elseif ($ShowName) {
            $DesignDoc.AddShow($ShowName)
        }
        $Data = $DesignDoc.GetDesignDocuments()
    }
    # Validation
    if ($PsCmdlet.ParameterSetName -eq "Validation") {
        if ($ValidationRequirements -and $ValidationAuthor) {
            $DesignDoc.AddValidation($ValidationRequirements, $ValidationAuthor.IsPresent)
        } elseif ($ValidationRequirements) {
            $DesignDoc.AddValidation($ValidationRequirements)
        }
        $Data = $DesignDoc.GetDesignDocuments()
    }
    # CustomData
    if ($PsCmdlet.ParameterSetName -eq "CustomData") {
        if (($Data -as [hashtable]) -ne $null) {
            $Data = $Data | ConvertTo-Json -Depth 99
        }
    }
    Send-CouchDBRequest -Server $Server -Port $Port -Method "PUT" -Database $Database -Document $Document -Data $Data -Authorization $Authorization -Ssl:$Ssl
}

function New-CouchDBAttachment () {
    <#
    .SYNOPSIS
    Create a new attachment document.
    .DESCRIPTION
    Create a new CouchDB attachment document.
    .EXAMPLE
    New-CouchDBAttachment -Database test -Document "001" -Attachment C:\test.html -Revision "2-4705a219cdcca7c72aac4f623f5c46a8" -Authorization "admin:password"
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory=$true)]
        [string] $Database,
        [Parameter(mandatory=$true)]
        [string] $Document,
        [Parameter(mandatory=$true)]
        [string] $Attachment,
        [Parameter(mandatory=$true)]
        [string] $Revision,
        [string] $Authorization,
        [switch] $Ssl
    )
    Send-CouchDBRequest -Server $Server -Port $Port -Method "PUT" -Database $Database -Document $Document -Attachment $Attachment -Revision $Revision -Authorization $Authorization -Ssl:$Ssl
}

function New-CouchDBUser () {
    <#
    .SYNOPSIS
    Create a new user.
    .DESCRIPTION
    Create a new CouchDB user with roles.
    .EXAMPLE
    $password = "password" | ConvertTo-SecureString -AsPlainText -Force
    New-CouchDBUser -Userid test_user -Password $password -Authorization "admin:password"
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [string] $Database = "_users",
        [Parameter(mandatory=$true)]
        [string] $Userid,
        [Parameter(mandatory=$true)]
        [SecureString] $Password,
        [array] $Roles,
        [string] $Authorization,
        [switch] $Ssl
    )
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

function New-CouchDBAdmin () {
    <#
    .SYNOPSIS
    Create a new admin user.
    .DESCRIPTION
    Create a new CouchDB admin user.
    .EXAMPLE
    $password = "password" | ConvertTo-SecureString -AsPlainText -Force
    New-CouchDBAdmin -Userid test_user -Password $password -Authorization "admin:password"
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [string] $Database = "_node",
        [string] $Node = "couchdb@localhost",
        [Parameter(mandatory=$true)]
        [string] $Userid,
        [Parameter(mandatory=$true)]
        [SecureString] $Password,
        [string] $Authorization,
        [switch] $Ssl
    )
    $Document = "$Node/_config/admins/$Userid"
    $ClearPassword = ConvertTo-CouchDBPassword -SecurePassword $Password
    $Data = "`"$ClearPassword`""
    Send-CouchDBRequest -Server $Server -Port $Port -Method "PUT" -Database $Database -Document $Document -Data $Data -Authorization $Authorization -Ssl:$Ssl
}

function New-CouchDBReplication () {
    <#
    .SYNOPSIS
    Create a new replication job.
    .DESCRIPTION
    Create a new replication job for a specidfic database.
    .EXAMPLE
    New-CouchDBReplication -SourceServer localhost -TargetServer server1 -SourceDatabase test -TargetDatabase test_replica -Continuous -Authorization "admin:password"
    #>
    [CmdletBinding()]
    param(
        [string] $SourceServer = 'localhost',
        [string] $TargetServer = 'localhost',
        [int] $SourcePort,
        [int] $TargetPort,
        [string] $Database = "_replicator",
        [string] $SourceDatabase,
        [string] $TargetDatabase,
        [switch] $Continuous,
        [string] $Authorization,
        [switch] $Ssl
    )
    $Server = $SourceServer
    $Port = $SourcePort
    # Check if replicator database exists
    if (-not(Get-CouchDBDatabase -Server $Server -Port $Port -Database $Database -Authorization $Authorization -Ssl:$Ssl -ErrorAction SilentlyContinue)) {
        New-CouchDBDatabase -Server $Server -Port $Port -Database $Database -Authorization $Authorization -Ssl:$Ssl | Out-Null
    }
    # Check if target database exists
    if (-not(Get-CouchDBDatabase -Server $Server -Port $Port -Database $TargetDatabase -Authorization $Authorization -Ssl:$Ssl -ErrorAction SilentlyContinue)) {
        New-CouchDBDatabase -Server $Server -Port $Port -Database $TargetDatabase -Authorization $Authorization -Ssl:$Ssl | Out-Null
    }
    # Set protocol
    if ($Ssl.IsPresent) {
        if (-not($SourcePort)) {
            $SourcePort = 6984
        }
        if (-not($TargetPort)) {
            $TargetPort = 6984
        }
        # Set SSL protocol
        $Protocol = 'https'
    } else {
        if (-not($SourcePort)) {
            $SourcePort = 5984
        }
        if (-not($TargetPort)) {
            $TargetPort = 5984
        }
        # Set deafult protocol
        $Protocol = 'http'
    }
    # Create Source and Target URL
    $Source = "${Protocol}://$SourceServer`:$SourcePort/$SourceDatabase"
    $Target = "${Protocol}://$TargetServer`:$TargetPort/$TargetDatabase"
    if ($Continuous.IsPresent) {
        $Continuous_value = "true"
    } else {
        $Continuous_value = "false"
    }
    # Create data
    $Data = "{
    `"_id`":`"$SourceServer`-$SourceDatabase`_$TargetServer`-$TargetDatabase`",
    `"source`":`"$Source`",
    `"target`":`"$Target`",
    `"continuous`":$Continuous_value
    }"
    Send-CouchDBRequest -Server $Server -Port $Port -Method "POST" -Database $Database -Document $Document -Data $Data -Authorization $Authorization -Ssl:$Ssl
}

function New-CouchDBIndex () {
    <#
    .SYNOPSIS
    Create a new index of database.
    .DESCRIPTION
    Create a new index of CouchDB database.
    .EXAMPLE
    New-CouchDBIndex -Database test -Name test-index -Fields name,surname -Authorization "admin:password"
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory=$true)]
        [string] $Database,
        [Parameter(mandatory=$true)]
        [string] $Name,
        [Parameter(mandatory=$true)]
        [array] $Fields,
        [string] $Authorization,
        [switch] $Ssl
    )
    $Document = '_index'
    $index = @{ 'index' = @{}; 'type' = 'json' }
    $index.name = "$Name"
    $index.index.fields = @()
    foreach ($Field in $Fields) {
        $index.index.fields += $Field
    }
    $Data = $index | ConvertTo-Json -Depth 3 -Compress
    Send-CouchDBRequest -Server $Server -Port $Port -Method "POST" -Database $Database -Document $Document -Data $Data -Authorization $Authorization -Ssl:$Ssl
}

function New-CouchDBUuids () {
    <#
    .SYNOPSIS
    Create a new uuids.
    .DESCRIPTION
    Create a new CouchDB uuids.
    .EXAMPLE
    New-CouchDBUuids -Count 3 -Authorization "admin:password"
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [int] $Count,
        [string] $Authorization,
        [switch] $Ssl
    )
    $Database = '_uuids'
    # Check count
    if ($Count) {
        $Database += "?count=$Count"
    }
    Send-CouchDBRequest -Server $Server -Port $Port -Method "GET" -Database $Database -Authorization $Authorization -Ssl:$Ssl
}

function Enable-CouchDBCluster () {
    <#
    .SYNOPSIS
    Create a new cluster.
    .DESCRIPTION
    Create a new cluster CouchDB server.
    .EXAMPLE
    Enable-CouchDBCluster -Authorization "admin:password"
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [int] $NodeCount = 3,
        [string] $Authorization,
        [switch] $Ssl
    )
    $Database = "_cluster_setup"
    $Credential = $Authorization -split ":"
    $Data = "
    {
        `"action`": `"enable_cluster`",
        `"bind_address`": `"0.0.0.0`",
        `"username`": `"$($Credential[0])`",
        `"password`": `"$($Credential[1])`",
        `"node_count`": `"$NodeCount`"
    }
    "
    Write-Host "Enabling cluster"
    Send-CouchDBRequest -Server $Server -Port $Port -Method "POST" -Database $Database -Data $Data -Authorization $Authorization -Ssl:$Ssl
    $Data = '{"action": "finish_cluster"}'
    Write-Host "Finishing cluster"
    Send-CouchDBRequest -Server $Server -Port $Port -Method "POST" -Database $Database -Data $Data -Authorization $Authorization -Ssl:$Ssl
}

function Remove-CouchDBDatabase () {
    <#
    .SYNOPSIS
    Remove a database.
    .DESCRIPTION
    Remove a CouchDB database.
    .EXAMPLE
    Remove-CouchDBDatabase -Database test -Authorization "admin:password"
    #>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory=$true)]
        [string] $Database,
        [string] $Authorization,
        [switch]$Force,
        [switch] $Ssl
    )
    if ($Force -or $PSCmdlet.ShouldContinue("Do you wish remove database $Database ?","Remove database $Database")) {
        Send-CouchDBRequest -Server $Server -Port $Port -Method "DELETE" -Database $Database -Authorization $Authorization -Ssl:$Ssl
    }
}

function Remove-CouchDBDocument () {
    <#
    .SYNOPSIS
    Remove a document.
    .DESCRIPTION
    Remove a CouchDB document.
    .EXAMPLE
    Remove-CouchDBDocument -Database test -Document "001" -Revision "2-4705a219cdcca7c72aac4f623f5c46a8" -Authorization "admin:password"
    #>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory=$true)]
        [string] $Database,
        [Parameter(mandatory=$true)]
        [string] $Document,
        [Parameter(mandatory=$true)]
        [string] $Revision,
        [string] $Authorization,
        [switch]$Force,
        [switch] $Ssl
    )
    if ($Force -or $PSCmdlet.ShouldContinue("Do you wish remove document $Document on database $Database ?","Remove document $Document on database $Database")) {
        Send-CouchDBRequest -Server $Server -Port $Port -Method "DELETE" -Database $Database -Document $Document -Revision $Revision -Authorization $Authorization -Ssl:$Ssl
    }
}

function Remove-CouchDBDesignDocument () {
    <#
    .SYNOPSIS
    Remove a design document.
    .DESCRIPTION
    Remove a CouchDB design document.
    .EXAMPLE
    Remove-CouchDBDesignDocument -Database test -Document "mydesigndoc" -Revision "2-4705a219cdcca7c72aac4f623f5c46a8" -Authorization "admin:password"
    #>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(Mandatory=$true)]
        [string] $Database,
        [Parameter(Mandatory=$true)]
        [string] $Document,
        [Parameter(Mandatory=$true)]
        [string] $Revision,
        [string] $Authorization,
        [switch]$Force,
        [switch] $Ssl
    )
    $Document = "_design/$Document"
    if ($Force -or $PSCmdlet.ShouldContinue("Do you wish remove design document $Document on database $Database ?","Remove design document $Document on database $Database")) {
        Send-CouchDBRequest -Server $Server -Port $Port -Method "DELETE" -Database $Database -Document $Document -Revision $Revision -Authorization $Authorization -Ssl:$Ssl
    }
}

function Remove-CouchDBAttachment () {
    <#
    .SYNOPSIS
    Remove an attachment document.
    .DESCRIPTION
    Remove a CouchDB attachment document.
    .EXAMPLE
    Remove-CouchDBAttachment -Database test -Document "001" -Attachment test.html -Revision "2-4705a219cdcca7c72aac4f623f5c46a8" -Authorization "admin:password"
    #>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory=$true)]
        [string] $Database,
        [Parameter(mandatory=$true)]
        [string] $Document,
        [Parameter(mandatory=$true)]
        [string] $Attachment,
        [Parameter(mandatory=$true)]
        [string] $Revision,
        [string] $Authorization,
        [switch] $Ssl
    )
    if ($PSCmdlet.ShouldContinue("Do you wish remove attachment $Attachment in document $Document on database $Database ?","Remove attachment $Attachment in document $Document on database $Database")) {
        Send-CouchDBRequest -Server $Server -Port $Port -Method "DELETE" -Database $Database -Document $Document -Attachment $Attachment -Revision $Revision -Authorization $Authorization -Ssl:$Ssl
    }
}

function Remove-CouchDBUser () {
    <#
    .SYNOPSIS
    Remove an user.
    .DESCRIPTION
    Remove a CouchDB user with roles.
    .EXAMPLE
    Remove-CouchDBUser -Userid test_user -Revision "2-4705a219cdcca7c72aac4f623f5c46a8" -Authorization "admin:password"
    #>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [string] $Server,
        [int] $Port,
        [string] $Database = "_users",
        [Parameter(mandatory=$true)]
        [string] $Userid,
        [Parameter(mandatory=$true)]
        [string] $Revision,
        [string] $Authorization,
        [switch]$Force,
        [switch] $Ssl
    )
    $Document = "org.couchdb.user:$Userid"
    if ($Force -or $PSCmdlet.ShouldContinue("Do you wish remove user $Userid ?","Remove $Userid on database $Database")) {
        Send-CouchDBRequest -Server $Server -Port $Port -Method "DELETE" -Database $Database -Document $Document -Revision $Revision -Authorization $Authorization -Ssl:$Ssl
    }
}

function Remove-CouchDBAdmin () {
    <#
    .SYNOPSIS
    Remove an admin user.
    .DESCRIPTION
    Remove a CouchDB admin user.
    .EXAMPLE
    Remove-CouchDBAdmin -Userid test_user -Authorization "admin:password"
    #>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [string] $Server,
        [int] $Port,
        [string] $Database = "_node",
        [string] $Node = "couchdb@localhost",
        [Parameter(mandatory=$true)]
        [string] $Userid,
        [string] $Authorization,
        [switch]$Force,
        [switch] $Ssl
    )
    $Document = "$Node/_config/admins/$Userid"
    if ($Force -or $PSCmdlet.ShouldContinue("Do you wish remove admin user $Userid ?","Remove $Userid on node $Node")) {
        Send-CouchDBRequest -Server $Server -Port $Port -Method "DELETE" -Database $Database -Document $Document -Authorization $Authorization -Ssl:$Ssl
    }
}

function Remove-CouchDBNode () {
    <#
    .SYNOPSIS
    Remove server nodes.
    .DESCRIPTION
    Remove server nodes of CouchDB.
    .EXAMPLE
    Remove-CouchDBNode -Node test -Authorization "admin:password"
    #>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [string] $Server,
        [int] $Port,
        [string] $Database = "_nodes",
        [Parameter(mandatory=$true)]
        [string] $Node,
        [string] $Authorization,
        [switch]$Force,
        [switch] $Ssl
    )
    # Set protocol
    if ($Ssl.IsPresent) {
        if (-not($Port)) {
            $Port = 6986
        }
    } else {
        if (-not($Port)) {
            $Port = 5986
        }
    }
    if (Get-CouchDBDocument -Port $Port -Database $Database -Document $Node -Authorization $Authorization -Ssl:$Ssl -ErrorAction SilentlyContinue) {
        $Revision = (Get-CouchDBDocument -Port $Port -Database $Database -Document $Node -Authorization $Authorization -Ssl:$Ssl)._rev
    } else {
        throw "Node $Node not exist."
    }
    $Document = $Node
    if ($Force -or $PSCmdlet.ShouldContinue("Do you wish remove node $Node ?","Remove $Node")) {
        Send-CouchDBRequest -Server $Server -Port $Port -Method "DELETE" -Database $Database -Document $Document -Revision $Revision -Authorization $Authorization -Ssl:$Ssl
    }
}

function Remove-CouchDBReplication () {
    <#
    .SYNOPSIS
    Remove replication.
    .DESCRIPTION
    Remove replication of CouchDB.
    .EXAMPLE
    Remove-CouchDBReplication -Document replica_id1 -Revision "2-4705a219cdcca7c72aac4f623f5c46a8" -Authorization "admin:password"
    #>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [string] $Server,
        [int] $Port,
        [string] $Database = "_replicator",
        [Parameter(mandatory=$true)]
        [string] $Document,
        [Parameter(mandatory=$true)]
        [string] $Revision,
        [string] $Authorization,
        [switch] $Force,
        [switch] $Ssl
    )
    if (-not(Get-CouchDBDatabase -Database $Database -Authorization $Authorization -Ssl:$Ssl)) {
        throw "Database replicator $Database is not exists."
    }
    if ($Force -or $PSCmdlet.ShouldContinue("Do you wish remove replication $Document ?","Remove $Document")) {
        Send-CouchDBRequest -Server $Server -Port $Port -Method "DELETE" -Database $Database -Document $Document -Revision $Revision -Authorization $Authorization -Ssl:$Ssl
    }
}

function Remove-CouchDBIndex () {
    <#
    .SYNOPSIS
    Remove a index of a database.
    .DESCRIPTION
    Remove a index of CouchDB database.
    .EXAMPLE
    $ddoc = Get-CouchDBIndex -Database test -Authorization "admin:password"
    Remove-CouchDBIndex -Database test -DesignDoc $ddoc.indexes.ddoc[1] -Name $ddoc.indexes.name[1] -Authorization "admin:password"
    #>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory=$true)]
        [string] $Database,
        [Parameter(mandatory=$true)]
        [string] $DesignDoc,
        [Parameter(mandatory=$true)]
        [string] $Name,
        [string] $Authorization,
        [switch]$Force,
        [switch] $Ssl
    )
    $Document = "_index/$DesignDoc/json/$Name"
    if ($Force -or $PSCmdlet.ShouldContinue("Do you wish remove index $DesignDoc ?","Remove index $DesignDoc on database $Database")) {
        Send-CouchDBRequest -Server $Server -Port $Port -Method "DELETE" -Database $Database -Document $Document -Authorization $Authorization -Ssl:$Ssl
    }
}

function Restart-CouchDBServer () {
    <#
    .SYNOPSIS
    Restart server.
    .DESCRIPTION
    Restart CouchDB server.
    .EXAMPLE
    Restart-CouchDBServer -Authorization "admin:password"
    #>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [switch] $Force
    )
    if ($Force -or $PSCmdlet.ShouldContinue("Do you wish to restart CouchDB server ?","Restart server")) {
        Restart-Service -Name "Apache CouchDB" -Force
    }
}

function Find-CouchDBDocuments () {
    <#
    .SYNOPSIS
    Find document data in a database.
    .DESCRIPTION
    Find document data in a CouchDB database.
    .EXAMPLE
    Find-CouchDBDocuments -Database test -Selector "color" -Value "red" -Fields _id,color -Operator eq -Authorization "read_user:password"
    .EXAMPLE
    Find-CouchDBDocuments -Database test -Find '{"selector": {"color":{"$eq":"red"}},"fields":["_id","color"]}' -Authorization "read_user:password"
    .EXAMPLE
    using module PSCouchDB
    $q = New-Object -TypeName PSCouchDBQuery
    $q.AddSelector("color","red")
    $q.AddSelectorOperator('$eq')
    $q.AddFields("_id")
    $q.AddFields("color")
    Find-CouchDBDocuments -Database test -Find $q.GetNativeQuery() -Authorization "read_user:password"
    #>
    [CmdletBinding(DefaultParameterSetName = "PSCouchDB")]
    param (
        [Parameter(ParameterSetName = "PSCouchDB")]
        [Parameter(ParameterSetName = "Native")]
        [string] $Server,
        [Parameter(ParameterSetName = "PSCouchDB")]
        [Parameter(ParameterSetName = "Native")]
        [int] $Port,
        [Parameter(ParameterSetName = "PSCouchDB")]
        [Parameter(ParameterSetName = "Native")]
        [Parameter(mandatory=$true)]
        [string] $Database,
        [Parameter(ParameterSetName = "PSCouchDB")]
        [switch] $Explain,
        [Parameter(ParameterSetName = "PSCouchDB")]
        [string] $Selector,
        [Parameter(ParameterSetName = "PSCouchDB")]
        [string] $Value,
        [Parameter(ParameterSetName = "PSCouchDB")]
        [int] $Limit,
        [Parameter(ParameterSetName = "PSCouchDB")]
        [int] $Skip,
        [Parameter(ParameterSetName = "PSCouchDB")]
        [array] $Fields,
        [Parameter(ParameterSetName = "PSCouchDB")]
        [array] $Sort,
        [Parameter(ParameterSetName = "PSCouchDB")]
        [array] $UseIndex,
        [Parameter(ParameterSetName = "PSCouchDB")]
        [int] $ReadQuorum,
        [Parameter(ParameterSetName = "PSCouchDB")]
        [string] $Bookmark,
        [Parameter(ParameterSetName = "PSCouchDB")]
        [switch] $NoUpdate,
        [Parameter(ParameterSetName = "PSCouchDB")]
        [switch] $Stable,
        [Parameter(ParameterSetName = "PSCouchDB")]
        [ValidateSet('ok')]
        [string] $Stale,
        [Parameter(ParameterSetName = "PSCouchDB")]
        [switch] $ExecutionStats,
        [Parameter(ParameterSetName = "PSCouchDB")]
        [ValidateSet('lt','lte','eq','ne','gte','gt','exists','type','in','nin','size','mod','regex')]
        [string] $Operator,
        [Parameter(ParameterSetName = "Native")]
        [string] $Find,
        [Parameter(ParameterSetName = "PSCouchDB")]
        [Parameter(ParameterSetName = "Native")]
        [string] $Authorization,
        [Parameter(ParameterSetName = "PSCouchDB")]
        [Parameter(ParameterSetName = "Native")]
        [switch] $Ssl
    )

    if ($Explain.IsPresent) {
        $Document = '_explain'
    } else {
        $Document = '_find'
    }
    if ($Find) {
        if (($Find -as [hashtable]) -ne $null) {
            # Json Data
            $Data = $Find | ConvertTo-Json -Depth 99
        } else {
            # Json Data
            $Data = $Find
        }
    } else {
        # Compose JSON data
        $Query = New-Object -TypeName PSCouchDBQuery
        # boolean
        if ($NoUpdate.IsPresent) { $Query.DisableUpdate() }
        if ($Stable.IsPresent) { $Query.SetStable($true) }
        if ($ExecutionStats.IsPresent) { $Query.SetExecutionStat($true) }
        if ($Stale -eq 'ok') { $Query.SetStale() }
        # int
        if ($Limit -gt 0) { $Query.SetLimit($Limit) }
        if ($Skip -gt 0) { $Query.SetSkip($Skip) }
        if ($ReadQuorum -gt 0) { $Query.SetReadQuorum($ReadQuorum) }
        # array
        foreach ($f in $Fields) { $Query.AddFields($f) }
        foreach ($s in $Sort) { $Query.AddSortAsc($s) }
        foreach ($i in $UseIndex) { $Query.AddIndexies($i) }
        # selector
        if ($Selector -and $Value) {
            $Query.AddSelector($Selector, $Value)
        }
        # operator
        switch ($Operator) {
            'lt'        { $Query.AddSelectorOperator('$lt') }
            'lte'       { $Query.AddSelectorOperator('$lte') }
            'eq'        { $Query.AddSelectorOperator('$eq') }
            'ne'        { $Query.AddSelectorOperator('$ne') }
            'gte'       { $Query.AddSelectorOperator('$gte') }
            'gt'        { $Query.AddSelectorOperator('$gt') }
            'exists'    { $Query.AddSelectorOperator('$exists') }
            'type'      { $Query.AddSelectorOperator('$type') }
            'in'        { $Query.AddSelectorOperator('$in') }
            'nin'       { $Query.AddSelectorOperator('$nin') }
            'size'      { $Query.AddSelectorOperator('$size') }
            'mod'       { $Query.AddSelectorOperator('$mod') }
            'regex'     { $Query.AddSelectorOperator('$regex') }
        }
        # Data
        $Data = $Query.GetNativeQuery()
        Write-Verbose -Message "The JSON data is: $Data"
    }
    Send-CouchDBRequest -Server $Server -Port $Port -Method "POST" -Database $Database -Document $Document -Data $Data -Authorization $Authorization -Ssl:$Ssl
}
