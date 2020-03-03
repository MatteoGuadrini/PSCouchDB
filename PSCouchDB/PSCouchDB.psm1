# Alias for all export cmdlets
New-Alias -Name "tcdb" -Value Test-CouchDBDatabase -Option ReadOnly
New-Alias -Name "cpdb" -Value Copy-CouchDBDatabase -Option ReadOnly
New-Alias -Name "gcdb" -Value Get-CouchDBDatabase -Option ReadOnly
New-Alias -Name "gcbpl" -Value Get-CouchDBDatabasePurgedLimit -Option ReadOnly
New-Alias -Name "gcsi" -Value Get-CouchDBServer -Option ReadOnly
New-Alias -Name "gcdbc" -Value Get-CouchDBDatabaseChanges -Option ReadOnly
New-Alias -Name "gcdbu" -Value Get-CouchDBDatabaseUpdates -Option ReadOnly
New-Alias -Name "gcdbsh" -Value Get-CouchDBDatabaseShards -Option ReadOnly
New-Alias -Name "gcdoc" -Value Get-CouchDBDocument -Option ReadOnly
New-Alias -Name "gcbdoc" -Value Get-CouchDBBulkDocument -Option ReadOnly
New-Alias -Name "gcddoc" -Value Get-CouchDBDesignDocument -Option ReadOnly
New-Alias -Name "gcdatt" -Value Get-CouchDBDesignDocumentAttachment -Option ReadOnly
New-Alias -Name "gcatt" -Value Get-CouchDBAttachment -Option ReadOnly
New-Alias -Name "gcusr" -Value Get-CouchDBUser -Option ReadOnly
New-Alias -Name "gcadm" -Value Get-CouchDBAdmin -Option ReadOnly
New-Alias -Name "gcconf" -Value Get-CouchDBConfiguration -Option ReadOnly
New-Alias -Name "gcnode" -Value Get-CouchDBNode -Option ReadOnly
New-Alias -Name "gcdbs" -Value Get-CouchDBDatabaseSecurity -Option ReadOnly
New-Alias -Name "gcrpl" -Value Get-CouchDBReplication -Option ReadOnly
New-Alias -Name "gcrpls" -Value Get-CouchDBReplicationScheduler -Option ReadOnly
New-Alias -Name "gctsk" -Value Get-CouchDBActiveTask -Option ReadOnly
New-Alias -Name "gccs" -Value Get-CouchDBClusterSetup -Option ReadOnly
New-Alias -Name "gcrpdoc" -Value Get-CouchDBReplicationDocument -Option ReadOnly
New-Alias -Name "gcidx" -Value Get-CouchDBIndex -Option ReadOnly
New-Alias -Name "gcddd" -Value Get-CouchDBDatabaseDesignDocument -Option ReadOnly
New-Alias -Name "gcmr" -Value Get-CouchDBMissingRevision -Option ReadOnly
New-Alias -Name "gcrd" -Value Get-CouchDBRevisionDifference -Option ReadOnly
New-Alias -Name "gcrl" -Value Get-CouchDBRevisionLimit -Option ReadOnly
New-Alias -Name "gcss" -Value Get-CouchDBSession -Option ReadOnly
New-Alias -Name "scds" -Value Sync-CouchDBDatabaseShards -Option ReadOnly
New-Alias -Name "cpdoc" -Value Copy-CouchDBDocument -Option ReadOnly
New-Alias -Name "mcsts" -Value Measure-CouchDBStatistics -Option ReadOnly
New-Alias -Name "eccl" -Value Enable-CouchDBCluster -Option ReadOnly
New-Alias -Name "src" -Value Search-CouchDBHelp -Option ReadOnly
New-Alias -Name "helpc" -Value Search-CouchDBHelp -Option ReadOnly
New-Alias -Name "acnode" -Value Add-CouchDBNode -Option ReadOnly
New-Alias -Name "ccdb" -Value Compress-CouchDBDatabase -Option ReadOnly
New-Alias -Name "ccdd" -Value Compress-CouchDBDesignDocument -Option ReadOnly
New-Alias -Name "ccview" -Value Clear-CouchDBView -Option ReadOnly
New-Alias -Name "ccdoc" -Value Clear-CouchDBDocuments -Option ReadOnly
New-Alias -Name "scdbpl" -Value Set-CouchDBDatabasePurgedLimit -Option ReadOnly
New-Alias -Name "scdoc" -Value Set-CouchDBDocument -Option ReadOnly
New-Alias -Name "scddoc" -Value Set-CouchDBDesignDocument -Option ReadOnly
New-Alias -Name "sdatt" -Value Set-CouchDBDesignDocumentAttachment -Option ReadOnly
New-Alias -Name "scatt" -Value Set-CouchDBAttachment -Option ReadOnly
New-Alias -Name "scusr" -Value Set-CouchDBUser -Option ReadOnly
New-Alias -Name "scadm" -Value Set-CouchDBAdmin -Option ReadOnly
New-Alias -Name "scconf" -Value Set-CouchDBConfiguration -Option ReadOnly
New-Alias -Name "scrpl" -Value Set-CouchDBReplication -Option ReadOnly
New-Alias -Name "scbd" -Value Set-CouchDBBulkDocument -Option ReadOnly
New-Alias -Name "scrl" -Value Set-CouchDBRevisionLimit -Option ReadOnly
New-Alias -Name "scs" -Value Set-CouchDBSession -Option ReadOnly
New-Alias -Name "gcdbp" -Value Grant-CouchDBDatabasePermission -Option ReadOnly
New-Alias -Name "rcdbp" -Value Revoke-CouchDBDatabasePermission -Option ReadOnly
New-Alias -Name "rcdbr" -Value Request-CouchDBReplication -Option ReadOnly
New-Alias -Name "ncdb" -Value New-CouchDBDatabase -Option ReadOnly
New-Alias -Name "ncdoc" -Value New-CouchDBDocument -Option ReadOnly
New-Alias -Name "ncddoc" -Value New-CouchDBDesignDocument -Option ReadOnly
New-Alias -Name "ndatt" -Value New-CouchDBDesignDocumentAttachment -Option ReadOnly
New-Alias -Name "ncatt" -Value New-CouchDBAttachment -Option ReadOnly
New-Alias -Name "ncusr" -Value New-CouchDBUser -Option ReadOnly
New-Alias -Name "ncadm" -Value New-CouchDBAdmin -Option ReadOnly
New-Alias -Name "ncrpl" -Value New-CouchDBReplication -Option ReadOnly
New-Alias -Name "ncuuid" -Value New-CouchDBUuids -Option ReadOnly
New-Alias -Name "ncidx" -Value New-CouchDBIndex -Option ReadOnly
New-Alias -Name "rcdb" -Value Remove-CouchDBDatabase -Option ReadOnly
New-Alias -Name "rcdoc" -Value Remove-CouchDBDocument -Option ReadOnly
New-Alias -Name "rcddoc" -Value Remove-CouchDBDesignDocument -Option ReadOnly
New-Alias -Name "rdatt" -Value Remove-CouchDBDesignDocumentAttachment -Option ReadOnly
New-Alias -Name "rcatt" -Value Remove-CouchDBAttachment -Option ReadOnly
New-Alias -Name "rcusr" -Value Remove-CouchDBUser -Option ReadOnly
New-Alias -Name "rcadm" -Value Remove-CouchDBAdmin -Option ReadOnly
New-Alias -Name "rcnode" -Value Remove-CouchDBNode -Option ReadOnly
New-Alias -Name "rcrpl" -Value Remove-CouchDBReplication -Option ReadOnly
New-Alias -Name "rcidx" -Value Remove-CouchDBIndex -Option ReadOnly
New-Alias -Name "rcs" -Value Remove-CouchDBSession -Option ReadOnly
New-Alias -Name "rcsrv" -Value Restart-CouchDBServer -Option ReadOnly
New-Alias -Name "scft" -Value Search-CouchDBFullText -Option ReadOnly
New-Alias -Name "fcdoc" -Value Find-CouchDBDocuments -Option ReadOnly
New-Alias -Name "wcfc" -Value Write-CouchDBFullCommit -Option ReadOnly
New-Alias -Name "ecdb" -Value Export-CouchDBDatabase -Option ReadOnly
New-Alias -Name "icdb" -Value Import-CouchDBDatabase -Option ReadOnly
New-Alias -Name "rdblog" -Value Read-CouchDBLog -Option ReadOnly
New-Alias -Name "cdblog" -Value Clear-CouchDBLog -Option ReadOnly

# Intuitive alias
New-Alias -Name "mkdb" -Value New-CouchDBDatabase -Option ReadOnly
New-Alias -Name "mkdoc" -Value New-CouchDBDocument -Option ReadOnly
New-Alias -Name "mkuser" -Value New-CouchDBUser -Option ReadOnly
New-Alias -Name "mkadmin" -Value New-CouchDBAdmin -Option ReadOnly
New-Alias -Name "rmdb" -Value Remove-CouchDBDatabase -Option ReadOnly
New-Alias -Name "rmdoc" -Value Remove-CouchDBDocument -Option ReadOnly
New-Alias -Name "rmuser" -Value Remove-CouchDBUser -Option ReadOnly
New-Alias -Name "rmadmin" -Value Remove-CouchDBAdmin -Option ReadOnly
New-Alias -Name "finddoc" -Value Find-CouchDBDocuments -Option ReadOnly
New-Alias -Name "importdb" -Value Import-CouchDBDatabase -Option ReadOnly
New-Alias -Name "exportdb" -Value Export-CouchDBDatabase -Option ReadOnly

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
    [hashtable]$selector = @{ }
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
    hidden [ValidateSet('$and', '$or', '$not', '$nor', '$all', '$elemMatch', '$allMatch')]
    [string]$LogicalOperator
    hidden [ValidateSet('$lt', '$lte', '$eq', '$ne', '$gte', '$gt', '$exists', '$type', '$in', '$nin', '$size', '$mod', '$regex')]
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

    # Method for removing one sort properties
    RemoveSort ($sort) {
        $newsort = $this.sort | Where-Object { $_.Keys.Where( { $_ -ne $sort }) }
        $this.sort = $newsort
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

    # Method for removing one field properties to fields array
    RemoveFields ($field) {
        $newfields = $this.fields | Where-Object { $_ -ne $field }
        $this.fields = $newfields
    }

    # Method for remove indexies properties to indexies array
    RemoveIndexies () {
        $this.use_index = @()
    }

    # Method for remove one index properties to indexies array
    RemoveIndexies ($index) {
        $newindex = $this.use_index | Where-Object { $_ -ne $index }
        $this.use_index = $newindex
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
            if (('$and', '$or', '$nor', '$all') -contains $operator ) {
                # Array
                $this.selector.Add($operator, @())
                foreach ($selector in $clone_selector.Keys) {
                    $this.selector."$operator" += @{ $selector = $clone_selector[$selector] }
                }
                $this.Depth = $this.Depth + 2
            } else {
                # Selector
                $this.selector.Add($operator, $clone_selector)
                $this.Depth = $this.Depth + 1
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
            if (('$lt', '$lte', '$eq', '$ne', '$gte', '$gt', '$exists', '$type', '$mod', '$regex') -contains $operator) {
                # JSON
                foreach ($selector in $clone_selector.Keys) {
                    if (('$and', '$or', '$not', '$nor', '$all', '$elemMatch', '$allMatch') -contains $selector) {
                        $this.selector.Add($selector, $clone_selector[$selector])
                        continue
                    }
                    $this.selector.Add($selector, @{ })
                    if ($clone_selector[$selector] -is [int]) {
                        $this.selector.$selector.Add($operator, [int]$clone_selector[$selector])
                    } elseif (($clone_selector[$selector] -eq "true") -or ($clone_selector[$selector] -eq "false")) {
                        $this.selector.$selector.Add($operator, [bool]$clone_selector[$selector])
                    } else {
                        $this.selector.$selector.Add($operator, $clone_selector[$selector])
                    }
                }
            } elseif (('$in', '$nin', '$size') -contains $operator) {
                # Array
                foreach ($selector in $clone_selector.Keys) {
                    if (('$and', '$or', '$not', '$nor', '$all', '$elemMatch', '$allMatch') -contains $selector) {
                        $this.selector.Add($selector, $clone_selector[$selector])
                        continue
                    }
                    $this.selector.Add($selector, @{ })
                    if ($clone_selector[$selector] -is [int]) {
                        $this.selector.$selector.Add($operator, @([int]$clone_selector[$selector]))
                    } elseif (($clone_selector[$selector] -eq "true") -or ($clone_selector[$selector] -eq "false")) {
                        $this.selector.$selector.Add($operator, @([bool]$clone_selector[$selector]))
                    } else {
                        $this.selector.$selector.Add($operator, @($clone_selector[$selector]))
                    }
                }
            }
            $this.Depth = $this.Depth + 3
        } else {
            throw "One or more selector are required!"
        }
    }

    # Method for adding operator to selector and value
    AddSelectorOperator ($operator, $key, $value) {
        if ($this.selector.Count -ne 0) {
            $this.operator = $operator
            if ($this.selector.ContainsKey($key)) {
                if (-not(('$and', '$or', '$not', '$nor', '$all', '$elemMatch', '$allMatch') -contains $key)) {
                    # Check if array, selector or json
                    $this.selector.$key = @{ }
                    if (('$lt', '$lte', '$eq', '$ne', '$gte', '$gt', '$exists', '$type', '$mod', '$regex') -contains $operator) {
                        # JSON
                        if ($value -is [int]) {
                            $this.selector.$key.Add($operator, [int]$value)
                        } elseif (($value -eq "true") -or ($value -eq "false")) {
                            $this.selector.$key.Add($operator, [bool]$value)
                        } else {
                            $this.selector.$key.Add($operator, $value)
                        }
                    } elseif (('$in', '$nin', '$size') -contains $operator) {
                        # Array
                        if ($value -is [int]) {
                            $this.selector.$key.Add($operator, @([int]$value))
                        } elseif (($value -eq "true") -or ($value -eq "false")) {
                            $this.selector.$key.Add($operator, @([bool]$value))
                        } else {
                            $this.selector.$key.Add($operator, @($value))
                        }
                    }
                }
                $this.Depth = $this.Depth + 3
            } else {
                throw "selector $key not exists!"
            }
        } else {
            throw "One or more selector are required!"
        }
    }

    # Method for get a native query in json format
    [string] GetNativeQuery () {
        [hashtable]$query = @{ }
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
        return $query | ConvertTo-Json -Depth ($this.Depth + 1)
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
            $this.views.Add("$name", @{ })
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
            $this.views.Add("$name", @{ })
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
            $this.views.Add("$name", @{ })
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
            $this.views.Add("$name", @{ })
            $this.views.$name.Add("map", $map)
            $this.Depth++
        } else {
            throw "The view function $name already exists!"
        }
    }

    # Method for adding new show; ALL DOCS
    # GET /_design/{design-doc-id}/_show/{show-function-name}/{document-id}
    AddShow ($name) {
        Write-Warning -Message "This features are deprecated in CouchDB 3.0 and will be removed in CouchDB 4.0"
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
        Write-Warning -Message "This features are deprecated in CouchDB 3.0 and will be removed in CouchDB 4.0"
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
        Write-Warning -Message "This features are deprecated in CouchDB 3.0 and will be removed in CouchDB 4.0"
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
        Write-Warning -Message "This features are deprecated in CouchDB 3.0 and will be removed in CouchDB 4.0"
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

    # Method for adding new validation update function; AUTHOR IS ADMIN! ReadOnly docs.
    AddValidation ([bool]$ReadOnly) {
        if ($ReadOnly) {
            if (-not($this.validate_doc_update)) {
                $map = @"
function(newDoc, oldDoc, userCtx) { 
    if (userCtx.roles.indexOf('_admin') !== -1) { return; } 
    else { throw ({ forbidden: 'Only admins may edit the database' }); } 
}
"@
                $this.validate_doc_update = $map
                $this.Depth++
            } else {
                throw "There can be only one validation function in a design document."
            }
        }
    }

    # Method for get native json design documents format
    [string] GetDesignDocuments () {
        [hashtable]$json = @{ }
        if ($this.views.PSBase.Count -ne 0) { $json.Add('views', $this.views) }
        if ($this.shows.PSBase.Count -ne 0) { $json.Add('shows', $this.shows) }
        if ($this.lists.PSBase.Count -ne 0) { $json.Add('lists', $this.lists) }
        if ($this.validate_doc_update) { $json.Add('validate_doc_update', $this.validate_doc_update) }
        $json.Add('language', $this.language)
        return $json | ConvertTo-Json -Depth ($this.Depth + 1)
    }
}


# Functions of CouchDB module
function Send-CouchDBRequest {
    <#
    .SYNOPSIS
    Send a request through rest method to CouchDB server.
    .DESCRIPTION
    This command builds the url and data and uses Invoke 
    to pass the CouchDB API call.
    .PARAMETER Method
    The REST method. Default is "GET".
    The avalaible methods are:
    "HEAD","GET","PUT","DELETE","POST"
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    This takes part in the url here: 
    http://{server}.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    This takes part in the url here: 
    http://localhost:{port}.
    .PARAMETER Database
    The CouchDB database. This takes part in the url here: 
    http://localhost:5984/{database}.
    .PARAMETER Document
    The CouchDB document. This takes part in the url here: 
    http://localhost:5984/db/{document}.
    .PARAMETER Authorization
    The CouchDB authorization form; user and password.
    Authorization format like this: user:password
    ATTENTION: if the password is not specified, it will be prompted.
    When the authorization parameter is first specified, a 
    session variable is created ($couchdb_session) that lasts the entire 
    powershell session. The next calls can be made without
    specifying the authorization parameter, 
    if you do not have to change users.
    This takes part in the url here: 
    http://{authorization}@localhost:5984.
    .PARAMETER Revision
    The CouchDB revision document.
    The revision document format like this: {count}-{uuid}
    2-b91bb807b4685080c6a651115ff558f5
    This takes part in the url here: 
    http://localhost:5984/db/doc?rev={revision}.
    .PARAMETER Attachment
    The CouchDB document attachment. Is a ContentType -> multipart/form-data
    and InFile -> path of attachment.
    .PARAMETER Data
    The CouchDB document data. Is a Json data format.
    The encoding is UTF-8.
    .PARAMETER OutFile
    Path of download attachment file.
    .PARAMETER Ssl
    Set ssl connection on CouchDB server.
    This modify protocol to https and port to 6984.
    https://localhost:6984.
    .EXAMPLE
    This example get a database "db":
    Send-CouchDBRequest -Server couchdb1.local -Method "GET" -Database db
    .EXAMPLE
    This example get a document "doc1" on database "db":
    Send-CouchDBRequest -Server couchdb1.local -Method "GET" -Database db -Document doc1
    .EXAMPLE
    This example get a document "doc1" on database "db" on "localhost" server in SSL connection:
    Send-CouchDBRequest -Method "GET" -Database db -Document doc1 -Ssl:$true
    .LINK
    Invoke-RestMethod
    #>
    [CmdletBinding()]
    param (
        [ValidateSet("HEAD", "GET", "PUT", "DELETE", "POST")] [string] $Method,
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
    $options = @{ }
    # Analize method for web request
    Write-Verbose -Message "Check http method, default is GET"
    Write-Debug -Message "`$Method is $Method"
    switch ($Method) {
        "HEAD" { $options.Add("Method", "HEAD") }
        "GET" { $options.Add("Method", "GET") }
        "PUT" { $options.Add("Method", "PUT") }
        "DELETE" { $options.Add("Method", "DELETE") }
        "POST" { $options.Add("Method", "POST") }
        Default { $options.Add("Method", "GET") }
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
            $options.Add("ContentType", "multipart/form-data")
            $options.Add("InFile", $Attachment)
            Write-Debug -Message "Tested attachment path $Attachment"
        } else {
            $AttachmentName = $Attachment
            Write-Debug -Message "Tested name of attachment $AttachmentName"
            if ($OutFile) {
                $options.Add("OutFile", $OutFile)
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
    $options.Add("Uri", $url)
    # Check session
    if (-not($couchdb_session) -or ($Authorization)) {
        # Check the credential for access on database
        $cred = $Authorization -split ":"
        if (-not($cred[1]) -and ($cred[0])) { 
            $password = ConvertTo-CouchDBPassword -SecurePassword (Read-Host "Enter password for $($cred[0])" -AsSecureString)
            $Authorization = "$($cred[0]):${password}".Replace(" ", "")
            Remove-Variable -Name password
        }
        Write-Verbose -Message "Check authorization"
        $base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(($Authorization)))
        $options.Add("Headers", @{Authorization = ("Basic {0}" -f $base64AuthInfo) })
        Write-Debug -Message "`$Authorization is $Authorization"
        $options.Add("SessionVariable", "couchdb_session")
    } else {
        $options.Add("WebSession", $couchdb_session)
    }
    # Build the json data
    Write-Verbose -Message "Check json data"
    if (($Data) -and ($Database)) {
        $options.Add("ContentType", "application/json")
        $options.Add("Body", ([System.Text.Encoding]::UTF8.GetBytes($Data)))
        Write-Debug -Message "`$Data is $Data"
        Write-Verbose -Message "`$Data is $Data"
    }
    # Check return header or not
    if ($Method -eq "HEAD") {
        # Invoke WEB request
        Write-Verbose -Message "Finally, send request to CouchDB server $Server"
        $results = Invoke-WebRequest @options
        Set-Variable -Name couchdb_session -Value $couchdb_session -Scope Global
    } else {
        # Invoke REST method
        Write-Verbose -Message "Finally, send request to CouchDB server $Server"
        $results = Invoke-RestMethod @options
        Set-Variable -Name couchdb_session -Value $couchdb_session -Scope Global
        
    }
    return $results
}

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
    $BSTR = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($SecurePassword)
    $UnsecurePassword = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)
    return $UnsecurePassword
}

function Get-CouchDBServer () {
    <#
    .SYNOPSIS
    Get server information.
    .DESCRIPTION
    Accessing the root of a CouchDB instance returns meta information about the instance.
    .NOTES
    CouchDB API:
        GET /
        GET /_up
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER Authorization
    The CouchDB authorization form; user and password.
    Authorization format like this: user:password
    ATTENTION: if the password is not specified, it will be prompted.
    .PARAMETER Status
    Get the status of server. API _up. 
    .PARAMETER Ssl
    Set ssl connection on CouchDB server.
    This modify protocol to https and port to 6984.
    .EXAMPLE
    Get-CouchDBServer
    This example get a meta information of localhost server.
    .EXAMPLE
    Get-CouchDBServer -Serer couchdb1.local -Port 8080 -Status
    This example get a status of couchdb1.local server with custom port.
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/server.html#server-operation
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [string] $Authorization,
        [switch] $Status,
        [switch] $Ssl
    )
    if ($Status.IsPresent) {
        $Database = "_up"
    }
    Send-CouchDBRequest -Server $Server -Port $Port -Method "GET" -Database $Database -Authorization $Authorization -Ssl:$Ssl
}

function Test-CouchDBDatabase () {
    <#
    .SYNOPSIS
    Test database.
    .DESCRIPTION
    Test if database exists.
    .NOTES
    CouchDB API:
        HEAD /{db}
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
    Test-CouchDBDatabase -Database test
    This example test if database "test" exists.
    .EXAMPLE
    if ($null -eq (Test-CouchDBDatabase -Database test -ErrorAction SilentlyContinue)) {
        Write-Output "Database test exists!"
    } else {
        Write-Output "Create it!"
    }
    This example test if database "test" exists and write to output the condition.
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/databases.html#test-a-database
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
    Send-CouchDBRequest -Server $Server -Port $Port -Method "HEAD" -Database $Database -Authorization $Authorization -Ssl:$Ssl
}

function Copy-CouchDBDatabase () {
    <#
    .SYNOPSIS
    Copy database.
    .DESCRIPTION
    Create a new database by copying it from an existing one.
    .NOTES
    CouchDB API:
        HEAD /{db}
        PUT /{db}
        GET /{db}/_all_docs
        PUT /{db}/{doc}
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER RemoteServer
    The CouchDB remote server name.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER RemotePort
    The CouchDB server port. Default is 5984.
    .PARAMETER Database
    The source CouchDB database.
    .PARAMETER Destination
    The destination CouchDB database. A new name must be specified.
    .PARAMETER ExcludeIds
    Array of Docids to exclude to copy. 
    .PARAMETER Authorization
    The CouchDB authorization form; user and password.
    Authorization format like this: user:password
    ATTENTION: if the password is not specified, it will be prompted.
    .PARAMETER RemoteAuthorization
    The CouchDB authorization form for remote server; user and password.
    Authorization format like this: user:password
    ATTENTION: if the password is not specified, it will be prompted.
    .PARAMETER Ssl
    Set ssl connection on CouchDB server.
    This modify protocol to https and port to 6984.
    .EXAMPLE
    Copy-CouchDBDatabase -Database test -Destination test_new -Authorization admin:password
    Copy a test database in a new test_new database.
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/databases.html#copy-a-database
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [string] $RemoteServer,
        [int] $Port,
        [int] $RemotePort,
        [Parameter(mandatory = $true, ValueFromPipeline = $true)]
        [string] $Database,
        [string] $Destination = $(if ($RemoteServer) {$Database} else {$Database + "_new"}),
        [array] $ExcludeIds,
        [string] $Authorization,
        [string] $RemoteAuthorization,
        [switch] $Ssl
    )
    $count = 0
    $all_docs = Get-CouchDBDocument -Server $Server -Port $Port -Database $Database -Authorization $Authorization -Ssl:$Ssl
    # Check RemoteServer is defined
    if ($RemoteServer) {
        $DestinationServer = $RemoteServer
    } else {
        $DestinationServer = $Server
    }
    # Check RemotePort is defined
    if ($RemotePort) {
        $DestinationPort = $RemotePort
    } else {
        $DestinationPort = $Port
    }
    # Check RemoteAuthorization is defined
    if ($RemoteAuthorization) {
        $DestinationAuthorization = $RemoteAuthorization
    } else {
        $DestinationAuthorization = $Authorization
    }
    if (-not(Test-CouchDBDatabase -Server $DestinationServer -Port $DestinationPort -Database $Destination -Authorization $DestinationAuthorization -Ssl:$Ssl -ErrorAction SilentlyContinue)) {
        New-CouchDBDatabase -Server $DestinationServer -Port $DestinationPort -Database $Destination -Authorization $DestinationAuthorization -Ssl:$Ssl | Out-Null
    } else {
        throw "Database $Destination exists! Choose another name."
    }
    foreach ($doc in $all_docs.rows) {
        if ($ExcludeIds -notcontains $doc.id) {
            $count++
            $Data = Get-CouchDBDocument -Server $Server -Port $Port -Database $Database -Document $doc.id -Authorization $Authorization -Ssl:$Ssl | ConvertTo-Json -Depth 99 
            New-CouchDBDocument -Server $DestinationServer -Port $DestinationPort -Database $Destination -Document $doc.id -Data $($Data -replace '"_rev":.*,', "") -Authorization $DestinationAuthorization -Ssl:$Ssl
            Write-Progress -Activity "Copy document $($doc.id) in a new database $Destination in progress" -Status "Progress $count/$($all_docs.total_rows)" -PercentComplete ($count / $all_docs.total_rows * 100)
        } else {
            Write-Host "Skip $($doc.id) because exists in exclude list."
        }   
    }
}

function Get-CouchDBDatabase () {
    <#
    .SYNOPSIS
    Get a database information.
    .DESCRIPTION
    Gets information about the specified database.
    Without database argument, return a list of all databases.
    .NOTES
    CouchDB API:
        GET /{db}
        GET /_all_dbs
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER Database
    The CouchDB database. Default is _all_dbs.
    .PARAMETER Descending
    Return the databases in descending order by key. Default is false. The database must be _all_dbs.
    .PARAMETER EndKey
    Stop returning databases when the specified key is reached. The database must be _all_dbs.
    .PARAMETER Limit
    Limit the number of the returned databases to the specified number. The database must be _all_dbs.
    .PARAMETER Skip
    Skip this number of databases before starting to return the results. Default is 0. The database must be _all_dbs.
    .PARAMETER StartKey
    Return databases starting with the specified key. The database must be _all_dbs.
    .PARAMETER Authorization
    The CouchDB authorization form; user and password.
    Authorization format like this: user:password
    ATTENTION: if the password is not specified, it will be prompted.
    .PARAMETER Ssl
    Set ssl connection on CouchDB server.
    This modify protocol to https and port to 6984.
    .EXAMPLE
    Get-CouchDBDatabase -Database test
    This example get info of the database "test".
    .EXAMPLE
    Get-CouchDBDatabase
    This example get info of all databases.
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/databases.html#read-a-database
    #>
    [CmdletBinding()]
    param(
        [Parameter(ValueFromPipeline = $true)]
        [string] $Server,
        [int] $Port,
        [string] $Database = "_all_dbs",
        [ValidateScript( { if (-not($Database) -or ($Database -eq "_all_dbs")) { $true } })]
        [switch] $Descending,
        [ValidateScript( { if (-not($Database) -or ($Database -eq "_all_dbs")) { $true } })]
        [Alias('End')]
        [string] $EndKey,
        [ValidateScript( { if (-not($Database) -or ($Database -eq "_all_dbs")) { $true } })]
        [int] $Limit,
        [ValidateScript( { if (-not($Database) -or ($Database -eq "_all_dbs")) { $true } })]
        [int] $Skip,
        [ValidateScript( { if (-not($Database) -or ($Database -eq "_all_dbs")) { $true } })]
        [Alias('Start')]
        [string] $StartKey,
        [string] $Authorization,
        [switch] $Ssl
    )
    # Check Descending param
    if ($Descending.IsPresent) {
        if ($Database -match "\?") {
            $Database += "&descending=true"
        } else {
            $Database += "?descending=true"
        }
    }
    # Check EndKey param
    if ($EndKey) {
        if ($Database -match "\?") {
            $Database += "&endkey=`"$EndKey`""
        } else {
            $Database += "?endkey=`"$EndKey`""
        }
    }
    # Check Limit param
    if ($Limit) {
        if ($Database -match "\?") {
            $Database += "&limit=$Limit"
        } else {
            $Database += "?limit=$Limit"
        }
    }
    # Check Skip param
    if ($Skip) {
        if ($Database -match "\?") {
            $Database += "&skip=$Skip"
        } else {
            $Database += "?skip=$Skip"
        }
    }
    # Check StartKey param
    if ($StartKey) {
        if ($Database -match "\?") {
            $Database += "&startkey=`"$StartKey`""
        } else {
            $Database += "?startkey=`"$StartKey`""
        }
    }
    Send-CouchDBRequest -Server $Server -Port $Port -Method "GET" -Database $Database -Authorization $Authorization -Ssl:$Ssl
}

function Get-CouchDBDatabasePurgedLimit () {
    <#
    .SYNOPSIS
    Get a database purged documents limit.
    .DESCRIPTION
    Gets the current purged_infos_limit (purged documents limit).
    .NOTES
    CouchDB API:
        GET /_purged_infos_limit
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
    Get-CouchDBDatabasePurgedLimit -Database test
    This example get info of the database purged documents limit "test".
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/databases.html#get-purged-info-limit
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
    $Database = $Database + "/_purged_infos_limit"
    Send-CouchDBRequest -Server $Server -Port $Port -Method "GET" -Database $Database -Authorization $Authorization -Ssl:$Ssl
}

function Get-CouchDBDatabaseInfo () {
    <#
    .SYNOPSIS
    Get a databases information.
    .DESCRIPTION
    Returns information of a list of the specified databases in the CouchDB instance.
    .NOTES
    CouchDB API:
        GET /_purged_infos_limit
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER Keys
    Array of database names to be requested.
    .PARAMETER Authorization
    The CouchDB authorization form; user and password.
    Authorization format like this: user:password
    ATTENTION: if the password is not specified, it will be prompted.
    .PARAMETER Ssl
    Set ssl connection on CouchDB server.
    This modify protocol to https and port to 6984.
    .EXAMPLE
    Get-CouchDBDatabaseInfo -Keys test
    This example get info of the database purged documents limit "test".
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/databases.html#get-purged-info-limit
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory = $true, ValueFromPipeline = $true)]
        [array] $Keys,
        [string] $Authorization,
        [switch] $Ssl
    )
    $Database = '_dbs_info'
    $Data = @{ keys = @() }
    if ($Keys) { $Data.keys += $Keys }
    $Data = $Data | ConvertTo-Json -Depth 3
    Send-CouchDBRequest -Server $Server -Port $Port -Method "POST" -Database $Database -Data $Data -Authorization $Authorization -Ssl:$Ssl
}

function Get-CouchDBDatabaseChanges () {
    <#
    .SYNOPSIS
    Get database changelogs.
    .DESCRIPTION
    Returns a sorted list of changes made to documents in the database, 
    in time order of application, can be obtained from the database’s _changes resource.
    .NOTES
    CouchDB API:
        GET /_changes
        POST /_changes/
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER Database
    The CouchDB database.
    .PARAMETER Filter
    Reference to a filter function from a design document that will filter whole stream emitting only filtered events.
    .PARAMETER Continuous
    Sends a line of JSON per event. Keeps the socket open until timeout.
    .PARAMETER Authorization
    The CouchDB authorization form; user and password.
    Authorization format like this: user:password
    ATTENTION: if the password is not specified, it will be prompted.
    .PARAMETER Ssl
    Set ssl connection on CouchDB server.
    This modify protocol to https and port to 6984.
    .EXAMPLE
    Get-CouchDBDatabaseChanges -Database test
    This example get list of changes made to documents in the database "test".
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/databases.html#changes
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory = $true, ValueFromPipeline = $true)]
        [string] $Database,
        [array] $Filter,
        [switch] $Continuous ,
        [string] $Authorization,
        [switch] $Ssl
    )
    if (-not(Test-CouchDBDatabase -Server $Server -Port $Port -Database $Database -Authorization $Authorization -Ssl:$Ssl -ErrorAction SilentlyContinue)) {
        throw "Database $Database is not exists."
    }
    $Document = '_changes'
    if ($Filter) {
        $Document += '?filter=_doc_ids'
        $Data = "{ `"doc_ids`": $($Filter | ConvertTo-Json -Compress) }"
        Send-CouchDBRequest -Server $Server -Port $Port -Method "POST" -Database $Database -Document $Document -Data $Data -Authorization $Authorization -Ssl:$Ssl
    } elseif ($Continuous.IsPresent) { 
        $Document += '?feed=continuous'
        $Data = "{}"
        Send-CouchDBRequest -Server $Server -Port $Port -Method "POST" -Database $Database -Document $Document -Data $Data -Authorization $Authorization -Ssl:$Ssl
    } else {
        Send-CouchDBRequest -Server $Server -Port $Port -Method "GET" -Database $Database -Document $Document -Authorization $Authorization -Ssl:$Ssl
    }
}

function Get-CouchDBDatabaseUpdates () {
    <#
    .SYNOPSIS
    Get database events.
    .DESCRIPTION
    Returns a list of all database events in the CouchDB instance.
    .NOTES
    CouchDB API:
        GET /_db_updates
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER Feed
    normal: Returns all historical DB changes, then closes the connection. Default.
    longpoll: Closes the connection after the first event.
    continuous: Send a line of JSON per event. Keeps the socket open until timeout.
    eventsource: Like, continuous, but sends the events in EventSource format.
    .PARAMETER Timeout
    Number of seconds until CouchDB closes the connection. Default is 60.
    .PARAMETER Heartbeat
    Period in milliseconds after which an empty line is sent in the results. 
    Only applicable for longpoll, continuous, and eventsource feeds. 
    Overrides any timeout to keep the feed alive indefinitely. Default is 60000.
    .PARAMETER Since
    Return only updates since the specified sequence ID. May be the string "now" to begin showing only new updates.
    .PARAMETER Authorization
    The CouchDB authorization form; user and password.
    Authorization format like this: user:password
    ATTENTION: if the password is not specified, it will be prompted.
    .PARAMETER Ssl
    Set ssl connection on CouchDB server.
    This modify protocol to https and port to 6984.
    .EXAMPLE
    Get-CouchDBDatabaseUpdates -Authorization admin:password
    This example get list of all database events in the CouchDB instance.
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/server.html#server-operation
    #>
    [CmdletBinding()]
    param(
        [Parameter(ValueFromPipeline = $true)]
        [string] $Server,
        [int] $Port,
        [ValidateSet("normal", "longpoll", "continuous", "eventsource")]
        [string] $Feed,
        [int] $Timeout,
        [int] $Heartbeat,
        [string] $Since,
        [string] $Authorization,
        [switch] $Ssl
    )
    $Database = '_db_updates'
    # Check Feed parameter
    if ($Feed) {
        if ($Database -match "\?") {
            $Database += "&feed=$Feed"
        } else {
            $Database += "?feed=$Feed"
        }
    }
    # Check Timeout parameter
    if ($Timeout) {
        if ($Database -match "\?") {
            $Database += "&timeout=$Timeout"
        } else {
            $Database += "?timeout=$Timeout"
        }
    }
    # Check Heartbeat parameter
    if ($Heartbeat) {
        if ($Database -match "\?") {
            $Database += "&heartbeat=$Heartbeat"
        } else {
            $Database += "?heartbeat=$Heartbeat"
        }
    }
    # Check Since parameter
    if ($Since) {
        if ($Database -match "\?") {
            $Database += if ($Since -eq "now") { "&since=now" } else { "&since=$Since" }
        } else {
            $Database += if ($Since -eq "now") { "?since=now" } else { "?since=$Since" }
        }
    }
    Send-CouchDBRequest -Server $Server -Port $Port -Method "GET" -Database $Database -Authorization $Authorization -Ssl:$Ssl
}

function Get-CouchDBDatabaseShards () {
    <#
    .SYNOPSIS
    Get shards database list.
    .DESCRIPTION
    Returns a list of shard will have its internal database range, and the nodes on which replicas of those shards are stored.
    .NOTES
    CouchDB API:
        GET /{db}/_shards
        GET /{db}/_shards/{docid}
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER Database
    The CouchDB database.
    .PARAMETER Document
    The CouchDB document.
    .PARAMETER Authorization
    The CouchDB authorization form; user and password.
    Authorization format like this: user:password
    ATTENTION: if the password is not specified, it will be prompted.
    .PARAMETER Ssl
    Set ssl connection on CouchDB server.
    This modify protocol to https and port to 6984.
    .EXAMPLE
    Get-CouchDBDatabaseShards -Database test
    This example get list of shard will have its internal database range "test".
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/databases.html#get-shards
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory = $true, ValueFromPipeline = $true)]
        [string] $Database,
        [string] $Document,
        [string] $Authorization,
        [switch] $Ssl
    )
    $Database = $Database + '/_shards'
    Send-CouchDBRequest -Server $Server -Port $Port -Method "GET" -Database $Database -Document $Document -Authorization $Authorization -Ssl:$Ssl
}

function Get-CouchDBDocument () {
    <#
    .SYNOPSIS
    Get a document.
    .DESCRIPTION
    Get a CouchDB document json data.
    Executes the built-in _all_docs view, returning all of the documents in the database.
    .NOTES
    CouchDB API:
        GET /{db}/_local_docs
        GET /{db}/_all_docs
        GET /{db}/{docid}
        HEAD /{db}/_local_docs
        HEAD /{db}/_all_docs
        HEAD /{db}/{docid}
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER Database
    The CouchDB database.
    .PARAMETER Document
    The CouchDB document. Default is _all_docs.
    .PARAMETER Revision
    The CouchDB revision document.
    .PARAMETER Local
    Return CouchDB local document.
    .PARAMETER Info
    Return CouchDB header info of document.
    .PARAMETER Revisions
    Return all CouchDB db revisions.
    .PARAMETER History
    Return all info CouchDB db revisions.
    .PARAMETER Attachments
    Includes attachments bodies in response.
    .PARAMETER AttachmentsInfo
    Includes encoding information in attachment stubs if the particular attachment is compressed.
    .PARAMETER AttachmentsSince
    Includes attachments only since specified revisions. Doesn’t includes attachments for specified revisions.
    .PARAMETER Conflicts
    Includes information about conflicts in document.
    .PARAMETER DeletedConflicts
    Includes information about deleted conflicted revisions.
    .PARAMETER Latest
    Forces retrieving latest “leaf” revision, no matter what rev was requested.
    .PARAMETER LocalSequence
    Includes last update sequence for the document.
    .PARAMETER Metadata
    Acts same as specifying all conflicts, deleted_conflicts and revs_info query parameters.
    .PARAMETER OpenRevisions
    Retrieves documents of specified leaf revisions. Additionally, value all id default and  to return all leaf revisions.
    .PARAMETER Descending
    Return the design documents in descending by key order. Default is false. The document must be _all_docs.
    .PARAMETER EndKey
    Stop returning records when the specified key is reached. The document must be _all_docs.
    .PARAMETER EndKeyDocument
    Stop returning records when the specified document ID is reached. Ignored if endkey is not set. The document must be _all_docs.
    .PARAMETER Group 
    Group the results using the reduce function to a group or single row. Implies reduce is true and the maximum group_level. Default is false. The document must be _all_docs.
    .PARAMETER GroupLevel
    Specify the group level to be used. Implies group is true. The document must be _all_docs.
    .PARAMETER IncludeDocuments
    Include the associated document with each row. Default is false. The document must be _all_docs.
    .PARAMETER InclusiveEnd
    Specifies whether the specified end key should be included in the result. Default is true. The document must be _all_docs.
    .PARAMETER Key
    Return only documents that match the specified key. The document must be _all_docs.
    .PARAMETER Keys
    Return only documents where the key matches one of the keys specified in the array. The document must be _all_docs.
    .PARAMETER Limit
    Limit the number of the returned design documents to the specified number. The document must be _all_docs.
    .PARAMETER Reduce
    Use the reduction function. Default is true when a reduce function is defined. The document must be _all_docs.
    .PARAMETER Skip
    Skip this number of records before starting to return the results. Default is 0. The document must be _all_docs.
    .PARAMETER Sorted
    Sort returned rows. Setting this to false offers a performance boost. 
    The total_rows and offset fields are not available when this is set to false. Default is true. The document must be _all_docs.
    .PARAMETER Stable
    Whether or not the view results should be returned from a stable set of shards. Default is false. The document must be _all_docs.
    .PARAMETER Stale
    Allow the results from a stale view to be used. Supported values: ok, update_after and false. ok is equivalent to stable=true&update=false. 
    update_after is equivalent to stable=true&update=lazy. false is equivalent to stable=false&update=true. The document must be _all_docs.
    .PARAMETER StartKey
    Return records starting with the specified key. The document must be _all_docs.
    .PARAMETER StartKeyDocument
    Return records starting with the specified document ID. Ignored if startkey is not set. The document must be _all_docs.
    .PARAMETER Update
    Whether or not the view in question should be updated prior to responding to the user. Supported values: true, false, lazy. Default is true. The document must be _all_docs.
    .PARAMETER UpdateSequence
    Whether to include in the response an update_seq value indicating the sequence id of the database the view reflects. Default is false. The document must be _all_docs.
    .PARAMETER Authorization
    The CouchDB authorization form; user and password.
    Authorization format like this: user:password
    ATTENTION: if the password is not specified, it will be prompted.
    .PARAMETER Ssl
    Set ssl connection on CouchDB server.
    This modify protocol to https and port to 6984.
    .EXAMPLE
    Get-CouchDBDocument -Database test -Document "Hitchhikers"
    This example get document "Hitchhikers" on database "test".
    .EXAMPLE
    Get-CouchDBDocument -Database test
    This example get all documents on database "test".
    .EXAMPLE
    Get-CouchDBDocument -Database test -Revisions
    This example get all revision on database "test".
    .EXAMPLE
    if (Get-CouchDBDocument -Database test -Document "Hitchhikers" -Info) { echo doc exists! }
    Test if document "Hitchhikers" on database "test" exists.
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/documents.html#get-a-document
    #>
    [CmdletBinding(DefaultParameterSetName = "Document")]
    param(
        [Parameter(ParameterSetName = "Document")]
        [Parameter(ParameterSetName = "Info")]
        [string] $Server,
        [Parameter(ParameterSetName = "Document")]
        [Parameter(ParameterSetName = "Info")]
        [int] $Port,
        [Parameter(ParameterSetName = "Document")]
        [Parameter(ParameterSetName = "Info")]
        [Parameter(mandatory = $true, ValueFromPipeline = $true)]
        [string] $Database,
        [Parameter(ParameterSetName = "Document")]
        [Parameter(ParameterSetName = "Info")]
        [string] $Document = "_all_docs",
        [Parameter(ParameterSetName = "Document")]
        [Parameter(ParameterSetName = "Info")]
        [string] $Revision,
        [Parameter(ParameterSetName = "Info")]
        [switch] $Info,
        [Parameter(ParameterSetName = "Document")]
        [Parameter(ParameterSetName = "Info")]
        [switch] $Local,
        [Parameter(ParameterSetName = "Document")]
        [ValidateScript( { if ($Document -eq "_all_docs") { $false } })]
        [switch] $Revisions,
        [Parameter(ParameterSetName = "Document")]
        [ValidateScript( { if ($Document -eq "_all_docs") { $false } })]
        [switch] $History,
        [Parameter(ParameterSetName = "Document")]
        [ValidateScript( { if ($Document -eq "_all_docs") { $false } })]
        [switch] $Attachments,
        [Parameter(ParameterSetName = "Document")]
        [ValidateScript( { if ($Document -eq "_all_docs") { $false } })]
        [switch] $AttachmentsInfo,
        [Parameter(ParameterSetName = "Document")]
        [ValidateCount(2, 10)]
        [ValidateScript( { if ($Document -eq "_all_docs") { $false } })]
        [array] $AttachmentsSince,
        [Parameter(ParameterSetName = "Document")]
        [switch] $Conflicts,
        [Parameter(ParameterSetName = "Document")]
        [ValidateScript( { if ($Document -eq "_all_docs") { $false } })]
        [switch] $DeletedConflicts,
        [Parameter(ParameterSetName = "Document")]
        [ValidateScript( { if ($Document -eq "_all_docs") { $false } })]
        [switch] $Latest,
        [Parameter(ParameterSetName = "Document")]
        [ValidateScript( { if ($Document -eq "_all_docs") { $false } })]
        [switch] $LocalSequence,
        [Parameter(ParameterSetName = "Document")]
        [ValidateScript( { if ($Document -eq "_all_docs") { $false } })]
        [switch] $Metadata,
        [Parameter(ParameterSetName = "Document")]
        [ValidateScript( { if ($Document -eq "_all_docs") { $false } })]
        [array] $OpenRevisions,
        [Parameter(ParameterSetName = "Document")]
        [ValidateScript( { if (-not($Document) -or ($Document -eq '_all_docs')) { $true } })]
        [switch] $Descending,
        [Parameter(ParameterSetName = "Document")]
        [ValidateScript( { if (-not($Document) -or ($Document -eq '_all_docs')) { $true } })]
        [Alias('End')]
        [string] $EndKey,
        [Parameter(ParameterSetName = "Document")]
        [ValidateScript( { if (-not($Document) -or ($Document -eq '_all_docs')) { $true } })]
        [Alias('EndDoc')]
        [string] $EndKeyDocument,
        [Parameter(ParameterSetName = "Document")]
        [ValidateScript( { if (-not($Document) -or ($Document -eq '_all_docs')) { $true } })]
        [switch] $Group,
        [Parameter(ParameterSetName = "Document")]
        [ValidateScript( { if (-not($Document) -or ($Document -eq '_all_docs')) { $true } })]
        [int] $GroupLevel,
        [Parameter(ParameterSetName = "Document")]
        [ValidateScript( { if (-not($Document) -or ($Document -eq '_all_docs')) { $true } })]
        [Alias('IncDoc')]
        [switch] $IncludeDocuments,
        [Parameter(ParameterSetName = "Document")]
        [ValidateScript( { if (-not($Document) -or ($Document -eq '_all_docs')) { $true } })]
        [Alias('IncEnd')]
        [bool] $InclusiveEnd = $true,
        [Parameter(ParameterSetName = "Document")]
        [ValidateScript( { if (-not($Document) -or ($Document -eq '_all_docs')) { $true } })]
        $Key,
        [Parameter(ParameterSetName = "Document")]
        [ValidateScript( { if (-not($Document) -or ($Document -eq '_all_docs')) { $true } })]
        [array] $Keys,
        [Parameter(ParameterSetName = "Document")]
        [ValidateScript( { if (-not($Document) -or ($Document -eq '_all_docs')) { $true } })]
        [int] $Limit,
        [Parameter(ParameterSetName = "Document")]
        [ValidateScript( { if (-not($Document) -or ($Document -eq '_all_docs')) { $true } })]
        [bool] $Reduce = $true,
        [Parameter(ParameterSetName = "Document")]
        [ValidateScript( { if (-not($Document) -or ($Document -eq '_all_docs')) { $true } })]
        [int] $Skip,
        [Parameter(ParameterSetName = "Document")]
        [ValidateScript( { if (-not($Document) -or ($Document -eq '_all_docs')) { $true } })]
        [bool] $Sorted = $true,
        [Parameter(ParameterSetName = "Document")]
        [ValidateScript( { if (-not($Document) -or ($Document -eq '_all_docs')) { $true } })]
        [switch] $Stable,
        [Parameter(ParameterSetName = "Document")]
        [ValidateSet("ok", "update_after", "false")]
        [ValidateScript( { if (-not($Document) -or ($Document -eq '_all_docs')) { $true } })]
        [string] $Stale,
        [Parameter(ParameterSetName = "Document")]
        [ValidateScript( { if (-not($Document) -or ($Document -eq '_all_docs')) { $true } })]
        [Alias('Start')]
        [string] $StartKey,
        [Parameter(ParameterSetName = "Document")]
        [ValidateScript( { if (-not($Document) -or ($Document -eq '_all_docs')) { $true } })]
        [Alias('StartDoc')]
        [string] $StartKeyDocument,
        [Parameter(ParameterSetName = "Document")]
        [ValidateSet("true", "false", "lazy")]
        [ValidateScript( { if (-not($Document) -or ($Document -eq '_all_docs')) { $true } })]
        [string] $Update,
        [Parameter(ParameterSetName = "Document")]
        [ValidateScript( { if (-not($Document) -or ($Document -eq '_all_docs')) { $true } })]
        [switch] $UpdateSequence,
        [Parameter(ParameterSetName = "Document")]
        [Parameter(ParameterSetName = "Info")]
        [string] $Authorization,
        [Parameter(ParameterSetName = "Document")]
        [Parameter(ParameterSetName = "Info")]
        [switch] $Ssl
    )
    # Check local docs
    if ($Local.IsPresent) {
        if ($Document -eq '_all_docs') {
            Write-Warning -Message "-Document $Document parameter is rewrite in _local_docs because -Local parameter is specified."
            $Document = "_local_docs"
        } else {
            Write-Warning -Message "-Document $Document parameter is rewrite in _local/$Document because -Local parameter is specified."
            $Document = "_local/$Document"
        }
    }
    # Select a revision
    if ($Revision) {
        $Document += "?rev=$Revision"
    }
    # Check info
    if ($Info.IsPresent) {
        Send-CouchDBRequest -Server $Server -Port $Port -Method "HEAD" -Database $Database -Document $Document -Authorization $Authorization -Ssl:$Ssl
        return
    }
    # Check Revisions parameter
    if ($Revisions.IsPresent) {
        if ($Document -match "\?") {
            $Document += "&revs=true"
        } else {
            $Document += "?revs=true"
        }
    } 
    # Check History parameter
    if ($History.IsPresent) {
        if ($Document -match "\?") {
            $Document += "&revs_info=true"
        } else {
            $Document += "?revs_info=true"
        }
    }
    # Check Attachments parameter
    if ($Attachments.IsPresent) {
        if ($Document -match "\?") {
            $Document += "&attachments=true"
        } else {
            $Document += "?attachments=true"
        }
    }
    # Check AttachmentsInfo parameter
    if ($AttachmentsInfo.IsPresent) {
        if ($Document -match "\?") {
            $Document += "&att_encoding_info=true"
        } else {
            $Document += "?att_encoding_info=true"
        }
    }
    # Check AttachmentsSince parameter
    if ($AttachmentsSince) {
        if ($Document -match "\?") {
            $Document += "&atts_since=$(
                if ($AttachmentsSince.Count -eq 1) {
                    "[$($AttachmentsSince | ConvertTo-Json -Compress)]"
                } else {
                    $AttachmentsSince | ConvertTo-Json -Compress
                }
            )"
        } else {
            $Document += "?atts_since=$(
                if ($AttachmentsSince.Count -eq 1) {
                    "[$($AttachmentsSince | ConvertTo-Json -Compress)]"
                } else {
                    $AttachmentsSince | ConvertTo-Json -Compress
                }
            )"
        }
    }
    # Check Conflicts parameter
    if ($Conflicts.IsPresent) {
        if ($Document -match "\?") {
            $Document += "&conflicts=true"
        } else {
            $Document += "?conflicts=true"
        }
    }
    # Check DeletedConflicts parameter
    if ($DeletedConflicts.IsPresent) {
        if ($Document -match "\?") {
            $Document += "&deleted_conflicts=true"
        } else {
            $Document += "?deleted_conflicts=true"
        }
    }
    # Check Latest parameter
    if ($Latest.IsPresent) {
        if ($Document -match "\?") {
            $Document += "&latest=true"
        } else {
            $Document += "?latest=true"
        }
    }
    # Check LocalSequence parameter
    if ($LocalSequence.IsPresent) {
        if ($Document -match "\?") {
            $Document += "&local_seq=true"
        } else {
            $Document += "?local_seq=true"
        }
    }
    # Check Metadata parameter
    if ($Metadata.IsPresent) {
        if ($Document -match "\?") {
            $Document += "&meta=true"
        } else {
            $Document += "?meta=true"
        }
    }
    # Check OpenRevisions parameter
    if ($MyInvocation.BoundParameters.Keys -match 'OpenRevisions') {
        if ($OpenRevisions) {
            if ($Document -match "\?") {
                $Document += "&open_revs=$(
                    if ($OpenRevisions.Count -eq 1) {
                        "[$($OpenRevisions | ConvertTo-Json -Compress)]"
                    } else {
                        $OpenRevisions | ConvertTo-Json -Compress
                    }
                    )"
            } else {
                $Document += "?open_revs=$(
                    if ($OpenRevisions.Count -eq 1) {
                        "[$($OpenRevisions | ConvertTo-Json -Compress)]"
                    } else {
                        $OpenRevisions | ConvertTo-Json -Compress
                    }
                    )"
            }
        } elseif ($OpenRevisions.Length -eq 0) {
            if ($Document -match "\?") {
                $Document += '&open_revs=all'
            } else {
                $Document += '?open_revs=all'
            }
        }
    }
    # Check Descending parameter
    if ($Descending.IsPresent) {
        if ($Document -match "\?") {
            $Document += "&descending=true"
        } else {
            $Document += "?descending=true"
        }
    }
    # Check EndKey parameter
    if ($EndKey) {
        if ($Document -match "\?") {
            $Document += "&endkey=`"$EndKey`""
        } else {
            $Document += "?endkey=`"$EndKey`""
        }
    }
    # Check EndKeyDocument parameter
    if ($EndKeyDocument) {
        if ($Document -match "\?") {
            $Document += "&endkey_docid=`"$EndKeyDocument`""
        } else {
            $Document += "?endkey_docid=`"$EndKeyDocument`""
        }
    }
    # Check Group parameter
    if ($Group.IsPresent) {
        if ($Document -match "\?") {
            $Document += "&group=true"
        } else {
            $Document += "?group=true"
        }
    }
    # Check GroupLevel parameter
    if ($GroupLevel) {
        if ($Document -match "\?") {
            $Document += "&group_level=$GroupLevel"
        } else {
            $Document += "?group_level=$GroupLevel"
        }
    }
    # Check IncludeDocuments parameter
    if ($IncludeDocuments.IsPresent) {
        if ($Document -match "\?") {
            $Document += "&include_docs=true"
        } else {
            $Document += "?include_docs=true"
        }
    }
    # Check InclusiveEnd parameter
    if ($InclusiveEnd -eq $false) {
        if ($Document -match "\?") {
            $Document += "&inclusive_end=false"
        } else {
            $Document += "?inclusive_end=false"
        }
    }
    # Check Key parameter
    if ($Key) {
        if ($Key -isnot [int]) { $Key = "`"$Key`"" }
        if ($Document -match "\?") {
            $Document += "&key=$Key"
        } else {
            $Document += "?key=$Key"
        }
    }
    # Check Keys parameter
    if ($Keys) {
        if ($Document -match "\?") {
            $Document += "&keys=$(
                if ($Keys.Count -eq 1) {
                    "[$($Keys | ConvertTo-Json -Compress)]"
                } else {
                    $Keys | ConvertTo-Json -Compress
                }
                )"
        } else {
            $Document += "?keys=$(
                if ($Keys.Count -eq 1) {
                    "[$($Keys | ConvertTo-Json -Compress)]"
                } else {
                    $Keys | ConvertTo-Json -Compress
                }
                )"
        }
    }
    # Check Limit parameter
    if ($Limit) {
        if ($Document -match "\?") {
            $Document += "&limit=$Limit"
        } else {
            $Document += "?limit=$Limit"
        }
    }
    # Check Reduce parameter
    if ($Reduce -eq $false) {
        if ($Document -match "\?") {
            $Document += "&reduce=false"
        } else {
            $Document += "?reduce=false"
        }
    }
    # Check Skip parameter
    if ($Skip) {
        if ($Document -match "\?") {
            $Document += "&skip=$Skip"
        } else {
            $Document += "?skip=$Skip"
        }
    }
    # Check Sorted parameter
    if ($Sorted -eq $false) {
        if ($Document -match "\?") {
            $Document += "&sorted=false"
        } else {
            $Document += "?sorted=false"
        }
    }
    # Check Stable parameter
    if ($Stable.IsPresent) {
        if ($Document -match "\?") {
            $Document += "&stable=true"
        } else {
            $Document += "?stable=true"
        }
    }
    # Check Stale parameter
    if ($Stale) {
        if ($Document -match "\?") {
            $Document += "&stale=$Stale"
        } else {
            $Document += "?stale=$Stale"
        }
    }
    # Check StartKey parameter
    if ($StartKey) {
        if ($Document -match "\?") {
            $Document += "&startkey=`"$StartKey`""
        } else {
            $Document += "?startkey=`"$StartKey`""
        }
    }
    # Check StartKeyDocument parameter
    if ($StartKeyDocument) {
        if ($Document -match "\?") {
            $Document += "&startkey_docid=`"$StartKeyDocument`""
        } else {
            $Document += "?startkey_docid=`"$StartKeyDocument`""
        }
    }
    # Check Update parameter
    if ($Update) {
        if ($Document -match "\?") {
            $Document += "&update=$Update"
        } else {
            $Document += "?update=$Update"
        }
    }
    # Check UpdateSequence parameter
    if ($UpdateSequence.IsPresent) {
        if ($Document -match "\?") {
            $Document += "&update_seq=true"
        } else {
            $Document += "?update_seq=true"
        }
    }
    Send-CouchDBRequest -Server $Server -Port $Port -Method "GET" -Database $Database -Document $Document -Authorization $Authorization -Ssl:$Ssl
}

function Get-CouchDBBulkDocument () {
    <#
    .SYNOPSIS
    Get a bulk document.
    .DESCRIPTION
    This method can be called to query several documents in bulk.
    .NOTES
    CouchDB API:
        POST /{db}/_bulk_get
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER Database
    The CouchDB database.
    .PARAMETER Document
    Array of the CouchDB documents.
    .PARAMETER Authorization
    The CouchDB authorization form; user and password.
    Authorization format like this: user:password
    ATTENTION: if the password is not specified, it will be prompted.
    .PARAMETER Ssl
    Set ssl connection on CouchDB server.
    This modify protocol to https and port to 6984.
    .EXAMPLE
    Get-CouchDBBulkDocument -Database test -Document "Hitchhikers","Hitchhikers Guide", "answer"
    This example get list of three document: "Hitchhikers","Hitchhikers Guide", "answer" on a database "test".
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/documents.html#get-a-bulk-documents
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory = $true)]
        [string] $Database,
        [Parameter(mandatory = $true, ValueFromPipeline = $true)]
        [array] $Document,
        [string] $Authorization,
        [switch] $Ssl
    )
    $Data = '{"docs": ['
    for ($counter = 0; $counter -lt $Document.Count; $counter++) {
        $Data += "{`"id`": `"$($Document[$counter])`"}"
        if ($counter -lt ($Document.Count - 1)) {
            $Data += ','
        }
    }
    $Data += ']}'
    [string] $Document = "_bulk_get"
    Send-CouchDBRequest -Server $Server -Port $Port -Method "POST" -Database $Database -Document $Document -Data $Data -Authorization $Authorization -Ssl:$Ssl
}

function Get-CouchDBDesignDocument () {
    <#
    .SYNOPSIS
    Get a design document.
    .DESCRIPTION
    Returns a hashtable structure of all of the design documents in a given database. 
    The information is returned as a hashtable structure containing meta information about the return structure, 
    including a list of all design documents and basic contents, consisting the ID, revision and key. 
    The key is the from the design document’s _id.
    .NOTES
    CouchDB API:
        GET /{db}/_design/{ddoc}
        HEAD /{db}/_design/{ddoc}
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER Database
    The CouchDB database.
    .PARAMETER Document
    The CouchDB document.
    .PARAMETER Info
    The CouchDB header of document.
    .PARAMETER Authorization
    The CouchDB authorization form; user and password.
    Authorization format like this: user:password
    ATTENTION: if the password is not specified, it will be prompted.
    .PARAMETER Ssl
    Set ssl connection on CouchDB server.
    This modify protocol to https and port to 6984.
    .EXAMPLE
    Get-CouchDBDesignDocument -Database test -Document "space"
    This example get "space" design document on database "test".
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/ddoc.html#get-a-design-document
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory = $true)]
        [string] $Database,
        [Parameter(mandatory = $true, ValueFromPipeline = $true)]
        [string] $Document,
        [switch] $Info,
        [string] $Authorization,
        [switch] $Ssl
    )
    $Document = "_design/$Document"
    if ($Info.IsPresent) { $Method = "HEAD" } else { $Method = "GET" }
    Send-CouchDBRequest -Server $Server -Port $Port -Method $Method -Database $Database -Document $Document -Authorization $Authorization -Ssl:$Ssl
}

function Get-CouchDBDesignDocumentAttachment () {
    <#
    .SYNOPSIS
    Get or save attachment from design document.
    .DESCRIPTION
    It’s possible to retrieve design document with all attached files content.
    .NOTES
    CouchDB API:
        GET /{db}/_design/{ddoc}/{attname}
        HEAD /{db}/_design/{ddoc}/{attname}
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER Database
    The CouchDB database.
    .PARAMETER Document
    The CouchDB document.
    .PARAMETER Revision
    The CouchDB revision document.
    .PARAMETER Attachment
    The CouchDB attachment document.
    .PARAMETER Info
    The CouchDB attachment document infos.
    .PARAMETER OutFile
    The full path where save attachment document.
    .PARAMETER Authorization
    The CouchDB authorization form; user and password.
    Authorization format like this: user:password
    ATTENTION: if the password is not specified, it will be prompted.
    .PARAMETER Ssl
    Set ssl connection on CouchDB server.
    This modify protocol to https and port to 6984.
    .EXAMPLE
    Get-CouchDBDesignDocumentAttachment -Database test -Document space -Attachment test.txt
    This example get attachment "test.txt" on "space" design document on database "test".
    .EXAMPLE
    Get-CouchDBDesignDocumentAttachment -Database test -Document space -Attachment test.txt -OutFile C:\test.txt
    This example save attachment "test.txt" to C:\test.txt on "space" design document on database "test".
    .EXAMPLE
    Get-CouchDBDesignDocumentAttachment -Database test -Document space -Attachment test.txt -Info
    This example get attachment "test.txt" infos on "space" design document on database "test".
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/ddoc.html#design-document-attachment
    #>
    [CmdletBinding(DefaultParameterSetName = "Attachment")]
    param(
        [Parameter(ParameterSetName = "Attachment")]
        [Parameter(ParameterSetName = "Info")]
        [string] $Server,
        [Parameter(ParameterSetName = "Attachment")]
        [Parameter(ParameterSetName = "Info")]
        [int] $Port,
        [Parameter(ParameterSetName = "Attachment")]
        [Parameter(ParameterSetName = "Info")]
        [Parameter(mandatory = $true)]
        [string] $Database,
        [Parameter(ParameterSetName = "Attachment")]
        [Parameter(ParameterSetName = "Info")]
        [Parameter(mandatory = $true, ValueFromPipeline = $true)]
        [string] $Document,
        [Parameter(ParameterSetName = "Attachment")]
        [Parameter(ParameterSetName = "Info")]
        [string] $Revision,
        [Parameter(ParameterSetName = "Info")]
        [switch] $Info,
        [Parameter(ParameterSetName = "Attachment")]
        [Parameter(ParameterSetName = "Info")]
        [Parameter(mandatory = $true)]
        [string] $Attachment,
        [Parameter(ParameterSetName = "Attachment")]
        [string] $OutFile,
        [Parameter(ParameterSetName = "Attachment")]
        [Parameter(ParameterSetName = "Info")]
        [string] $Authorization,
        [Parameter(ParameterSetName = "Attachment")]
        [Parameter(ParameterSetName = "Info")]
        [switch] $Ssl
    )
    if ($Info.IsPresent) {
        $Method = "HEAD"
    } else {
        $Method = "GET"
    }
    $Document = "_design/$Document"
    Send-CouchDBRequest -Server $Server -Port $Port -Method $Method -Database $Database -Document $Document -Revision $Revision -Attachment $Attachment -OutFile $OutFile -Authorization $Authorization -Ssl:$Ssl
}

function Get-CouchDBDatabaseDesignDocument () {
    <#
    .SYNOPSIS
    Get all design document on a database.
    .DESCRIPTION
    Returns a JSON structure of all of the design documents in a given database.
    .NOTES
    CouchDB API:
        GET /{db}/_design_docs
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER Database
    The CouchDB database.
    .PARAMETER Descending
    Return the design documents in descending by key order. Default is false.
    .PARAMETER EndKey
    Stop returning records when the specified key is reached.
    .PARAMETER EndKeyDocument
    Stop returning records when the specified design document ID is reached.
    .PARAMETER IncludeDocument
    Include the full content of the design documents in the return. Default is false.
    .PARAMETER InclusiveEnd
    Specifies whether the specified end key should be included in the result. Default is true.
    .PARAMETER Key
    Return only design documents that match the specified key.
    .PARAMETER Keys
    Return only design documents that match the specified keys.
    .PARAMETER Conflict
    Includes conflicts information in response. Ignored if include_docs isn’t true. Default is false.
    .PARAMETER Limit
    Limit the number of the returned design documents to the specified number.
    .PARAMETER Skip
    Skip this number of records before starting to return the results. Default is 0.
    .PARAMETER StartKey
    Return records starting with the specified key.
    .PARAMETER StartKeyDocument
    Return records starting with the specified design document ID.
    .PARAMETER UpdateSequence
    Response includes an update_seq value indicating which sequence id of the underlying database the view reflects. Default is false.
    .PARAMETER Authorization
    The CouchDB authorization form; user and password.
    Authorization format like this: user:password
    ATTENTION: if the password is not specified, it will be prompted.
    .PARAMETER Ssl
    Set ssl connection on CouchDB server.
    This modify protocol to https and port to 6984.
    .EXAMPLE
    Get-CouchDBDatabaseDesignDocument -Database test
    This example get all design document on database "test".
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/ddoc.html#get-a-design-document
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory = $true, ValueFromPipeline = $true)]
        [string] $Database,
        [Alias('Desc')]
        [switch] $Descending,
        [Alias('End')]
        [string] $EndKey,
        [Alias('EndDoc')]
        [string] $EndKeyDocument,
        [Alias('IncDoc')]
        [switch] $IncludeDocument,
        [Alias('IncEnd')]
        [bool] $InclusiveEnd = $true,
        [string] $Key,
        [array] $Keys,
        [switch] $Conflict,
        [int] $Limit,
        [int] $Skip,
        [Alias('Start')]
        [string] $StartKey,
        [Alias('StartDoc')]
        [string] $StartKeyDocument,
        [Alias('Update')]
        [switch] $UpdateSequence,
        [string] $Authorization,
        [switch] $Ssl
    )
    $Document = "_design_docs"
    # Check descending parameter
    if ($Descending.IsPresent) {
        if ($Document -match "\?") {
            $Document += "&descending=true"
        } else {
            $Document += "?descending=true"
        }
    }
    # Check endkey parameter
    if ($EndKey) {
        if ($Document -match "\?") {
            $Document += "&endkey=`"$EndKey`""
        } else {
            $Document += "?endkey=`"$EndKey`""
        }
    }
    # Check endkey_docid parameter
    if ($EndKeyDocument) {
        if ($Document -match "\?") {
            $Document += "&endkey_docid=`"$EndKeyDocument`""
        } else {
            $Document += "?endkey_docid=`"$EndKeyDocument`""
        }
    }
    # Check include_docs parameter
    if ($IncludeDocument.IsPresent) {
        if ($Document -match "\?") {
            $Document += "&include_docs=true"
        } else {
            $Document += "?include_docs=true"
        }
    }
    # Check inclusive_end parameter
    if ($InclusiveEnd -eq $false) {
        if ($Document -match "\?") {
            $Document += "&inclusive_end=false"
        } else {
            $Document += "?inclusive_end=false"
        }
    }
    # Check key parameter
    if ($Key) {
        if ($Document -match "\?") {
            $Document += "&key=`"$Key`""
        } else {
            $Document += "?key=`"$Key`""
        }
    }
    # Check keys parameter
    if ($Keys) {
        if ($Document -match "\?") {
            $Document += "&keys=$(
                if ($Keys.Count -eq 1) {
                    "[$($Keys | ConvertTo-Json -Compress)]"
                } else {
                    $Keys | ConvertTo-Json -Compress
                }
            )"
        } else {
            $Document += "?keys=$(
                if ($Keys.Count -eq 1) {
                    "[$($Keys | ConvertTo-Json -Compress)]"
                } else {
                    $Keys | ConvertTo-Json -Compress
                }
            )"
        }
    }
    # Check conflicts parameter
    if ($Conflict.IsPresent) {
        if ($Document -match "\?") {
            $Document += "&conflicts=true"
        } else {
            $Document += "?conflicts=true"
        }
    }
    # Check limit parameter
    if ($Limit) {
        if ($Document -match "\?") {
            $Document += "&limit=$Limit"
        } else {
            $Document += "?limit=$Limit"
        }
    }
    # Check skip parameter
    if ($Skip) {
        if ($Document -match "\?") {
            $Document += "&skip=$Skip"
        } else {
            $Document += "?skip=$Skip"
        }
    }
    # Check startkey parameter
    if ($StartKey) {
        if ($Document -match "\?") {
            $Document += "&startkey=`"$StartKey`""
        } else {
            $Document += "?startkey=`"$StartKey`""
        }
    }
    # Check startkey_docid parameter
    if ($StartKeyDocument) {
        if ($Document -match "\?") {
            $Document += "&startkey_docid=`"$StartKeyDocument`""
        } else {
            $Document += "?startkey_docid=`"$StartKeyDocument`""
        }
    }
    # Check update_seq parameter
    if ($UpdateSequence.IsPresent) {
        if ($Document -match "\?") {
            $Document += "&update_seq=true"
        } else {
            $Document += "?update_seq=true"
        }
    }
    Send-CouchDBRequest -Server $Server -Port $Port -Method "GET" -Database $Database -Document $Document -Authorization $Authorization -Ssl:$Ssl
}

function Get-CouchDBAttachment () {
    <#
    .SYNOPSIS
    Get or save attachment.
    .DESCRIPTION
    It’s possible to retrieve document with all attached files content.
    .NOTES
    CouchDB API:
        GET /{db}/{docid}/{attname}
        HEAD /{db}/{docid}/{attname}
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER Database
    The CouchDB database.
    .PARAMETER Document
    The CouchDB document.
    .PARAMETER Revision
    The CouchDB revision document.
    .PARAMETER Attachment
    The CouchDB attachment document.
    .PARAMETER Info
    The CouchDB attachment document infos.
    .PARAMETER OutFile
    The full path where save attachment document.
    .PARAMETER Authorization
    The CouchDB authorization form; user and password.
    Authorization format like this: user:password
    ATTENTION: if the password is not specified, it will be prompted.
    .PARAMETER Ssl
    Set ssl connection on CouchDB server.
    This modify protocol to https and port to 6984.
    .EXAMPLE
    Get-CouchDBAttachment -Database test -Document "Hitchhikers" -Attachment test.txt
    This example get attachment "test.txt" on "Hitchhikers" document on database "test".
    .EXAMPLE
    Get-CouchDBAttachment -Database test -Document "Hitchhikers" -Attachment test.txt -OutFile C:\test.txt
    This example save attachment "test.txt" to C:\test.txt on "Hitchhikers" document on database "test".
    .EXAMPLE
    Get-CouchDBAttachment -Database test -Document "Hitchhikers" -Attachment test.txt -Info
    This example get attachment "test.txt" infos on "Hitchhikers" document on database "test".
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/documents.html#get-an-attachment
    #>
    [CmdletBinding(DefaultParameterSetName = "Attachment")]
    param(
        [Parameter(ParameterSetName = "Attachment")]
        [Parameter(ParameterSetName = "Info")]
        [string] $Server,
        [Parameter(ParameterSetName = "Attachment")]
        [Parameter(ParameterSetName = "Info")]
        [int] $Port,
        [Parameter(ParameterSetName = "Attachment")]
        [Parameter(ParameterSetName = "Info")]
        [Parameter(mandatory = $true)]
        [string] $Database,
        [Parameter(ParameterSetName = "Attachment")]
        [Parameter(ParameterSetName = "Info")]
        [Parameter(mandatory = $true, ValueFromPipeline = $true)]
        [string] $Document,
        [Parameter(ParameterSetName = "Attachment")]
        [Parameter(ParameterSetName = "Info")]
        [string] $Revision,
        [Parameter(ParameterSetName = "Info")]
        [switch] $Info,
        [Parameter(ParameterSetName = "Attachment")]
        [Parameter(ParameterSetName = "Info")]
        [Parameter(mandatory = $true)]
        [string] $Attachment,
        [Parameter(ParameterSetName = "Attachment")]
        [string] $OutFile,
        [Parameter(ParameterSetName = "Attachment")]
        [Parameter(ParameterSetName = "Info")]
        [string] $Authorization,
        [Parameter(ParameterSetName = "Attachment")]
        [Parameter(ParameterSetName = "Info")]
        [switch] $Ssl
    )
    if ($Info.IsPresent) {
        $Method = "HEAD"
    } else {
        $Method = "GET"
    }
    Send-CouchDBRequest -Server $Server -Port $Port -Method $Method -Database $Database -Document $Document -Revision $Revision -Attachment $Attachment -OutFile $OutFile -Authorization $Authorization -Ssl:$Ssl
}

function Get-CouchDBUser () {
    <#
    .SYNOPSIS
    Get an user.
    .DESCRIPTION
    Get a CouchDB user.
    .NOTES
    CouchDB API:
        GET /_users
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER Userid
    The user_id than exists in _users database.
    .PARAMETER Authorization
    The CouchDB authorization form; user and password.
    Authorization format like this: user:password
    ATTENTION: if the password is not specified, it will be prompted.
    .PARAMETER Ssl
    Set ssl connection on CouchDB server.
    This modify protocol to https and port to 6984.
    .EXAMPLE
    Get-CouchDBUser -Userid test_user
    This example get info of user "test_user".
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/permission.html
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory = $true, ValueFromPipeline = $true)]
        [string] $Userid,
        [string] $Authorization,
        [switch] $Ssl
    )
    $Database = "_users"
    $Document = "org.couchdb.user:$Userid"
    Send-CouchDBRequest -Server $Server -Port $Port -Method "GET" -Database $Database -Document $Document -Authorization $Authorization -Ssl:$Ssl
}

function Get-CouchDBAdmin () {
    <#
    .SYNOPSIS
    Get an admin user.
    .DESCRIPTION
    Get a CouchDB admin user.
    .NOTES
    CouchDB API:
        GET /_node/{node-name}/_config/admins
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER Node
    The CouchDB node of cluster. Default is couchdb@localhost.
    .PARAMETER Authorization
    The CouchDB authorization form; user and password.
    Authorization format like this: user:password
    ATTENTION: if the password is not specified, it will be prompted.
    .PARAMETER Ssl
    Set ssl connection on CouchDB server.
    This modify protocol to https and port to 6984.
    .EXAMPLE
    Get-CouchDBAdmin -Authorization "admin:password"
    This example 
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/permission.html
    #>
    [CmdletBinding()]
    param(
        [Parameter(ValueFromPipeline = $true)]
        [string] $Server,
        [int] $Port,
        [string] $Node = $(if ((Get-CouchDBNode -Server $Server -Port $Port -Authorization $Authorization -Ssl:$Ssl).all_nodes -contains "couchdb@localhost") { "couchdb@localhost" } else { "couchdb@127.0.0.1" }),
        [string] $Authorization,
        [switch] $Ssl
    )
    $Database = "_node"
    $Document = "$Node/_config/admins"
    Send-CouchDBRequest -Server $Server -Port $Port -Method "GET" -Database $Database -Document $Document -Authorization $Authorization -Ssl:$Ssl
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

function Get-CouchDBConfiguration () {
    <#
    .SYNOPSIS
    Get configuration.
    .DESCRIPTION
    Get configuration of CouchDB server.
    .NOTES
    CouchDB API:
        GET /_node/{node-name}/_config
        GET /_node/{node-name}/_config/{section}
        GET /_node/{node-name}/_config/{section}/{key}
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER Node
    The CouchDB node of cluster. Default is couchdb@localhost.
    .PARAMETER Session
    The CouchDB configuration section name.
    .PARAMETER Key
    The CouchDB configuration option name.
    .PARAMETER Authorization
    The CouchDB authorization form; user and password.
    Authorization format like this: user:password
    ATTENTION: if the password is not specified, it will be prompted.
    .PARAMETER Ssl
    Set ssl connection on CouchDB server.
    This modify protocol to https and port to 6984.
    .EXAMPLE
    Get-CouchDBConfiguration
    This example get the localhost configuration of CouchDB server.
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/config.html#get-configuration
    #>
    [CmdletBinding()]
    param(
        [Parameter(ValueFromPipeline = $true)]
        [string] $Server,
        [int] $Port,
        [string] $Node = $(if ((Get-CouchDBNode -Server $Server -Port $Port -Authorization $Authorization -Ssl:$Ssl).all_nodes -contains "couchdb@localhost") { "couchdb@localhost" } else { "couchdb@127.0.0.1" }),
        [string] $Session,
        [string] $Key,
        [string] $Authorization,
        [switch] $Ssl
    )
    $Database = "_node"
    $Document = "$Node/_config"
    # Check Session parameter
    if ($Session) {
        $Document += "/$Session"
    }
    # Check Key parameter
    if ($Session -and $Key) {
        $Document += "/$Key"
    }
    Send-CouchDBRequest -Server $Server -Port $Port -Method "GET" -Database $Database -Document $Document -Authorization $Authorization -Ssl:$Ssl
}

function Get-CouchDBNode () {
    <#
    .SYNOPSIS
    Get server nodes.
    .DESCRIPTION
    Displays the nodes that are part of the cluster as cluster_nodes.
    .NOTES
    CouchDB API:
        GET /_membership
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
    Get-CouchDBNode -Authorization "admin:password"
    This example get all node in a cluster.
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/config.html#nodes
    #>
    [CmdletBinding()]
    param(
        [Parameter(ValueFromPipeline = $true)]
        [string] $Server,
        [int] $Port,
        [string] $Authorization,
        [switch] $Ssl
    )
    $Database = "_membership"
    Send-CouchDBRequest -Server $Server -Port $Port -Method "GET" -Database $Database -Document $Document -Authorization $Authorization -Ssl:$Ssl
}

function Get-CouchDBReplication () {
    <#
    .SYNOPSIS
    Get database replication.
    .DESCRIPTION
    Get database replication status of CouchDB server.
    .NOTES
    CouchDB API:
        GET /_replicator/{docid}
        GET /_replicator/_all_docs
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER Document
    The CouchDB document. Default is _all_docs.
    .PARAMETER Authorization
    The CouchDB authorization form; user and password.
    Authorization format like this: user:password
    ATTENTION: if the password is not specified, it will be prompted.
    .PARAMETER Ssl
    Set ssl connection on CouchDB server.
    This modify protocol to https and port to 6984.
    .EXAMPLE
    Get-CouchDBReplication -Authorization "admin:password"
    This example get all replica documents.
    .EXAMPLE
    Get-CouchDBReplication -Document "localhost-test_localhost-test_dump" -Authorization "admin:password"
    This example get "localhost-test_localhost-test_dump" replica documents.
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/server.html#get-replica
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(ValueFromPipeline = $true)]
        [string] $Document = '_all_docs',
        [string] $Authorization,
        [switch] $Ssl
    )
    $Database = "_replicator"
    if (-not(Test-CouchDBDatabase -Server $Server -Port $Port -Database $Database -Authorization $Authorization -Ssl:$Ssl -ErrorAction SilentlyContinue)) {
        throw "Database replicator $Database not exists."
    }
    Send-CouchDBRequest -Server $Server -Port $Port -Method "GET" -Database $Database -Document $Document -Authorization $Authorization -Ssl:$Ssl
}

function Get-CouchDBReplicationScheduler () {
    <#
    .SYNOPSIS
    Get more details of database replication.
    .DESCRIPTION
    List of replication jobs. Includes replications created via /_replicate endpoint as well.
    .NOTES
    CouchDB API:
        GET /_scheduler/jobs
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER Limit
    How many results to return.
    .PARAMETER Skip
    How many result to skip starting at the beginning, ordered by replication ID.
    .PARAMETER Authorization
    The CouchDB authorization form; user and password.
    Authorization format like this: user:password
    ATTENTION: if the password is not specified, it will be prompted.
    .PARAMETER Ssl
    Set ssl connection on CouchDB server.
    This modify protocol to https and port to 6984.
    .EXAMPLE
    Get-CouchDBReplicationScheduler -Authorization "admin:password"
    This example get scheduler of replication documents.
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/server.html#get-replica
    #>
    [CmdletBinding()]
    param(
        [Parameter(ValueFromPipeline = $true)]
        [string] $Server,
        [int] $Port,
        [int] $Limit,
        [int] $Skip,
        [string] $Authorization,
        [switch] $Ssl
    )
    $Database = "_scheduler"
    $Document = 'jobs'
    # Check Limit parameter
    if ($Limit) {
        if ($Document -match "\?") {
            $Document += "&limit=$Limit"
        } else {
            $Document += "?limit=$Limit"
        }
    }
    # Check Skip parameter
    if ($Skip) {
        if ($Document -match "\?") {
            $Document += "&skip=$Skip"
        } else {
            $Document += "?skip=$Skip"
        }
    }
    Send-CouchDBRequest -Server $Server -Port $Port -Method "GET" -Database $Database -Document $Document -Authorization $Authorization -Ssl:$Ssl
}

function Get-CouchDBReplicationDocument () {
    <#
    .SYNOPSIS
    List of replication document states.
    .DESCRIPTION
    List of replication document states. Includes information about all the documents, even in completed and failed states.
    .NOTES
    CouchDB API:
        GET /_scheduler/docs
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER Limit
    How many results to return.
    .PARAMETER Skip
    How many result to skip starting at the beginning, ordered by replication ID.
    .PARAMETER ReplicatorDatabase
    Get information about replication documents from a replicator database.
    .PARAMETER ReplicatorDocuments
    Get information about replication document from a replicator database. -ReplicatorDatabase parameter is required.
    .PARAMETER Authorization
    The CouchDB authorization form; user and password.
    Authorization format like this: user:password
    ATTENTION: if the password is not specified, it will be prompted.
    .PARAMETER Ssl
    Set ssl connection on CouchDB server.
    This modify protocol to https and port to 6984.
    .EXAMPLE
    Get-CouchDBReplicationDocument -Authorization "admin:password"
    This example get the documents of replicas.
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/server.html#get-replica
    #>
    [CmdletBinding()]
    param(
        [Parameter(ValueFromPipeline = $true)]
        [string] $Server,
        [int] $Port,
        [int] $Limit,
        [int] $Skip,
        [string] $ReplicatorDatabase,
        [ValidateScript( { if ($ReplicatorDatabase) { $true } else { $false } })]
        [string] $ReplicatorDocuments,
        [string] $Authorization,
        [switch] $Ssl
    )
    $Database = "_scheduler"
    $Document = "docs"
    # Check ReplicatorDatabase parameter
    if ($ReplicatorDatabase) {
        $Document += "/$ReplicatorDatabase"
    }
    # Check ReplicatorDatabase parameter
    if ($ReplicatorDocuments) {
        $Document += "/$ReplicatorDocuments"
    }
    # Check Limit parameter
    if ($Limit) {
        if ($Document -match "\?") {
            $Document += "&limit=$Limit"
        } else {
            $Document += "?limit=$Limit"
        }
    }
    # Check Skip parameter
    if ($Skip) {
        if ($Document -match "\?") {
            $Document += "&skip=$Skip"
        } else {
            $Document += "?skip=$Skip"
        }
    }
    Send-CouchDBRequest -Server $Server -Port $Port -Method "GET" -Database $Database -Document $Document -Authorization $Authorization -Ssl:$Ssl
}

function Get-CouchDBActiveTask () {
    <#
    .SYNOPSIS
    Get an active task.
    .DESCRIPTION
    List of running tasks, including the task type, name, status and process ID.
    .NOTES
    CouchDB API:
        GET /_active_tasks
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
    Get-CouchDBActiveTask -Authorization "admin:password"
    This example get all active task.
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/server.html
    #>
    [CmdletBinding()]
    param(
        [Parameter(ValueFromPipeline = $true)]
        [string] $Server,
        [int] $Port,
        [string] $Authorization,
        [switch] $Ssl
    )
    $Database = "_active_tasks"
    Send-CouchDBRequest -Server $Server -Port $Port -Method "GET" -Database $Database -Authorization $Authorization -Ssl:$Ssl
}

function Get-CouchDBClusterSetup () {
    <#
    .SYNOPSIS
    Get a cluster setup.
    .DESCRIPTION
    Returns the status of the node or cluster, per the cluster setup wizard.
    .NOTES
    CouchDB API:
        GET /_cluster_setup
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER EnsureDatabaseExist
    List of system databases to ensure exist on the node/cluster. Defaults to ["_users","_replicator","_global_changes"].
    .PARAMETER Authorization
    The CouchDB authorization form; user and password.
    Authorization format like this: user:password
    ATTENTION: if the password is not specified, it will be prompted.
    .PARAMETER Ssl
    Set ssl connection on CouchDB server.
    This modify protocol to https and port to 6984.
    .EXAMPLE
    Get-CouchDBClusterSetup
    This example get a cluster setup.
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/server.html
    #>
    [CmdletBinding()]
    param(
        [Parameter(ValueFromPipeline = $true)]
        [string] $Server,
        [int] $Port,
        [AllowEmptyCollection()]
        [array] $EnsureDatabaseExist,
        [string] $Authorization,
        [switch] $Ssl
    )
    $Database = "_cluster_setup"
    # Check EnsureDatabaseExist parameter
    if ($PSBoundParameters.ContainsKey('EnsureDatabaseExist')) {
        if ($EnsureDatabaseExist) {
            if ($Database -match "\?") {
                $Database += "&ensure_dbs_exist=$(
                    if ($EnsureDatabaseExist.Count -eq 1) {
                        "[$($EnsureDatabaseExist | ConvertTo-Json -Compress)]"
                    } else {
                        $EnsureDatabaseExist | ConvertTo-Json -Compress
                    }
                )"
            } else {
                $Database += "?ensure_dbs_exist=$(
                    if ($EnsureDatabaseExist.Count -eq 1) {
                        "[$($EnsureDatabaseExist | ConvertTo-Json -Compress)]"
                    } else {
                        $EnsureDatabaseExist | ConvertTo-Json -Compress
                    }
                )"
            }
        } else {
            if ($Database -match "\?") {
                $Database += '&ensure_dbs_exist=["_users","_replicator","_global_changes"]'
            } else {
                $Database += '?ensure_dbs_exist=["_users","_replicator","_global_changes"]'
            }
        }
    }
    Send-CouchDBRequest -Server $Server -Port $Port -Method "GET" -Database $Database -Authorization $Authorization -Ssl:$Ssl
}

function Get-CouchDBIndex () {
    <#
    .SYNOPSIS
    Get indexes on database.
    .DESCRIPTION
    When you make a GET request to /db/_index, you get a list of all indexes in the database
    .NOTES
    CouchDB API:
        GET /{db}/_index
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
    Get-CouchDBIndex -Database test
    This example get index document for database "test".
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/databases.html#get-a-index
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
    $Document = '_index'
    Send-CouchDBRequest -Server $Server -Port $Port -Method "GET" -Database $Database -Document $Document -Authorization $Authorization -Ssl:$Ssl
}

function Get-CouchDBMissingRevision () {
    <#
    .SYNOPSIS
    Returns the missing revisions.
    .DESCRIPTION
    With given a list of document revisions, returns the document revisions that do not exist in the database.
    .NOTES
    CouchDB API:
        POST /{db}/_missing_revs
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER Database
    The CouchDB database.
    .PARAMETER Document
    The CouchDB document.
    .PARAMETER Revision
    Array CouchDB revisions.
    .PARAMETER Authorization
    The CouchDB authorization form; user and password.
    Authorization format like this: user:password
    ATTENTION: if the password is not specified, it will be prompted.
    .PARAMETER Ssl
    Set ssl connection on CouchDB server.
    This modify protocol to https and port to 6984.
    .EXAMPLE
    Get-CouchDBMissingRevision -Database test -Document "Hitchhikers" -Revision 2-7051cbe5c8faecd085a3fa619e6e6337,3-825cb35de44c433bfb2df415563a19de
    This example check if revisions 2-7051cbe5c8faecd085a3fa619e6e6337,3-825cb35de44c433bfb2df415563a19de exists on document "Hitchhikers" from database "test".
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/databases.html#get-missing-revisions
    #>
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory = $true)]
        [string] $Database,
        [Parameter(mandatory = $true)]
        [string] $Document,
        [Parameter(mandatory = $true, ValueFromPipeline = $true)]
        [array] $Revision,
        [string] $Authorization,
        [switch] $Ssl
    )
    $Data = @{$Document = $Revision }
    $Data = $Data | ConvertTo-Json
    $Database = $Database + '/_missing_revs'
    Send-CouchDBRequest -Server $Server -Port $Port -Method "POST" -Database $Database -Data $Data -Authorization $Authorization -Ssl:$Ssl
}

function Get-CouchDBRevisionDifference () {
    <#
    .SYNOPSIS
    Returns the revision's difference.
    .DESCRIPTION
    Given a set of document/revision IDs, returns the subset of those that do not correspond to revisions stored in the database.
    .NOTES
    CouchDB API:
        POST /{db}/_revs_diff
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER Database
    The CouchDB database.
    .PARAMETER Document
    The CouchDB document.
    .PARAMETER Revision
    Array CouchDB revisions.
    .PARAMETER Authorization
    The CouchDB authorization form; user and password.
    Authorization format like this: user:password
    ATTENTION: if the password is not specified, it will be prompted.
    .PARAMETER Ssl
    Set ssl connection on CouchDB server.
    This modify protocol to https and port to 6984.
    .EXAMPLE
    Get-CouchDBRevisionDifference -Database test -Document "Hitchhikers" -Revision 2-7051cbe5c8faecd085a3fa619e6e6337,3-825cb35de44c433bfb2df415563a19de
    This example get revisions that do not correspond to revisions 2-7051cbe5c8faecd085a3fa619e6e6337,3-825cb35de44c433bfb2df415563a19de on document "Hitchhikers" from database "test".
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/databases.html#get-revision-difference
    #>
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory = $true)]
        [string] $Database,
        [Parameter(mandatory = $true)]
        [string] $Document,
        [Parameter(mandatory = $true, ValueFromPipeline = $true)]
        [array] $Revision,
        [string] $Authorization,
        [switch] $Ssl
    )
    $Data = @{$Document = $Revision }
    $Data = $Data | ConvertTo-Json
    $Database = $Database + '/_revs_diff'
    Send-CouchDBRequest -Server $Server -Port $Port -Method "POST" -Database $Database -Data $Data -Authorization $Authorization -Ssl:$Ssl
}

function Get-CouchDBRevisionLimit () {
    <#
    .SYNOPSIS
    Get revision's limit.
    .DESCRIPTION
    Gets the current revs_limit (revision limit) setting.
    .NOTES
    CouchDB API:
        GET /{db}/_revs_limit
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
    Get-CouchDBRevisionLimit -Database test
    This example get revision limit number from database "test".
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/databases.html#get-revision-limit
    #>
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory = $true, ValueFromPipeline = $true)]
        [string] $Database,
        [string] $Authorization,
        [switch] $Ssl
    )
    $Database = $Database + '/_revs_limit'
    Send-CouchDBRequest -Server $Server -Port $Port -Method "GET" -Database $Database -Authorization $Authorization -Ssl:$Ssl
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

function Sync-CouchDBDatabaseShards () {
    <#
    .SYNOPSIS
    Sync shards on database.
    .DESCRIPTION
    Force-starts internal shard synchronization for all replicas of all database shards.
    .NOTES
    CouchDB API:
        POST /{db}/_sync_shards
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
    Sync-CouchDBDatabaseShards -Database test -Authorization "admin:password"
    This example sync shards in all replicas from database "test".
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/databases.html#sync-shards
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
    $Database = $Database + '/_sync_shards'
    $Data = "{}"
    Send-CouchDBRequest -Server $Server -Port $Port -Method "POST" -Database $Database -Data $Data -Authorization $Authorization -Ssl:$Ssl
}

function Copy-CouchDBDocument () {
    <#
    .SYNOPSIS
    Copy from document.
    .DESCRIPTION
    Copy document to another in same database.
    To copy from a specific version, use the revision.
    .NOTES
    CouchDB API:
        COPY /{db}/{ddoc}
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER Database
    The CouchDB database.
    .PARAMETER Document
    The CouchDB source document.
    .PARAMETER Destination
    The CouchDB destination document.
    .PARAMETER Revision
    The CouchDB revision document.
    .PARAMETER Authorization
    The CouchDB authorization form; user and password.
    Authorization format like this: user:password
    ATTENTION: if the password is not specified, it will be prompted.
    .PARAMETER Ssl
    Set ssl connection on CouchDB server.
    This modify protocol to https and port to 6984.
    .EXAMPLE
    Copy-CouchDBDocument -Database test -Document "Hitchhikers" -Destination "Hitchhikers Guide" -Authorization "admin:password"
    This example copy "Hitchhikers" document to "Hitchhikers Guide" document on same database "test".
    .EXAMPLE
    Copy-CouchDBDocument -Database test -Document "Hitchhikers" -Destination "Hitchhikers Guide _deleted" -Revision 3-399796e5ce019e04311637e8a8a0f402 -Authorization "admin:password"
    This example copy specific revision 3-399796e5ce019e04311637e8a8a0f402 of "Hitchhikers" document to "Hitchhikers Guide" document on same database "test".
    .EXAMPLE
    Copy-CouchDBDocument -Database test -Document "001" -Destination "copy_001" -Authorization "admin:password"
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/documents.html#get-an-attachment
    #>
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory = $true)]
        [string] $Database,
        [Parameter(mandatory = $true, ValueFromPipeline = $true)]
        [string] $Document,
        [Parameter(mandatory = $true)]
        [string] $Destination,
        [string] $Revision,
        [string] $Authorization,
        [switch] $Ssl
    )
    # Check document id exists
    if (-not(Get-CouchDBDocument -Server $Server -Port $Port -Database $Database -Document $Document -Revision $Revision -Info -Authorization $Authorization -Ssl:$Ssl -ErrorAction SilentlyContinue)) {
        throw "The specific document $Document does not exists."
    } else {
        $Data = Get-CouchDBDocument -Server $Server -Port $Port -Database $Database -Document $Document -Revision $Revision -Authorization $Authorization -Ssl:$Ssl
        $Data._id = $Destination
        $Data.PSObject.Properties.Remove("_rev")
        $Data = ConvertTo-Json -InputObject $Data -Depth 99
    }
    # Check if document and destination are different
    if ($Document -eq $Destination) {
        throw "Document $Document and destination $Destination have a same name."
    } else {
        $Document = $Destination
    }
    Send-CouchDBRequest -Server $Server -Port $Port -Method "PUT" -Database $Database -Document $Document -Data $Data -Authorization $Authorization -Ssl:$Ssl
}

function Measure-CouchDBStatistics () {
    <#
    .SYNOPSIS
    Measure server statistics.
    .DESCRIPTION
    Measure CouchDB server statistics.
    .NOTES
    CouchDB API:
        GET /_node/{node-name}/_system
        GET /_node/{node-name}/_stats
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER System
    Return system statistics.
    .PARAMETER Authorization
    The CouchDB authorization form; user and password.
    Authorization format like this: user:password
    ATTENTION: if the password is not specified, it will be prompted.
    .PARAMETER Ssl
    Set ssl connection on CouchDB server.
    This modify protocol to https and port to 6984.
    .EXAMPLE
    Measure-CouchDBStatistics
    This example measure statistics of CouchDB Server.
    .EXAMPLE
    Measure-CouchDBStatistics -System
    This example measure statistics of CouchDB Server.
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/server.html
    #>
    [CmdletBinding()]
    param(
        [Parameter(ValueFromPipeline = $true)]
        [string] $Server = 'localhost',
        [int] $Port,
        [switch] $System,
        [string] $Authorization,
        [switch] $Ssl
    )
    if ($System.IsPresent) {
        $Database = "_node/couchdb@$Server/_system"
    } else {
        $Database = "_node/couchdb@$Server/_stats"
    }
    Send-CouchDBRequest -Server $Server -Port $Port -Method "GET" -Database $Database -Document $Document -Authorization $Authorization -Ssl:$Ssl
}

function Clear-CouchDBView () {
    <#
    .SYNOPSIS
    Clean view indexes.
    .DESCRIPTION
    Removes view index files that are no longer required by CouchDB as a result of changed views within design documents.
    .NOTES
    CouchDB API:
        GET /{db}/_view_cleanup
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
    Clear-CouchDBView -Database test -Authorization "admin:password"
    This example removes index files on database "test".
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/databases.html#clear-view
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
    $Document = "_view_cleanup"
    Send-CouchDBRequest -Server $Server -Port $Port -Method "POST" -Database $Database -Document $Document -Authorization $Authorization -Ssl:$Ssl
}

function Clear-CouchDBDocuments () {
    <#
    .SYNOPSIS
    A database purge permanently document.
    .DESCRIPTION
    A database purge permanently removes the references to deleted documents from the database.
    .NOTES
    CouchDB API:
        POST /{db}/_purge
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER Database
    The CouchDB database.
    .PARAMETER Document
    The CouchDB document.
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
    Clear-CouchDBDocuments -Database test -Document "Hitchhikers" -Authorization "admin:password"
    This example purge "Hitchhikers" document on database "test".
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/documents.html#purge-document
    #>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory = $true)]
        [string] $Database,
        [Parameter(mandatory = $true, ValueFromPipeline = $true)]
        [array] $Document,
        [string] $Authorization,
        [switch] $Force,
        [switch] $Ssl
    )
    $Data = New-Object -TypeName Hashtable
    $Document | ForEach-Object { 
        $docid = Get-CouchDBDocument -Server $Server -Port $Port -Database $Database -Document $_ -Authorization $Authorization -Ssl:$Ssl 
        $Data.Add($docid._id, @($docid._rev))
    }
    $Data = $Data | ConvertTo-Json -Depth 10
    $Database = $Database + '/_purge'
    if ($Force -or $PSCmdlet.ShouldContinue("Do you wish to purge permanently document $Document ?", "Purge permanently document $Document")) {
        Send-CouchDBRequest -Server $Server -Port $Port -Method "POST" -Database $Database -Data $Data -Authorization $Authorization -Ssl:$Ssl
    }
}

function Add-CouchDBNode () {
    <#
    .SYNOPSIS
    Add server nodes.
    .DESCRIPTION
    Add server nodes on CouchDB cluster.
    .NOTES
    CouchDB API:
        POST /_cluster_setup
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER BindPort
    The CouchDB node bind port. Default is 5984.
    .PARAMETER BindAddress
    The CouchDB node bind address, ip or hostname.
    .PARAMETER Authorization
    The CouchDB authorization form; user and password.
    Authorization format like this: user:password
    ATTENTION: if the password is not specified, it will be prompted.
    .PARAMETER Ssl
    Set ssl connection on CouchDB server.
    This modify protocol to https and port to 6984.
    .EXAMPLE
    Add-CouchDBNode -BindAddress couchdb1 -Authorization "admin:password"
    This example add node couchdb1:5984 in a cluster.
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/config.html#nodes
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [int] $BindPort = 5984,
        [Parameter(mandatory = $true, ValueFromPipeline = $true)]
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
        `"port`": `"$BindPort`",
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
    Request compaction of the specified database. Compaction compresses the disk database file.
    .NOTES
    CouchDB API:
        POST /{db}/_compact
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER Database
    The CouchDB database.
    .PARAMETER Document
    The CouchDB document.
    .PARAMETER Authorization
    The CouchDB authorization form; user and password.
    Authorization format like this: user:password
    ATTENTION: if the password is not specified, it will be prompted.
    .PARAMETER Ssl
    Set ssl connection on CouchDB server.
    This modify protocol to https and port to 6984.
    .EXAMPLE
    Compress-CouchDBDatabase -Database test -Authorization "admin:password"
    This example compact database "test".
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/documents.html#get-an-attachment
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
    $Document = '_compact'
    $Data = '{}'
    Send-CouchDBRequest -Server $Server -Port $Port -Method "POST" -Database $Database -Document $Document -Data $Data -Authorization $Authorization -Ssl:$Ssl
}

function Compress-CouchDBDesignDocument () {
    <#
    .SYNOPSIS
    Compress design document.
    .DESCRIPTION
    Compacts the view indexes associated with the specified design document. 
    It may be that compacting a large view can return more storage than compacting the actual db.
    .NOTES
    CouchDB API:
        POST /{db}/_compact/{ddoc}
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER Database
    The CouchDB database.
    .PARAMETER DesignDoc
    The CouchDB design document.
    .PARAMETER Authorization
    The CouchDB authorization form; user and password.
    Authorization format like this: user:password
    ATTENTION: if the password is not specified, it will be prompted.
    .PARAMETER Ssl
    Set ssl connection on CouchDB server.
    This modify protocol to https and port to 6984.
    .EXAMPLE
    Compress-CouchDBDesignDocument -Database test -DesignDoc space -Authorization "admin:password"
    This example compact design document "space" on database "test".
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/ddoc.html#compress-design-document
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory = $true)]
        [string] $Database,
        [Parameter(mandatory = $true, ValueFromPipeline = $true)]
        [string] $DesignDoc,
        [string] $Authorization,
        [switch] $Ssl
    )
    $Document = "_compact/$DesignDoc"
    $Data = '{}'
    Send-CouchDBRequest -Server $Server -Port $Port -Method "POST" -Database $Database -Document $Document -Data $Data -Authorization $Authorization -Ssl:$Ssl
}

function Set-CouchDBDatabasePurgedLimit () {
    <#
    .SYNOPSIS
    Set a database purged documents limit.
    .DESCRIPTION
    Set the current purged_infos_limit (purged documents limit).
    .NOTES
    CouchDB API:
        PUT /{db}/_purged_infos_limit
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER Database
    The CouchDB database.
    .PARAMETER Limit
    The CouchDB purge limit documents number.
    .PARAMETER Authorization
    The CouchDB authorization form; user and password.
    Authorization format like this: user:password
    ATTENTION: if the password is not specified, it will be prompted.
    .PARAMETER Ssl
    Set ssl connection on CouchDB server.
    This modify protocol to https and port to 6984.
    .EXAMPLE
    Set-CouchDBDatabasePurgedLimit -Database test -Limit 1500 -Authorization "admin:password"
    This example set purged documents limit to 1500 on database "test".
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/databases.html#set-purged-info-limit
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory = $true, ValueFromPipeline = $true)]
        [string] $Database,
        [Parameter(mandatory = $true)]
        [int] $Limit,
        [string] $Authorization,
        [switch] $Ssl
    )
    $Database = $Database + "/_purged_infos_limit"
    $Data = "$Limit"
    Send-CouchDBRequest -Server $Server -Port $Port -Method "PUT" -Database $Database -Data $Data -Authorization $Authorization -Ssl:$Ssl
}

function Set-CouchDBDocument () {
    <#
    .SYNOPSIS
    Modify a document.
    .DESCRIPTION
    Creates a new revision of the existing document.
    .NOTES
    CouchDB API:
        PUT /{db}/{docid}
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER Database
    The CouchDB database.
    .PARAMETER Document
    The CouchDB document.
    .PARAMETER Revision
    The CouchDB revision document.
    .PARAMETER Data
    The data in Json format or hastable.
    .PARAMETER Replace
    Overwrite data.
    .PARAMETER BatchMode
    Write documents to the database at a higher rate by using the batch option.
    Documents in the batch may be manually flushed by using the Write-CouchDBFullCommit cmdlet.
    .PARAMETER NoConflict
    No prevents insertion of a conflicting document.
    .PARAMETER Authorization
    The CouchDB authorization form; user and password.
    Authorization format like this: user:password
    ATTENTION: if the password is not specified, it will be prompted.
    .PARAMETER Ssl
    Set ssl connection on CouchDB server.
    This modify protocol to https and port to 6984.
    .EXAMPLE
    $data = @{"answer"=42; "ask"="Ultimate Question of Life, the Universe and Everything"}
    Set-CouchDBDocument -Database test -Document "Hitchhikers" -Revision 1-2c903913030efb4d711db085b1f44107 -Data $data -Authorization "admin:password"
    The example modify document "Hitchhikers" with data $data; if the element of $data exists, overwrite, else adding new element.
    .EXAMPLE
    $data = @{"answer"=42; "ask"="Ultimate Question of Life, the Universe and Everything"}
    Set-CouchDBDocument -Database test -Document "Hitchhikers" -Revision 1-2c903913030efb4d711db085b1f44107 -Data $data -Replace -Authorization "admin:password"
    The example overwrite document "Hitchhikers" with data $data.
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/documents.html#modify-a-document
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory = $true)]
        [string] $Database,
        [Parameter(mandatory = $true, ValueFromPipeline = $true)]
        [string] $Document,
        [Parameter(mandatory = $true)]
        [string] $Revision,
        $Data,
        [switch] $Replace,
        [switch] $BatchMode,
        [switch] $NoConflict,
        [string] $Authorization,
        [switch] $Ssl
    )
    if ($Data -is [hashtable]) {
        # Hashtable Data
        $Json = $Data | ConvertFrom-Json
        $Data = @{ }
        $Json.psobject.properties | ForEach-Object {
            $Data.Add($_.Name, $_.Value)
        }
    }
    if (-not($Replace.IsPresent)) {
        $OldDoc = Get-CouchDBDocument -Server $Server -Port $Port -Database $Database -Document $Document -Revision $Revision -Authorization $Authorization -Ssl:$Ssl -ErrorAction SilentlyContinue
        if ($null -ne $OldDoc.psobject.properties) {
            $OldDoc.psobject.properties | ForEach-Object {
                if (-not($Data)) {
                    $Data.Add($_.Name, $_.Value)
                } else {
                    $Data.$($_.Name) = $_.Value
                }
            }
        } else {
            throw "Document $Document not found!"
        }
    }
    # Check BatchMode
    if ($BatchMode.IsPresent) { 
        $Document += "?batch=ok" 
        # Check NoConflict
    } elseif ($NoConflict.IsPresent -and $Revision) { 
        $Document += "?rev=$Revision&new_edits=false"
        $Revision = $null
    }
    $Data = $Data | ConvertTo-Json -Depth 99
    Send-CouchDBRequest -Server $Server -Port $Port -Method "PUT" -Database $Database -Document $Document -Revision $Revision -Data $Data -Authorization $Authorization -Ssl:$Ssl
}

function Set-CouchDBBulkDocument () {
    <#
    .SYNOPSIS
    Create a bulk document.
    .DESCRIPTION
    This method can be called to allows you to create and update multiple documents at the same time (only id and revision).
    .NOTES
    CouchDB API:
        POST /{db}/_bulk_docs
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER Database
    The CouchDB database.
    .PARAMETER Document
    Array of the CouchDB documents.
    .PARAMETER Revision
    Array of the CouchDB revision documents.
    .PARAMETER IsDeleted
    Select only deleted document.
    .PARAMETER Authorization
    The CouchDB authorization form; user and password.
    Authorization format like this: user:password
    ATTENTION: if the password is not specified, it will be prompted.
    .PARAMETER Ssl
    Set ssl connection on CouchDB server.
    This modify protocol to https and port to 6984.
    .EXAMPLE
    Set-CouchDBBulkDocument -Database test -Document "Hitchhikers","Hitchhikers_new","Hitchhikers Guide" -Revision 4-7051cbe5c8faecd085a3fa619e6e6337,$null,3-399796e5ce019e04311637e8a8a0f402 -Authorization "admin:password"
    This example modify list of three document: "Hitchhikers","Hitchhikers_new","Hitchhikers Guide" on a database "test".
    .EXAMPLE
    Set-CouchDBBulkDocument -Database test -Document "Hitchhikers","Hitchhikers_new","Hitchhikers Guide" -Authorization "admin:password"
    This example create list of three document: "Hitchhikers","Hitchhikers_new","Hitchhikers Guide" on a database "test".
    .EXAMPLE
    Set-CouchDBBulkDocument -Database test -Document "Hitchhikers","Hitchhikers_new","Hitchhikers Guide" -Revision 4-7051cbe5c8faecd085a3fa619e6e6337,$null,3-399796e5ce019e04311637e8a8a0f402 -IsDeleted -Authorization "admin:password"
    This example modify list of three deleted document: "Hitchhikers","Hitchhikers_new","Hitchhikers Guide" on a database "test".
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/documents.html#create-documents-in-bulk
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory = $true)]
        [string] $Database,
        [Parameter(mandatory = $true, ValueFromPipeline = $true)]
        [array] $Document,
        [array] $Revision,
        [switch] $IsDeleted,
        [string] $Authorization,
        [switch] $Ssl
    )
    $Data = '{"docs": ['
    for ($counter = 0; $counter -lt $Document.Count; $counter++) {
        $Data += "{`"_id`": `"$($Document[$counter])`""
        if ( $Revision.Count -ne 0 -and $Revision[$counter]) {
            $Data += ",`"_rev`": `"$($Revision[$counter])`""
        }
        if ($IsDeleted.IsPresent) {
            $Data += ",`"_deleted`": `"true`""
        }
        $Data += "}"
        if ($counter -lt ($Document.Count - 1)) {
            $Data += ','
        }
    }
    $Data += ']}'
    [string] $Document = "_bulk_docs"
    Send-CouchDBRequest -Server $Server -Port $Port -Method "POST" -Database $Database -Document $Document -Data $Data -Authorization $Authorization -Ssl:$Ssl
}

function Set-CouchDBDesignDocument () {
    <#
    .SYNOPSIS
    Modify a design document.
    .DESCRIPTION
    Creates a new revision of the existing design document.
    .NOTES
    CouchDB API:
        PUT /{db}/_design/{ddoc}
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER Database
    The CouchDB database.
    .PARAMETER Document
    The CouchDB document.
    .PARAMETER ViewName
    The name of function view in the design document.
    .PARAMETER ViewKey
    The key of function view in the design document.
    .PARAMETER ViewValue
    The value of key of function view in the design document.
    .PARAMETER GetDoc
    Return all element of doc of function view in the design document.
    .PARAMETER ListName
    The name of function list in the design document.
    .PARAMETER ShowName
    The name of function show in the design document.
    .PARAMETER ShowKey
    The key of function show in the design document.
    .PARAMETER ShowValue
    The value of key of function show in the design document.
    .PARAMETER ValidationRequirements
    Array of key than required validation.
    .PARAMETER ValidationAuthor
    Enable validation author.
    .PARAMETER Data
    The data in Json format or hastable.
    .PARAMETER Replace
    Overwrite design document.
    .PARAMETER Authorization
    The CouchDB authorization form; user and password.
    Authorization format like this: user:password
    ATTENTION: if the password is not specified, it will be prompted.
    .PARAMETER Ssl
    Set ssl connection on CouchDB server.
    This modify protocol to https and port to 6984.
    .EXAMPLE
    Set-CouchDBDesignDocument -Database test -Document "space" -ViewName "planet_view" -Authorization "admin:password"
    The example modify "space" design document with add or modify "planet_view" view.
    .EXAMPLE
    $data = '{"views":{"data_test":{"map":"function(doc) {emit(doc._id, doc._rev)}"}}}'
    Set-CouchDBDesignDocument -Database test -Document "space" -Data $data -Authorization "admin:password"
    The example modify "space" design document with custom data.
    .EXAMPLE
    Set-CouchDBDesignDocument -Database test -Document space -ShowName planet -ShowKey planet -ShowValue "Heart" -Authorization "admin:password"
    The example modify "space" design document with add or modify "planet" show, where "planet" key equal "Heart".
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/ddoc.html
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
        [Parameter(mandatory = $true)]
        [string] $Database,
        [Parameter(ParameterSetName = "View")]
        [Parameter(ParameterSetName = "List")]
        [Parameter(ParameterSetName = "Show")]
        [Parameter(ParameterSetName = "Validation")]
        [Parameter(ParameterSetName = "CustomData")]
        [Parameter(mandatory = $true, ValueFromPipeline = $true)]
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
        if ($Data -is [hashtable]) {
            if (-not($Data.ContainsKey('language'))) { $Data.Add('language', 'javascript') }
            if (-not($Data.ContainsKey('views'))) {
                $Data.Add('views', @{ }) 
            }
            if (-not($Data.ContainsKey('shows'))) {
                $Data.Add('shows', @{ }) 
            }
            if (-not($Data.ContainsKey('lists'))) {
                $Data.Add('lists', @{ }) 
            }
            if (-not($Data.ContainsKey('validate_doc_update'))) { $Data.Add('validate_doc_update', "") }
        } elseif ($Data -is [string]) {
            $Data = $Data
        } else {
            $Json = $Data | ConvertFrom-Json
            $Data = @{ }
            if (-not($Json.language.psobject.properties)) {
                $Data.language = "javascript"
            }
            if (-not($Json.views.psobject.properties)) {
                $Data.views = @{ }
            } else {
                $Data.views = @{ }
                $Json.views.psobject.properties | ForEach-Object {
                    $Data.views.Add($_.Name, $_.Value)
                }
            }
            if (-not($Json.shows.psobject.properties)) {
                $Data.shows = @{ }
            } else {
                $Data.shows = @{ }
                $Json.shows.psobject.properties | ForEach-Object {
                    $Data.shows.Add($_.Name, $_.Value)
                }
            }
            if (-not($Json.lists.psobject.properties)) {
                $Data.lists = @{ }
            } else {
                $Data.lists = @{ }
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
        if (($null -ne $OldDesignDoc.validate_doc_update) -and ($null -ne $DesignDoc.validate_doc_update)) {
            $DesignDoc.validate_doc_update = $OldDesignDoc.validate_doc_update
        } else {
            if ($DesignDoc.validate_doc_update) {
                $DesignDoc.Remove('validate_doc_update')
            }
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

function Set-CouchDBDesignDocumentAttachment () {
    <#
    .SYNOPSIS
    Modify attachment of a design document.
    .DESCRIPTION
    Uploads the supplied content as an attachment to the specified design document.
    .NOTES
    CouchDB API:
        PUT /{db}/_design/{ddoc}/{attname}
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER Database
    The CouchDB database.
    .PARAMETER Document
    The CouchDB document.
    .PARAMETER Revision
    The CouchDB revision document.
    .PARAMETER Attachment
    The CouchDB attachment document.
    .PARAMETER Authorization
    The CouchDB authorization form; user and password.
    Authorization format like this: user:password
    ATTENTION: if the password is not specified, it will be prompted.
    .PARAMETER Ssl
    Set ssl connection on CouchDB server.
    This modify protocol to https and port to 6984.
    .EXAMPLE
    Set-CouchDBAttachment -Database test -Document "space" -Revision "2-4705a219cdcca7c72aac4f623f5c46a8" -Attachment test.txt
    This example modify attachment "test.txt" on "space" design document from database "test".
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/ddoc.html#modify-design-document-attachment
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory = $true)]
        [string] $Database,
        [Parameter(mandatory = $true, ValueFromPipeline = $true)]
        [string] $Document,
        [Parameter(mandatory = $true)]
        [string] $Revision,
        [Parameter(mandatory = $true)]
        [string] $Attachment,
        [string] $Authorization,
        [switch] $Ssl
    )
    $Document = "_design/$Document"
    Send-CouchDBRequest -Server $Server -Port $Port -Method "PUT" -Database $Database -Document $Document -Revision $Revision -Attachment $Attachment -Authorization $Authorization -Ssl:$Ssl
}

function Set-CouchDBAttachment () {
    <#
    .SYNOPSIS
    Modify attachment.
    .DESCRIPTION
    Uploads the supplied content as an attachment to the specified document.
    .NOTES
    CouchDB API:
        PUT /{db}/{ddoc}/{attname}
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER Database
    The CouchDB database.
    .PARAMETER Document
    The CouchDB document.
    .PARAMETER Revision
    The CouchDB revision document.
    .PARAMETER Attachment
    The CouchDB attachment document.
    .PARAMETER Authorization
    The CouchDB authorization form; user and password.
    Authorization format like this: user:password
    ATTENTION: if the password is not specified, it will be prompted.
    .PARAMETER Ssl
    Set ssl connection on CouchDB server.
    This modify protocol to https and port to 6984.
    .EXAMPLE
    Set-CouchDBAttachment -Database test -Document "Hitchhikers" -Revision "2-4705a219cdcca7c72aac4f623f5c46a8" -Attachment test.txt
    This example modify attachment "test.txt" on "Hitchhikers" document from database "test".
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/documents.html#modify-an-attachment
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory = $true)]
        [string] $Database,
        [Parameter(mandatory = $true, ValueFromPipeline = $true)]
        [string] $Document,
        [Parameter(mandatory = $true)]
        [string] $Revision,
        [Parameter(mandatory = $true)]
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

function Set-CouchDBConfiguration () {
    <#
    .SYNOPSIS
    Set element configuration.
    .DESCRIPTION
    Set element configuration of CouchDB server.
    .NOTES
    CouchDB API:
        PUT /_node/{node-name}/_config/{section}/{key}
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER Node
    The CouchDB node of cluster. Default is couchdb@localhost.
    .PARAMETER Element
    The element of configuration.
    .PARAMETER Key
    The key of configuration.
    .PARAMETER Value
    The value of key of configuration.
    .PARAMETER Authorization
    The CouchDB authorization form; user and password.
    Authorization format like this: user:password
    ATTENTION: if the password is not specified, it will be prompted.
    .PARAMETER Ssl
    Set ssl connection on CouchDB server.
    This modify protocol to https and port to 6984.
    .EXAMPLE
    Set-CouchDBConfiguration -Element ssl -Key port -Value 443 -Authorization "admin:password"
    This example set the localhost ssl port on 443 in configuration of CouchDB server.
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/config.html#modify-configuration
    #>
    [CmdletBinding()]
    param(
        [Parameter(ValueFromPipeline = $true)]
        [string] $Server,
        [int] $Port,
        [string] $Node = $(if ((Get-CouchDBNode -Server $Server -Port $Port -Authorization $Authorization -Ssl:$Ssl).all_nodes -contains "couchdb@localhost") { "couchdb@localhost" } else { "couchdb@127.0.0.1" }),
        [Parameter(mandatory = $true)]
        [string] $Element,
        [Parameter(mandatory = $true)]
        [string] $Key,
        [Parameter(mandatory = $true)]
        [string] $Value,
        [string] $Authorization,
        [switch] $Ssl
    )
    $Database = "_node"
    $Document = "$Node/_config"
    if ((Get-CouchDBConfiguration -Server $Server -Port $Port -Node $Node -Authorization $Authorization -Ssl:$Ssl).$Element) {
        $Document += "/$Element/$Key"
    } else {
        throw "Element $Element not exist!"
    }
    $Data = $Value | ConvertTo-Json
    Send-CouchDBRequest -Server $Server -Port $Port -Method "PUT" -Database $Database -Document $Document -Data $Data -Authorization $Authorization -Ssl:$Ssl
}

function Set-CouchDBReplication () {
    <#
    .SYNOPSIS
    Modify database replication.
    .DESCRIPTION
    The default replicator database is _replicator. Additional replicator databases can be created. 
    To be recognized as such by the system, their database names should end with /_replicator.
    .NOTES
    CouchDB API:
        PUT /_replicator/{docid}
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER Document
    The CouchDB document.
    .PARAMETER Continuous
    The Continuous mode of replication.
    .PARAMETER Authorization
    The CouchDB authorization form; user and password.
    Authorization format like this: user:password
    ATTENTION: if the password is not specified, it will be prompted.
    .PARAMETER Ssl
    Set ssl connection on CouchDB server.
    This modify protocol to https and port to 6984.
    .EXAMPLE
    Get-CouchDBReplication -Authorization "admin:password"
    This example get all replica documents.
    .EXAMPLE
    Set-CouchDBReplication -Document localhost-test_localhost-test_dump -Revision "2-4705a219cdcca7c72aac4f623f5c46a8" -Continuous -Authorization "admin:password"
    This example set replication document "localhost-test_localhost-test_dump" with Continuous replica mode.
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/server.html#modify-replica
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory = $true, ValueFromPipeline = $true)]
        [string] $Document,
        [Parameter(mandatory = $true)]
        [string] $Revision,
        [switch] $Continuous,
        [string] $Authorization,
        [switch] $Ssl
    )
    $Database = "_replicator"
    if (-not(Test-CouchDBDatabase -Database $Database -Authorization $Authorization -Ssl:$Ssl -ErrorAction SilentlyContinue)) {
        throw "Database _replicator not exists."
    }
    if ($Continuous.IsPresent) {
        $Continuous_value = $true
    } else {
        $Continuous_value = $false
    }
    $Data = Get-CouchDBReplication -Server $Server -Port $Port -Database $Database -Document $Document -Authorization $Authorization -Ssl:$Ssl
    $Data.continuous = $Continuous_value
    $Data = $Data | ConvertTo-Json
    Send-CouchDBRequest -Server $Server -Port $Port -Method "PUT" -Database $Database -Document $Document -Revision $Revision -Data $Data -Authorization $Authorization -Ssl:$Ssl
}

function Set-CouchDBRevisionLimit () {
    <#
    .SYNOPSIS
    Set revision limit.
    .DESCRIPTION
    Set the current revs_limit (revision limit) setting.
    .NOTES
    CouchDB API:
        PUT /{db}/_revs_limit
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER Database
    The CouchDB database.
    .PARAMETER Limit
    The CouchDB revision limit. Default is 1000.
    .PARAMETER Authorization
    The CouchDB authorization form; user and password.
    Authorization format like this: user:password
    ATTENTION: if the password is not specified, it will be prompted.
    .PARAMETER Ssl
    Set ssl connection on CouchDB server.
    This modify protocol to https and port to 6984.
    .EXAMPLE
    Set-CouchDBRevisionLimit -Database test -Limit 100 -Authorization "admin:password"
    This example set revision limit number to 1000 on database "test".
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/databases.html#set-revision-limit
    #>
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory = $true, ValueFromPipeline = $true)]
        [string] $Database,
        [int] $Limit = 1000,
        [string] $Authorization,
        [switch] $Ssl
    )
    $Database = $Database + '/_revs_limit'
    $Data = $Limit
    Send-CouchDBRequest -Server $Server -Port $Port -Method "PUT" -Database $Database -Data $Data -Authorization $Authorization -Ssl:$Ssl
}

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
    .PARAMETER AdminUser
    The CouchDB user_id of admin user.
    .PARAMETER AdminRoles
    The CouchDB user_roles of admin user.
    .PARAMETER MemberUser
    The CouchDB user_id of standard user.
    .PARAMETER MemberRoles
    The CouchDB user_roles of standard user.
    .PARAMETER Authorization
    The CouchDB authorization form; user and password.
    Authorization format like this: user:password
    ATTENTION: if the password is not specified, it will be prompted.
    .PARAMETER Ssl
    Set ssl connection on CouchDB server.
    This modify protocol to https and port to 6984.
    .EXAMPLE
    Grant-CouchDBDatabasePermission -Database test -MemberUser member_user -Authorization "admin:password"
    This example grant member_user user on "test" database on CouchDB server.
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/permission.html#limit-read-access
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory = $true, ValueFromPipeline = $true)]
        [string] $Database,
        [array]$AdminUser,
        [array]$AdminRoles,
        [array]$MemberUser,
        [array]$MemberRoles,
        [string] $Authorization,
        [switch] $Ssl
    )
    $Document = '_security'
    # Check if admin user exists
    foreach ($User in $AdminUser) {
        if (-not((Get-CouchDBUser -Userid $User -Authorization $Authorization -Ssl:$Ssl -ErrorAction SilentlyContinue).name -eq $User)) {
            throw "Admin user $User not exists!"
        }
    }
    # Check if reader user exists
    foreach ($User in $MemberUser) {
        if (-not((Get-CouchDBUser -Userid $User -Authorization $Authorization -Ssl:$Ssl -ErrorAction SilentlyContinue).name -eq $User)) {
            throw "Member user $User not exists!"
        }
    }
    # Create permission structure
    $permission = [PSCustomObject] @{
        admins  = @{ names = @(); roles = @() }
        members = @{ names = @(); roles = @() }
    }
    # Check if AdminUser has been specified
    if ($AdminUser) {
        $permission.admins.names += $AdminUser
    }
    # Check if AdminRoles has been specified
    if ($AdminRoles) {
        $permission.admins.roles += $AdminRoles
    }
    # Check if MemberUser has been specified
    if ($MemberUser) {
        $permission.members.names += $MemberUser
    }
    # Check if MemberRoles has been specified
    if ($MemberRoles) {
        $permission.members.roles += $MemberRoles
    }
    $Data = $permission | ConvertTo-Json -Depth 5
    $Document = "_security"
    Send-CouchDBRequest -Server $Server -Port $Port -Method "PUT" -Database $Database -Document $Document -Data $Data -Authorization $Authorization -Ssl:$Ssl
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
    [CmdletBinding(SupportsShouldProcess = $true)]
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

function Request-CouchDBReplication () {
    <#
    .SYNOPSIS
    Request a replication operation.
    .DESCRIPTION
    Request, configure, or stop, a replication operation.
    .NOTES
    CouchDB API:
        POST /_replicate
    .PARAMETER SourceServer
    The source CouchDB server name. Default is localhost.
    .PARAMETER TargetServer
    The destination CouchDB server name. Default is localhost.
    .PARAMETER SourcePort
    The source CouchDB server port. Default is 5984.
    .PARAMETER TargetPort
    The destination CouchDB server port. Default is 5984.
    .PARAMETER SourceDatabase
    The source CouchDB database.
    .PARAMETER TargetDatabase
    The destination CouchDB database.
    .PARAMETER Proxy
    The proxy server.
    .PARAMETER Document
    Array of CouchDB document.
    .PARAMETER Filter
    The filter function.
    .PARAMETER Continuous
    The Continuous mode of replica.
    .PARAMETER Cancel
    Cancel replica request.
    .PARAMETER CreateTargetDatabase
    Create a target database if not exists.
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
    Request-CouchDBReplication -SourceDatabase test -TargetDatabase test_dump -Documents "Hitchhikers","Hitchhikers_Guide" -Authorization "admin:password"
    This example request replication of documents "Hitchhikers","Hitchhikers_Guide" from database "test" to database "test_dump".
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/server.html#replication-request
    #>
    [CmdletBinding()]
    param(
        [string] $SourceServer = 'localhost',
        [string] $TargetServer = 'localhost',
        [int] $SourcePort,
        [int] $TargetPort,
        [Parameter(mandatory = $true)]
        [string] $SourceDatabase,
        [Parameter(mandatory = $true)]
        [string] $TargetDatabase,
        [string] $Proxy,
        [array] $Documents,
        [string] $Filter,
        [switch] $Continuous,
        [switch] $Cancel,
        [switch] $CreateTargetDatabase,
        [string] $Authorization,
        [switch] $Ssl
    )
    $Database = "_replicate"
    $Json = @{ }
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
    # Source
    if ($Authorization) {
        $Json.Add("source", @{ })
        $Json.source.Add("url", $Source)
        $Json.source.Add("headers", @{ })
        $base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(($Authorization)))
        $Json.source.headers.Add("Authorization", ("Basic {0}" -f $base64AuthInfo))
    } else {
        $Json.Add("source", $Source)
    }
    # Target
    if ($Authorization) {
        $Json.Add("target", @{ })
        $Json.target.Add("url", $Target)
        $Json.target.Add("headers", @{ })
        $base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(($Authorization)))
        $Json.target.headers.Add("Authorization", ("Basic {0}" -f $base64AuthInfo))
    } else {
        $Json.Add("target", $Target)
    }
    # Check if Continuous is true
    if ($Continuous.IsPresent) {
        $Json.Add("continuous", $true)
    }
    # Check if Cancel is true
    if ($Cancel.IsPresent) {
        $Json.Add("cancel", $true)
    }
    # Check if CreateTargetDatabase is true
    if ($CreateTargetDatabase.IsPresent) {
        $Json.Add("create_target", $true)
    }
    # Check filter
    if ($Filter) {
        $Json.Add("filter", $Filter)
    }
    # Check proxy
    if ($Proxy) {
        $Json.Add("proxy", $Proxy)
    }
    # Check doc_ids
    if ($Documents.Count -ne 0) {
        $Json.Add("doc_ids", $Documents)
    }
    # Convert data to json
    $Data = $Json | ConvertTo-Json -Depth 4
    Send-CouchDBRequest -Server $Server -Port $Port -Method "POST" -Database $Database -Data $Data -Authorization $Authorization -Ssl:$Ssl
}

function New-CouchDBDatabase () {
    <#
    .SYNOPSIS
    Create a new database.
    .DESCRIPTION
    Creates a new database. The database name must be composed by following next rules:
    Name must begin with a lowercase letter (a-z)
    Lowercase characters (a-z)
    Digits (0-9)
    Any of the characters _, $, (, ), +, -, and /.
    If you're familiar with Regular Expressions, the rules above could be written as ^[a-z][a-z0-9_$()+/-]*$.
    .NOTES
    CouchDB API:
        PUT /{db}
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
    New-CouchDBDatabase -Database test -Authorization "admin:password"
    This example create a database "test".
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/databases.html#create-a-database
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
    Send-CouchDBRequest -Server $Server -Port $Port -Method "PUT" -Database $Database -Authorization $Authorization -Ssl:$Ssl
}

function New-CouchDBDocument () {
    <#
    .SYNOPSIS
    Create a new document.
    .DESCRIPTION
    Creates a new document in the specified database, using the supplied JSON document structure or [hashtable] object.
    If the JSON structure or [hashtable] object includes the _id field, then the document will be created with the specified document ID.
    If the _id field is not specified, a new unique ID will be generated, following whatever UUID algorithm is configured for that server (Get-Help New-CouchDBUuids).
    .NOTES
    CouchDB API:
        PUT /{db}/{docid}
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER Database
    The CouchDB database.
    .PARAMETER Document
    The CouchDB document.
    .PARAMETER Data
    The data in Json format or hastable.
    .PARAMETER BatchMode
    Write documents to the database at a higher rate by using the batch option.
    Documents in the batch may be manually flushed by using the Write-CouchDBFullCommit cmdlet.
    .PARAMETER Authorization
    The CouchDB authorization form; user and password.
    Authorization format like this: user:password
    ATTENTION: if the password is not specified, it will be prompted.
    .PARAMETER Ssl
    Set ssl connection on CouchDB server.
    This modify protocol to https and port to 6984.
    .EXAMPLE
    $data = @{"answer"=42; "ask"="Ultimate Question of Life, the Universe and Everything"}
    New-CouchDBDocument -Database test -Document "Hitchhikers"-Data $data -Authorization "admin:password"
    The example modify document "Hitchhikers" with data $data; if the element of $data exists, overwrite, else adding new element.
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/documents.html#create-a-document
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory = $true)]
        [string] $Database,
        [Parameter(mandatory = $true, ValueFromPipeline = $true)]
        [string] $Document,
        [Parameter(mandatory = $true)]
        $Data,
        [switch] $BatchMode,
        [string] $Authorization,
        [switch] $Ssl
    )
    if ($Data -is [hashtable]) {
        # Json Data
        $Data = $Data | ConvertTo-Json -Depth 99
    }
    # Check BatchMode
    if ($BatchMode.IsPresent) { $Document += "?batch=ok" }
    Send-CouchDBRequest -Server $Server -Port $Port -Method "PUT" -Database $Database -Document $Document -Data $Data -Authorization $Authorization -Ssl:$Ssl
}

function New-CouchDBDesignDocument () {
    <#
    .SYNOPSIS
    Create a new design document.
    .DESCRIPTION
    Create a new CouchDB design document.
    .NOTES
    CouchDB API:
        PUT /{db}/_design/{ddoc}
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER Database
    The CouchDB database.
    .PARAMETER Document
    The CouchDB document.
    .PARAMETER ViewName
    The name of function view in the design document.
    .PARAMETER ViewKey
    The key of function view in the design document.
    .PARAMETER ViewValue
    The value of key of function view in the design document.
    .PARAMETER GetDoc
    Return all element of doc of function view in the design document.
    .PARAMETER ListName
    The name of function list in the design document.
    .PARAMETER ShowName
    The name of function show in the design document.
    .PARAMETER ShowKey
    The key of function show in the design document.
    .PARAMETER ShowValue
    The value of key of function show in the design document.
    .PARAMETER ValidationRequirements
    Array of key than required validation.
    .PARAMETER ValidationAuthor
    Enable validation author.
    .PARAMETER Data
    The data in Json format or hastable.
    .PARAMETER Authorization
    The CouchDB authorization form; user and password.
    Authorization format like this: user:password
    ATTENTION: if the password is not specified, it will be prompted.
    .PARAMETER Ssl
    Set ssl connection on CouchDB server.
    This modify protocol to https and port to 6984.
    .EXAMPLE
    New-CouchDBDesignDocument -Database test -Document "space" -ViewName "planet_view" -Authorization "admin:password"
    The example create "space" design document with add or modify "planet_view" view.
    .EXAMPLE
    $data = '{"views":{"data_test":{"map":"function(doc) {emit(doc._id, doc._rev)}"}}}'
    New-CouchDBDesignDocument -Database test -Document "space" -Data $data -Authorization "admin:password"
    The example create "space" design document with custom data.
    .EXAMPLE
    New-CouchDBDesignDocument -Database test -Document space -ShowName planet -ShowKey planet -ShowValue "Heart" -Authorization "admin:password"
    The example create "space" design document with add or modify "planet" show, where "planet" key equal "Heart".
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/ddoc.html#creates-a-design-document
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
        [Parameter(mandatory = $true)]
        [string] $Database,
        [Parameter(ParameterSetName = "View")]
        [Parameter(ParameterSetName = "List")]
        [Parameter(ParameterSetName = "Show")]
        [Parameter(ParameterSetName = "Validation")]
        [Parameter(ParameterSetName = "CustomData")]
        [Parameter(mandatory = $true, ValueFromPipeline = $true)]
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
        if ($Data -is [hashtable]) {
            $Data = $Data | ConvertTo-Json -Depth 99
        }
    }
    Send-CouchDBRequest -Server $Server -Port $Port -Method "PUT" -Database $Database -Document $Document -Data $Data -Authorization $Authorization -Ssl:$Ssl
}

function New-CouchDBDesignDocumentAttachment () {
    <#
    .SYNOPSIS
    Create a new attachment in a design document.
    .DESCRIPTION
    Create a new CouchDB attachment in a design document.
    .NOTES
    CouchDB API:
        PUT /{db}/_design/{ddoc}/{attname}
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER Database
    The CouchDB database.
    .PARAMETER Document
    The CouchDB document.
    .PARAMETER Attachment
    The CouchDB attachment document.
    .PARAMETER Revision
    The CouchDB revision document.
    .PARAMETER Authorization
    The CouchDB authorization form; user and password.
    Authorization format like this: user:password
    ATTENTION: if the password is not specified, it will be prompted.
    .PARAMETER Ssl
    Set ssl connection on CouchDB server.
    This modify protocol to https and port to 6984.
    .EXAMPLE
    New-CouchDBDesignDocumentAttachment -Database test -Document space -Revision "2-4705a219cdcca7c72aac4f623f5c46a8" -Attachment test.txt
    This example add attachment "test.txt" on "space" design document from database "test".
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/ddoc.html#create-design-document-attachment
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory = $true)]
        [string] $Database,
        [Parameter(mandatory = $true)]
        [string] $Document,
        [Parameter(mandatory = $true)]
        [string] $Attachment,
        [Parameter(mandatory = $true)]
        [string] $Revision,
        [string] $Authorization,
        [switch] $Ssl
    )
    $Document = "_design/$Document"
    Send-CouchDBRequest -Server $Server -Port $Port -Method "PUT" -Database $Database -Document $Document -Attachment $Attachment -Revision $Revision -Authorization $Authorization -Ssl:$Ssl
}

function New-CouchDBAttachment () {
    <#
    .SYNOPSIS
    Create a new attachment document.
    .DESCRIPTION
    Create a new CouchDB attachment document.
    .NOTES
    CouchDB API:
        PUT /{db}/{docid}/{attname}
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER Database
    The CouchDB database.
    .PARAMETER Document
    The CouchDB document.
    .PARAMETER Attachment
    The CouchDB attachment document.
    .PARAMETER Revision
    The CouchDB revision document.
    .PARAMETER Authorization
    The CouchDB authorization form; user and password.
    Authorization format like this: user:password
    ATTENTION: if the password is not specified, it will be prompted.
    .PARAMETER Ssl
    Set ssl connection on CouchDB server.
    This modify protocol to https and port to 6984.
    .EXAMPLE
    New-CouchDBAttachment -Database test -Document "Hitchhikers" -Revision "2-4705a219cdcca7c72aac4f623f5c46a8" -Attachment test.txt
    This example add attachment "test.txt" on "Hitchhikers" document from database "test".
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/documents.html#create-an-attachment
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory = $true)]
        [string] $Database,
        [Parameter(mandatory = $true)]
        [string] $Document,
        [Parameter(mandatory = $true)]
        [string] $Attachment,
        [Parameter(mandatory = $true)]
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

function New-CouchDBReplication () {
    <#
    .SYNOPSIS
    Create a new replication job.
    .DESCRIPTION
    Create a new replication job for a specidfic database.
    .NOTES
    CouchDB API:
        PUT /_replicator
    .PARAMETER SourceServer
    The source CouchDB server name. Default is localhost.
    .PARAMETER TargetServer
    The destination CouchDB server name. Default is localhost.
    .PARAMETER SourcePort
    The source CouchDB server port. Default is 5984.
    .PARAMETER TargetPort
    The destination CouchDB server port. Default is 5984.
    .PARAMETER SourceDatabase
    The source CouchDB database.
    .PARAMETER TargetDatabase
    The destination CouchDB database.
    .PARAMETER Continuous
    The Continuous mode of replica.
    .PARAMETER Authorization
    The CouchDB authorization form; user and password.
    Authorization format like this: user:password
    ATTENTION: if the password is not specified, it will be prompted.
    .PARAMETER Ssl
    Set ssl connection on CouchDB server.
    This modify protocol to https and port to 6984.
    .EXAMPLE
    New-CouchDBReplication -SourceDatabase test -TargetDatabase test_dump -Continuous -Authorization "admin:password"
    This example create replication from database "test" to database "test_dump" in Continuous mode.
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/server.html#create-replica
    #>
    [CmdletBinding()]
    param(
        [string] $SourceServer = 'localhost',
        [string] $TargetServer = 'localhost',
        [int] $SourcePort,
        [int] $TargetPort,
        [string] $SourceDatabase,
        [string] $TargetDatabase,
        [switch] $Continuous,
        [string] $Authorization,
        [switch] $Ssl
    )
    $Database = "_replicator"
    $Server = $SourceServer
    $Port = $SourcePort
    # Check if replicator database exists
    if (-not(Test-CouchDBDatabase -Server $Server -Port $Port -Database $Database -Authorization $Authorization -Ssl:$Ssl -ErrorAction SilentlyContinue)) {
        New-CouchDBDatabase -Server $Server -Port $Port -Database $Database -Authorization $Authorization -Ssl:$Ssl | Out-Null
    }
    # Check if target database exists
    if (-not(Test-CouchDBDatabase -Server $Server -Port $Port -Database $TargetDatabase -Authorization $Authorization -Ssl:$Ssl -ErrorAction SilentlyContinue)) {
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
    Create a new index on database.
    .DESCRIPTION
    Mango is a declarative JSON querying language for CouchDB databases. 
    Mango wraps several index types, starting with the Primary Index out-of-the-box. 
    Mango indexes, with index type json, are built using MapReduce Views.
    .NOTES
    CouchDB API:
        POST /{db}/_index
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER Database
    The CouchDB database.
    .PARAMETER Name
    The name of index.
    .PARAMETER Fields
    Array fields that are indexed.
    .PARAMETER Authorization
    The CouchDB authorization form; user and password.
    Authorization format like this: user:password
    ATTENTION: if the password is not specified, it will be prompted.
    .PARAMETER Ssl
    Set ssl connection on CouchDB server.
    This modify protocol to https and port to 6984.
    .EXAMPLE
    New-CouchDBIndex -Database test -Name test-index -Fields name,surname -Authorization "admin:password"
    This example create index document "test_index" with fields "name" and "surname" for database "test".
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/databases.html#create-a-new-index
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory = $true, ValueFromPipeline = $true)]
        [string] $Database,
        [Parameter(mandatory = $true)]
        [string] $Name,
        [Parameter(mandatory = $true)]
        [array] $Fields,
        [string] $Authorization,
        [switch] $Ssl
    )
    $Document = '_index'
    $index = @{ 'index' = @{ }; 'type' = 'json' }
    $index.Add('name', "$Name")
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
    Requests one or more Universally Unique Identifiers (UUIDs) from the CouchDB instance.
    .NOTES
    CouchDB API:
        GET /_uuids
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER Count
    Return uuid number equal to count.
    .PARAMETER Authorization
    The CouchDB authorization form; user and password.
    Authorization format like this: user:password
    ATTENTION: if the password is not specified, it will be prompted.
    .PARAMETER Ssl
    Set ssl connection on CouchDB server.
    This modify protocol to https and port to 6984.
    .EXAMPLE
    New-CouchDBUuids -Count 3
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/server.html
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(ValueFromPipeline = $true)]
        [int] $Count = 10,
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
    .NOTES
    CouchDB API:
        POST /_cluster_setup
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER NodeCount
    Enable CouchDB cluster. Default node cluster is 3.
    .PARAMETER SingleNode
    Enable CouchDB cluster in a single node.
    .PARAMETER BindAddress
    The IP address to which to bind the current node. 
    The special value 0.0.0.0 (default) may be specified to bind to all interfaces on the host. (enable_cluster and enable_single_node only)
    .PARAMETER BindPort
    The TCP port to which to bind this node (enable_cluster and enable_single_node only).
    .PARAMETER RemoteNode
    The IP address of the remote node to setup as part of this cluster’s list of nodes. (enable_cluster only)
    .PARAMETER RemoteUser
    The username of the server-level administrator authorized on the remote node. (enable_cluster only)
    .PARAMETER RemotePassword
    The password of the server-level administrator authorized on the remote node. (enable_cluster only)
    .PARAMETER Authorization
    The CouchDB authorization form; user and password.
    Authorization format like this: user:password
    ATTENTION: if the password is not specified, it will be prompted.
    .PARAMETER Ssl
    Set ssl connection on CouchDB server.
    This modify protocol to https and port to 6984.
    .EXAMPLE
    Enable-CouchDBCluster -SingleNode -Authorization "admin:password"
    This example get a cluster setup.
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/config.html#setup
    #>
    [CmdletBinding()]
    param(
        [Parameter(ValueFromPipeline = $true)]
        [string] $Server,
        [int] $Port,
        [ValidateRange(1, 3)]
        [int] $NodeCount = 3,
        [switch] $SingleNode,
        [string] $BindAddress = '0.0.0.0',
        [int] $BindPort = 5984,
        [ValidateScript( { if (-not($SingleNode)) { $true } })]
        [string] $RemoteNode,
        [ValidateScript( { if (-not($SingleNode)) { $true } })]
        [string] $RemoteUser,
        [ValidateScript( { if (-not($SingleNode) -and ($RemoteUser)) { $true } })]
        [SecureString] $RemotePassword,
        [string] $Authorization,
        [switch] $Ssl
    )
    # Check if an admin has been created
    $name = & { if ($Authorization) { Write-Output $($Authorization -split ":")[0] } else { Write-Output "___" } }
    $admins = Get-CouchDBAdmin -Server $Server -Port $Port -Authorization $Authorization -Ssl:$Ssl -ErrorAction SilentlyContinue
    if (-not(Get-Member -Inputobject $admins -Name "$name" -ErrorAction SilentlyContinue)) {
        throw "Create an admin before configure cluster or specify a valid -Authorization parameter!" 
    }
    $Database = "_cluster_setup"
    $Credential = $Authorization -split ":"
    # Check if single node cluster mode enabled
    if ($SingleNode.IsPresent) {
        $Action = "enable_single_node"
    } else {
        $Action = "enable_cluster"
    }
    $Data = "
        {
            `"action`": `"$Action`",
            `"bind_address`": `"$BindAddress`",
            `"port`": `"$BindPort`",
            `"username`": `"$($Credential[0])`",
            `"password`": `"$($Credential[1])`"
        "
    # Check if single node cluster or not
    if ($Action -eq "enable_cluster") {
        if ($RemoteNode) { $Data += ",`"remote_node`": `"$RemoteNode`"" }
        if ($RemoteUser) { $Data += ",`"remote_current_user`": `"$RemoteUser`"" }
        if ($RemotePassword) { $Data += ",`"remote_current_password `": `"$(ConvertTo-CouchDBPassword -SecurePassword $RemotePassword)`"" }
        $Data += ",`"node_count`": `"$NodeCount`"}"
    } else {
        $Data += ",`"node_count`": `"1`"}"
    }
    Write-Host "Enabling $Action cluster"
    Send-CouchDBRequest -Server $Server -Port $Port -Method "POST" -Database $Database -Data $Data -Authorization $Authorization -Ssl:$Ssl
    if ($Action -eq "enable_cluster") { 
        $Data = '{"action": "finish_cluster"}'
        Write-Host "Finishing $Action cluster"
        Send-CouchDBRequest -Server $Server -Port $Port -Method "POST" -Database $Database -Data $Data -Authorization $Authorization -Ssl:$Ssl
    } else {
        Write-Host "Finishing $Action cluster"
    }
}

function Search-CouchDBHelp () {
    <#
    .SYNOPSIS
    Search help.
    .DESCRIPTION
    Search pattern keyword in a CouchDB help topic.
    .PARAMETER Pattern
    The pattern of serach criteria. The pattern it can be a verb, a nuoun or a parameter..
    .EXAMPLE
    Search-CouchDBHelp -Pattern "Database"
    .EXAMPLE
    Search-CouchDBHelp -Pattern "Get"
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/intro.html#start
    #>
    [CmdletBinding()]
    param(
        [Parameter(mandatory = $true, ValueFromPipeline = $true)]
        $Pattern
    )
    $helpNames = $(Get-Help *CouchDB* | Where-Object { $_.Category -ne "Alias" })
    foreach ($helpTopic in $helpNames) {
        $content = Get-Help -Full $helpTopic.Name | Out-String
        if ($content -match "(.{0,30}$Pattern.{0,30})") {
            $helpTopic | Add-Member NoteProperty Match $matches[0].Trim()
            $helpTopic | Select-Object Name, Match
        }
    }
}

function Remove-CouchDBDatabase () {
    <#
    .SYNOPSIS
    Remove a database.
    .DESCRIPTION
    Deletes the specified database, and all the documents and attachments contained within it.
    .NOTES
    CouchDB API:
        DELETE /{db}
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
    .PARAMETER Force
    No confirmation prompt.
    .PARAMETER Ssl
    Set ssl connection on CouchDB server.
    This modify protocol to https and port to 6984.
    .EXAMPLE
    Remove-CouchDBDatabase -Database test -Authorization "admin:password"
    This example remove a database "test".
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/databases.html#remove-a-database
    #>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory = $true, ValueFromPipeline = $true)]
        [string] $Database,
        [string] $Authorization,
        [switch]$Force,
        [switch] $Ssl
    )
    if ($Force -or $PSCmdlet.ShouldContinue("Do you wish remove database $Database ?", "Remove database $Database")) {
        Send-CouchDBRequest -Server $Server -Port $Port -Method "DELETE" -Database $Database -Authorization $Authorization -Ssl:$Ssl
    }
}

function Remove-CouchDBDocument () {
    <#
    .SYNOPSIS
    Remove a document.
    .DESCRIPTION
    Remove a CouchDB document.
    .NOTES
    CouchDB API:
        DELETE /{db}/{docid}
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER Database
    The CouchDB database.
    .PARAMETER Document
    The CouchDB document.
    .PARAMETER Revision
    The CouchDB revision document.
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
    Remove-CouchDBDocument -Database test -Document "Hitchhikers" -Revision "2-4705a219cdcca7c72aac4f623f5c46a8" -Authorization "admin:password"
    The example removes a "Hitchhikers" on database "test".
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/documents.html#delete-a-document
    #>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory = $true, ValueFromPipeline = $true)]
        [string] $Database,
        [Parameter(mandatory = $true)]
        [string] $Document,
        [Parameter(mandatory = $true)]
        [string] $Revision,
        [string] $Authorization,
        [switch]$Force,
        [switch] $Ssl
    )
    if ($Force -or $PSCmdlet.ShouldContinue("Do you wish remove document $Document on database $Database ?", "Remove document $Document on database $Database")) {
        Send-CouchDBRequest -Server $Server -Port $Port -Method "DELETE" -Database $Database -Document $Document -Revision $Revision -Authorization $Authorization -Ssl:$Ssl
    }
}

function Remove-CouchDBDesignDocument () {
    <#
    .SYNOPSIS
    Remove a design document.
    .DESCRIPTION
    Remove a CouchDB design document.
    .NOTES
    CouchDB API:
        DELETE /{db}/_design/{ddoc}
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER Database
    The CouchDB database.
    .PARAMETER Document
    The CouchDB document.
    .PARAMETER Revision
    The CouchDB revision document.
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
    Remove-CouchDBDesignDocument -Database test -Document "space" -Revision "2-4705a219cdcca7c72aac4f623f5c46a8" -Authorization "admin:password"
    The example removes a design document "space" on database "test".
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/ddoc.html#remove-design-document
    #>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory = $true, ValueFromPipeline = $true)]
        [string] $Database,
        [Parameter(Mandatory = $true)]
        [string] $Document,
        [Parameter(Mandatory = $true)]
        [string] $Revision,
        [string] $Authorization,
        [switch]$Force,
        [switch] $Ssl
    )
    $Document = "_design/$Document"
    if ($Force -or $PSCmdlet.ShouldContinue("Do you wish remove design document $Document on database $Database ?", "Remove design document $Document on database $Database")) {
        Send-CouchDBRequest -Server $Server -Port $Port -Method "DELETE" -Database $Database -Document $Document -Revision $Revision -Authorization $Authorization -Ssl:$Ssl
    }
}

function Remove-CouchDBAttachment () {
    <#
    .SYNOPSIS
    Remove an attachment document.
    .DESCRIPTION
    Remove a CouchDB attachment document.
    .NOTES
    CouchDB API:
        DELETE /{db}/{docid}/{attname}
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER Database
    The CouchDB database.
    .PARAMETER Document
    The CouchDB document.
    .PARAMETER Attachment
    The CouchDB attachment document.
    .PARAMETER Revision
    The CouchDB revision document.
    .PARAMETER Authorization
    The CouchDB authorization form; user and password.
    Authorization format like this: user:password
    ATTENTION: if the password is not specified, it will be prompted.
    .PARAMETER Ssl
    Set ssl connection on CouchDB server.
    This modify protocol to https and port to 6984.
    .EXAMPLE
    Remove-CouchDBAttachment -Database test -Document "Hitchhikers" -Attachment test.txt -Revision "2-4705a219cdcca7c72aac4f623f5c46a8" -Authorization "admin:password"
    The example removes an attachment "test.txt" on document "Hitchhikers" from database "test".
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/documents.html#delete-an-attachment
    #>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory = $true, ValueFromPipeline = $true)]
        [string] $Database,
        [Parameter(mandatory = $true)]
        [string] $Document,
        [Parameter(mandatory = $true)]
        [string] $Attachment,
        [Parameter(mandatory = $true)]
        [string] $Revision,
        [string] $Authorization,
        [switch]$Force,
        [switch] $Ssl
    )
    if ($Force -or $PSCmdlet.ShouldContinue("Do you wish remove attachment $Attachment in document $Document on database $Database ?", "Remove attachment $Attachment in document $Document on database $Database")) {
        Send-CouchDBRequest -Server $Server -Port $Port -Method "DELETE" -Database $Database -Document $Document -Attachment $Attachment -Revision $Revision -Authorization $Authorization -Ssl:$Ssl
    }
}

function Remove-CouchDBDesignDocumentAttachment () {
    <#
    .SYNOPSIS
    Remove an attachment in a design document.
    .DESCRIPTION
    Deletes the attachment of the specified design document.
    .NOTES
    CouchDB API:
        DELETE /{db}/_design/{ddoc}/{attname}
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER Database
    The CouchDB database.
    .PARAMETER Document
    The CouchDB document.
    .PARAMETER Attachment
    The CouchDB attachment document.
    .PARAMETER Revision
    The CouchDB revision document.
    .PARAMETER Authorization
    The CouchDB authorization form; user and password.
    Authorization format like this: user:password
    ATTENTION: if the password is not specified, it will be prompted.
    .PARAMETER Ssl
    Set ssl connection on CouchDB server.
    This modify protocol to https and port to 6984.
    .EXAMPLE
    Remove-CouchDBDesignDocumentAttachment -Database test -Document "space" -Attachment test.txt -Revision "2-4705a219cdcca7c72aac4f623f5c46a8" -Authorization "admin:password"
    The example removes an attachment "test.txt" on a design document "space" from database "test".
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/documents.html#delete-an-attachment
    #>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory = $true, ValueFromPipeline = $true)]
        [string] $Database,
        [Parameter(mandatory = $true)]
        [string] $Document,
        [Parameter(mandatory = $true)]
        [string] $Attachment,
        [Parameter(mandatory = $true)]
        [string] $Revision,
        [string] $Authorization,
        [switch]$Force,
        [switch] $Ssl
    )
    $Document = "_design/$Document"
    if ($Force -or $PSCmdlet.ShouldContinue("Do you wish remove attachment $Attachment in design document $Document on database $Database ?", "Remove attachment $Attachment in design document $Document on database $Database")) {
        Send-CouchDBRequest -Server $Server -Port $Port -Method "DELETE" -Database $Database -Document $Document -Attachment $Attachment -Revision $Revision -Authorization $Authorization -Ssl:$Ssl
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
    [CmdletBinding(SupportsShouldProcess = $true)]
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
    [CmdletBinding(SupportsShouldProcess = $true)]
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

function Remove-CouchDBNode () {
    <#
    .SYNOPSIS
    Remove server nodes.
    .DESCRIPTION
    Remove server nodes on CouchDB server.
    .NOTES
    CouchDB API:
        DELETE /_node/{node-name}
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER Node
    The CouchDB node of cluster.
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
    Remove-CouchDBNode -Node "couchdb@localhost" -Authorization "admin:password"
    The example removes "test" node on cluster configuration.
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/config.html#remove-a-node
    #>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory = $true, ValueFromPipeline = $true)]
        [string] $Node,
        [string] $Authorization,
        [switch]$Force,
        [switch] $Ssl
    )
    $Database = "_nodes"
    # Set protocol
    if ($Ssl.IsPresent) {
        if (-not($Port)) {
            if ((Get-CouchDBServer).version -match '3.*') { $Port = 6984 } elseif ((Get-CouchDBServer).version -match '2.*') { $Port = 6986 }
        }
    } else {
        if (-not($Port)) {
            if ((Get-CouchDBServer).version -match '3.*') { $Port = 5984 } elseif ((Get-CouchDBServer).version -match '2.*') { $Port = 5986 }
        }
    }
    if (Get-CouchDBDocument -Server $Server -Port $Port -Database $Database -Document $Node -Info -Authorization $Authorization -Ssl:$Ssl -ErrorAction SilentlyContinue) {
        $Revision = (Get-CouchDBDocument -Server $Server -Port $Port -Database $Database -Document $Node -Authorization $Authorization -Ssl:$Ssl)._rev
    } else {
        throw "Node $Node not exist."
    }
    $Document = $Node
    if ($Force -or $PSCmdlet.ShouldContinue("Do you wish remove node $Node ?", "Remove $Node")) {
        Send-CouchDBRequest -Server $Server -Port $Port -Method "DELETE" -Database $Database -Document $Document -Revision $Revision -Authorization $Authorization -Ssl:$Ssl
    }
}

function Remove-CouchDBReplication () {
    <#
    .SYNOPSIS
    Remove replication.
    .DESCRIPTION
    Remove replication on CouchDB server.
    .NOTES
    CouchDB API:
        DELETE /_replicator/{docid}
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER Document
    The CouchDB replication document.
    .PARAMETER Revision
    The CouchDB revision document.
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
    Remove-CouchDBReplication -Document localhost-test_localhost-test_dump -Revision "2-4705a219cdcca7c72aac4f623f5c46a8" -Authorization "admin:password"
    The example removes "localhost-test_localhost-test_dump" replication document.
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/server.html#remove-replica
    #>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [Parameter(ValueFromPipeline = $true)]
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory = $true)]
        [string] $Document,
        [Parameter(mandatory = $true)]
        [string] $Revision,
        [string] $Authorization,
        [switch] $Force,
        [switch] $Ssl
    )
    $Database = "_replicator"
    if (-not(Test-CouchDBDatabase -Database $Database -Authorization $Authorization -Ssl:$Ssl -ErrorAction SilentlyContinue)) {
        throw "Database _replicator is not exists."
    }
    if ($Force -or $PSCmdlet.ShouldContinue("Do you wish remove replication $Document ?", "Remove $Document")) {
        Send-CouchDBRequest -Server $Server -Port $Port -Method "DELETE" -Database $Database -Document $Document -Revision $Revision -Authorization $Authorization -Ssl:$Ssl
    }
}

function Remove-CouchDBIndex () {
    <#
    .SYNOPSIS
    Remove a index on a database.
    .DESCRIPTION
    Remove a index on CouchDB database.
    .NOTES
    CouchDB API:
        DELETE /{db}/_index/{designdoc}/json/{name}
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER Database
    The CouchDB database.
    .PARAMETER DesignDoc
    The CouchDB design document.
    .PARAMETER Name
    The name of index.
    .PARAMETER Fields
    Array fields that are indexed.
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
    $ddoc = Get-CouchDBIndex -Database test -Authorization "admin:password"
    Remove-CouchDBIndex -Database test -DesignDoc $ddoc.indexes.ddoc[1] -Name $ddoc.indexes.name[1] -Authorization "admin:password"
    The example removes an index document on database "test".
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/databases.html#remove-a-index
    #>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory = $true)]
        [string] $Database,
        [Parameter(mandatory = $true)]
        [string] $DesignDoc,
        [Parameter(mandatory = $true, ValueFromPipeline = $true)]
        [string] $Name,
        [string] $Authorization,
        [switch]$Force,
        [switch] $Ssl
    )
    $Document = "_index/$DesignDoc/json/$Name"
    if ($Force -or $PSCmdlet.ShouldContinue("Do you wish remove index $DesignDoc ?", "Remove index $DesignDoc on database $Database")) {
        Send-CouchDBRequest -Server $Server -Port $Port -Method "DELETE" -Database $Database -Document $Document -Authorization $Authorization -Ssl:$Ssl
    }
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

function Restart-CouchDBServer () {
    <#
    .SYNOPSIS
    Restart service.
    .DESCRIPTION
    Restart CouchDB server service.
    .PARAMETER Force
    No confirmation prompt.
    .EXAMPLE
    Restart-CouchDBServer
    The example restart CouchDB server. 
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/server.html
    #>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [switch] $Force
    )
    # Windows?
    try {
        $Windows = ([bool](Get-CimInstance -ClassName Win32_OperatingSystem -ErrorAction SilentlyContinue))
    } catch [System.Management.Automation.CommandNotFoundException] {
        $Windows = $false
    }
    if ($Windows) {
        $Service = "Apache CouchDB"
        if ($Force -or $PSCmdlet.ShouldContinue("Do you wish to restart CouchDB server ?", "Restart server")) {
            try {
                Restart-Service -Name $Service -Force -ErrorAction Stop
            } catch [Microsoft.PowerShell.Commands.ServiceCommandException] {
                throw "Cannot open $Service service on computer"
            }
            Write-Host
            Write-Host -ForegroundColor Green "Apache CouchDB restarted successfully."
        }
    } else {
        if ($Force -or $PSCmdlet.ShouldContinue("Do you wish to restart CouchDB server ?", "Restart server")) {
            & service couchdb restart
            if ($(& service couchdb status)[2] -notmatch "(running)") { throw "Cannot open $Service service on computer" }
            Write-Host
            Write-Host -ForegroundColor Green "Apache CouchDB restarted successfully."
        }
    }
}

function Search-CouchDBFullText () {
    <#
    .SYNOPSIS
    Full text search.
    .DESCRIPTION
    Full text search across entire database.
    WARNING! This search is much slower than the Find-CouchdbDocuments cmdlet.
    .NOTES
    CouchDB API:
        POST /{db}/_all_docs/queries
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER Database
    The CouchDB database.
    .PARAMETER Patterns
    The pattern for full text search.
    .PARAMETER UseQueries
    Use an array patterns of query objects with fields for the parameters of each individual view query to be executed.
    .PARAMETER Authorization
    The CouchDB authorization form; user and password.
    Authorization format like this: user:password
    ATTENTION: if the password is not specified, it will be prompted.
    .PARAMETER Ssl
    Set ssl connection on CouchDB server.
    This modify protocol to https and port to 6984.
    .EXAMPLE
    Search-CouchDBFullText -Database test -Patterns "space","planet"
    This example search the word "space" and "planet" in each document of database test.
    .EXAMPLE
    Search-CouchDBFullText -Database test -Patterns "space","planet" -UseQueries
    This example search the word "space" and "planet" in each document of database test, using queries mode.
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/documents.html#search-a-document
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory = $true, ValueFromPipeline = $true)]
        [string] $Database,
        [Parameter(mandatory = $true)]
        [array] $Patterns,
        [switch] $UseQueries,
        [string] $Authorization,
        [switch] $Ssl
    )
    # Check if UseQueries has been used
    if ($UseQueries.IsPresent) {
        $Data = @"
        {
            "queries": [
                {
                    "keys": $(if ($Patterns.Count -eq 1) {
                        "[$($Patterns | ConvertTo-Json -Compress)]"
                    } else {
                        $Patterns | ConvertTo-Json -Compress
                    })
                }
            ]
        }
"@
        $Document = "_all_docs/queries"
        Send-CouchDBRequest -Server $Server -Port $Port -Method "POST" -Database $Database -Document $Document -Data $Data -Authorization $Authorization -Ssl:$Ssl
    } else {
        $result = [PSCustomObject]@{
            total_rows = 0
            rows       = New-Object System.Collections.Generic.List[System.Object]
        }
        foreach ($doc in (Get-CouchDBDocument -Server $Server -Port $Port -Database $Database -Authorization $Authorization -Ssl:$Ssl).rows) {
            $json = Get-CouchDBDocument -Server $Server -Port $Port -Database $Database -Document $doc.id -Authorization $Authorization -Ssl:$Ssl | ConvertTo-Json -Depth 99
            foreach ($Pattern in $Patterns) {
                if ($json -match "$Pattern") {
                    $convert = $json | ConvertFrom-Json
                    if ($result.rows -notcontains $convert) {
                        $result.total_rows += 1
                        $result.rows.Add($convert)
                    }
                }
            }
        }
        return $result
    }
}

function Find-CouchDBDocuments () {
    <#
    .SYNOPSIS
    Find document data in a database.
    .DESCRIPTION
    Find documents using a declarative JSON querying syntax. Queries can use the built-in _all_docs index or custom indexes, specified using the _index endpoint.
    .NOTES
    CouchDB API:
        POST /{db}/_find
        POST /{db}/_explain
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER Database
    The CouchDB database.
    .PARAMETER Explain
    The CouchDB database _explain.
    .PARAMETER Selector
    The selector of Mango query.
    .PARAMETER Value
    The value of selector of Mango query.
    .PARAMETER Limit
    The limit number of documents that come back.
    .PARAMETER Skip
    The skip number of documents that come back.
    .PARAMETER Fields
    Array of fields that can return.
    .PARAMETER Sort
    Array of sort fields that can return.
    .PARAMETER Sort
    Array of index that can use.
    .PARAMETER ReadQuorum
    The ReadQuorum number.
    .PARAMETER Bookmark
    The Bookmark that can use.
    .PARAMETER NoUpdate
    Disable document update.
    .PARAMETER Stable
    Whether or not the view results should be returned from a “stable” set of shards.
    .PARAMETER Stale
    Combination of update=false and stable=true options. Possible options: "ok".
    .PARAMETER ExecutionStats
    Include execution statistics in the query response.
    .PARAMETER Operator
    The comparison operator.
    .PARAMETER Find
    The Json query structure.
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
    Find-CouchDBDocuments -Database test -Selector "name" -Operator eq -Value "Arthur Dent" -Fields _id,name,planet
    The example query a database "test" with manual selector and operator.
    .EXAMPLE
    Find-CouchDBDocuments -Database test -Find '{"selector": {"name":{"$eq":"Arthur Dent"}},"fields":["_id","name","planet"]}'
    The example query a database "test" with native Mango query.
    .EXAMPLE
    using module PSCouchDB
    $q = New-Object -TypeName PSCouchDBQuery
    $q.AddSelector("name","Arthur Dent")
    $q.AddSelectorOperator('$eq')
    $q.AddFields("_id")
    $q.AddFields("name")
    $q.AddFields("planet")
    Find-CouchDBDocuments -Database test -Find $q.GetNativeQuery()
    The example query a database "test" with PSCouchDBQuery object.
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/documents.html#query
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/classes.html#pscouchdbquery-class
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
        [Parameter(mandatory = $true, ValueFromPipeline = $true)]
        [string] $Database,
        [Parameter(ParameterSetName = "PSCouchDB")]
        [switch] $Explain,
        [Parameter(ParameterSetName = "PSCouchDB")]
        [string] $Selector,
        [Parameter(ParameterSetName = "PSCouchDB")]
        $Value,
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
        [ValidateSet('lt', 'lte', 'eq', 'ne', 'gte', 'gt', 'exists', 'type', 'in', 'nin', 'size', 'mod', 'regex')]
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
        if ($Find -is [hashtable]) {
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
            'lt' { $Query.AddSelectorOperator('$lt') }
            'lte' { $Query.AddSelectorOperator('$lte') }
            'eq' { $Query.AddSelectorOperator('$eq') }
            'ne' { $Query.AddSelectorOperator('$ne') }
            'gte' { $Query.AddSelectorOperator('$gte') }
            'gt' { $Query.AddSelectorOperator('$gt') }
            'exists' { $Query.AddSelectorOperator('$exists') }
            'type' { $Query.AddSelectorOperator('$type') }
            'in' { $Query.AddSelectorOperator('$in') }
            'nin' { $Query.AddSelectorOperator('$nin') }
            'size' { $Query.AddSelectorOperator('$size') }
            'mod' { $Query.AddSelectorOperator('$mod') }
            'regex' { $Query.AddSelectorOperator('$regex') }
        }
        # Data
        $Data = $Query.GetNativeQuery()
    }
    Send-CouchDBRequest -Server $Server -Port $Port -Method "POST" -Database $Database -Document $Document -Data $Data -Authorization $Authorization -Ssl:$Ssl
}

function Write-CouchDBFullCommit () {
    <#
    .SYNOPSIS
    Commits any recent changes.
    .DESCRIPTION
    Commits any recent changes to the specified database to disk. 
    You should call this if you want to ensure that recent changes have been flushed.
    .NOTES
    CouchDB API:
        POST /{db}/_ensure_full_commit
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
    .PARAMETER Force
    No confirmation prompt.
    .PARAMETER Ssl
    Set ssl connection on CouchDB server.
    This modify protocol to https and port to 6984.
    .EXAMPLE
    Write-CouchDBFullCommit -Database test -Authorization "admin:password"
    The example write all commit the disk of database "test".
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/databases.html#write-a-commit
    #>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory = $true, ValueFromPipeline = $true)]
        [string] $Database,
        [string] $Authorization,
        [switch]$Force,
        [switch] $Ssl
    )
    $Document = '_ensure_full_commit'
    $Data = '{}'
    if ($Force -or $PSCmdlet.ShouldContinue("Do you wish to commits any recent changes to the specified database $Database to disk ?", "Commit changes")) {
        Send-CouchDBRequest -Server $Server -Port $Port -Method "POST" -Database $Database -Document $Document -Data $Data -Authorization $Authorization -Ssl:$Ssl
    }
}

function Export-CouchDBDatabase () {
    <#
    .SYNOPSIS
    Export database.
    .DESCRIPTION
    Dump specified database in a JSON file.
    .NOTES
    CouchDB API:
        GET /{db}/{docid}
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER Database
    The CouchDB database.
    .PARAMETER Path
    The path of JSON file.
    .PARAMETER Authorization
    The CouchDB authorization form; user and password.
    Authorization format like this: user:password
    ATTENTION: if the password is not specified, it will be prompted.
    .PARAMETER Ssl
    Set ssl connection on CouchDB server.
    This modify protocol to https and port to 6984.
    .EXAMPLE
    Export-CouchDBDatabase -Database test
    Export "test" database in a json file.
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/databases.html#export
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory = $true, ValueFromPipeline = $true)]
        [string] $Database,
        [string] $Path = $(Join-Path -Path "$($PWD.path)" -ChildPath "$($Database)_$(Get-Date -Format 'MM-dd-yyyy_HH_mm_ss').json"),
        [string] $Authorization,
        [switch] $Ssl
    )
    # Create list container
    $list = New-Object System.Collections.Generic.List[System.Object]
    $count = 0
    $all_docs = (Get-CouchDBDocument -Server $Server -Port $Port -Database $Database -Authorization $Authorization -Ssl:$Ssl).rows
    foreach ($doc in $all_docs) {
        $count++
        $list.Add($(Get-CouchDBDocument -Server $Server -Port $Port -Database $Database -Document $doc.id -Authorization $Authorization -Ssl:$Ssl))
        Write-Progress -Activity "Export document $($doc.id) in progress" -Status "Progress $count/$($all_docs.count)" -PercentComplete ($count / $all_docs.count * 100)
    }
    Write-Host "Export JSON file to $Path."
    # Export all docs to json file
    $list | ConvertTo-Json -Depth 99 | Out-File -FilePath $Path -Encoding utf8
    # Result
    if (Test-Path -Path $Path -ErrorAction SilentlyContinue) {
        Write-Host
        Write-Host "ok"
        Write-Host "--"
        Write-Host $true
    } else {
        Write-Host
        Write-Host "ok"
        Write-Host "--"
        Write-Host $false
    }
}

function Import-CouchDBDatabase () {
    <#
    .SYNOPSIS
    Import database.
    .DESCRIPTION
    Restore specified database from a JSON file.
    .NOTES
    CouchDB API:
        POST /{db}/_bulk_docs
        PUT /{db}
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER Database
    The CouchDB database.
    .PARAMETER Path
    The path of JSON file.
    .PARAMETER RemoveRevision
    Remove all revision to docs.
    This is useful when creating a new database.
    .PARAMETER Authorization
    The CouchDB authorization form; user and password.
    Authorization format like this: user:password
    ATTENTION: if the password is not specified, it will be prompted.
    .PARAMETER Ssl
    Set ssl connection on CouchDB server.
    This modify protocol to https and port to 6984.
    .EXAMPLE
    Import-CouchDBDatabase -Path test_01-25-2019_00_01_00.json
    Import "test" database from a json file.
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/databases.html#import
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory = $true)]
        [string] $Database,
        [Parameter(mandatory = $true, ValueFromPipeline = $true)]
        [string] $Path,
        [switch] $RemoveRevision,
        [string] $Authorization,
        [switch] $Ssl
    )
    # Check RemoveRevision parameter
    if ($RemoveRevision.IsPresent) {
        $_docs = $(Get-Content -Path $Path)
        $docs = @()
        foreach ($doc in $_docs) {
            $doc = $doc -replace '"_rev":.*,', ""
            $docs += $doc
        }
    } else {
        # Create container "docs"
        $docs = $(Get-Content -Path $Path)
    }
    # Check if database exists
    if (-not(Test-CouchDBDatabase -Server $Server -Port $Port -Database $Database -Authorization $Authorization -Ssl:$Ssl -ErrorAction SilentlyContinue)) {
        New-CouchDBDatabase -Server $Server -Port $Port -Database $Database -Authorization $Authorization -Ssl:$Ssl | Out-Null
    }
    # Import data in bulk
    [string] $Document = "_bulk_docs"
    $Data = "{ `"docs`" : $(($docs | ConvertFrom-Json) | ConvertTo-Json -Depth 99)}"
    Send-CouchDBRequest -Server $Server -Port $Port -Method "POST" -Database $Database -Document $Document -Data $Data -Authorization $Authorization -Ssl:$Ssl
}

function Read-CouchDBLog () {
    <#
    .SYNOPSIS
    Read or tail log.
    .DESCRIPTION
    Read, tail and follow CouchDB log (couch.log).
    .PARAMETER Path
    The path of log file. Default, is C:\CouchDB\couch.log on Windows and /var/log/couchdb/couch.log on Unix.
    .PARAMETER Level
    Select level of log. Default is "info".
    Available levels:
        debug: Detailed debug logging.
        info: Informative logging. Includes HTTP requests headlines, startup of an external processes etc.
        notice
        warning: Warning messages are alerts about edge situations that may lead to errors.
        error: Error level includes only things that go wrong, like crash reports and HTTP error responses (5xx codes).
        critical
        alert
        emergency
    .PARAMETER Follow
    Output appended data as the file grows.
    .PARAMETER Tail
    The last n lines of log. Default is 10.
    .EXAMPLE
    Read-CouchDBLog -Level warning -Follow
    Append and wait new warning entry on default log.
    .EXAMPLE
    Read-CouchDBLog -Path /custom/couchdb/log/couch.log -Level error | Out-File error_couchdb.log
    Read only error,critical,alert,emergency log in a custom path and redirect to a new file.
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/server.html#read-the-log
    #>
    [CmdletBinding()]
    param(
        [string] $Path,
        [ValidateSet("debug", "info", "notice", "warning", "error", "critical", "alert", "emergency")]
        [Parameter(ValueFromPipeline = $true)]
        [string] $Level = "info",
        [switch] $Follow,
        [int] $Tail
    )
    # Check if $Path is empty
    if (-not($Path)) {
        # Windows?
        try {
            $Windows = ([bool](Get-CimInstance -ClassName Win32_OperatingSystem -ErrorAction SilentlyContinue))
        } catch [System.Management.Automation.CommandNotFoundException] {
            $Windows = $false
        }
        # Set default path...
        # Windows platform
        if ($Windows) {
            $Path = "C:\CouchDB\couch.log"
            $root = "C:\CouchDB"
            # Unix platform
        } else {
            $Path = "/var/log/couchdb/couch.log"
            $root = "/var/log"
        }
        # ...and if not exists, search it
        if (-not(Test-Path -Path $Path -ErrorAction SilentlyContinue)) {
            Write-Warning -Message "Default log path $Path not exists!"
            Write-Host "Search couch.log in the $root path..."
            $Path = (Get-ChildItem -Path $root -Recurse | Where-Object { $_.Name -like "couch.log" } | Select-Object FullName).FullName
            if (-not(Test-Path -Path $Path)) {
                throw "couch.log not found! Specify the `$Path parameter or check configuration!"
            }
            Write-Host
        }
    }
    # Set level
    $Levels = [PSCustomObject]@{
        debug     = @{
            color = "DarkYellow"
            level = "debug", "info", "notice", "warning", "error", "critical", "alert", "emergency"
        }
        info      = @{
            color = "DarkGray"
            level = "info", "notice", "warning", "error", "critical", "alert", "emergency"
        }
        notice    = @{
            color = "Gray"
            level = "notice", "warning", "error", "critical", "alert", "emergency"
        }
        warning   = @{
            color = "Yellow"
            level = "warning", "error", "critical", "alert", "emergency"
        }
        error     = @{
            color = "Red"
            level = "error", "critical", "alert", "emergency"
        }
        critical  = @{
            color = "DarkRed"
            level = "critical", "alert", "emergency"
        }
        alert     = @{
            color = "DarkMagenta"
            level = "alert", "emergency"
        }
        emergency = @{
            color = "Magenta"
            level = "emergency"
        }
    }
    # Set option of Get-Content cmdlet
    $Parameters = @{
        Path = $Path
    }
    if ($Follow.IsPresent) {
        if (-not($Tail)) { $Parameters.Add("Tail", 10) }
        $Parameters.Add("Wait", $true)
    }
    if ($Tail) {
        $Parameters.Add("Tail", $Tail)
    }
    # Run Get-Content
    Get-Content @Parameters | ForEach-Object {
        foreach ($lev in $Levels.$level.level) {
            if ($_ -match "\[$lev\]") { Write-Host -ForegroundColor $Levels.$lev.color $_ }
        }
    }
}

function Clear-CouchDBLog () {
    <#
    .SYNOPSIS
    Clear log.
    .DESCRIPTION
    Clear and rotate CouchDB log (couch.log).
    .PARAMETER Path
    The path of log file. Default, is C:\CouchDB\couch.log on Windows and /var/log/couchdb/couch.log on Unix.
    .PARAMETER Rotate
    Rotate an existing log. Copy before delete in this format couch.log.t-i-m-e_s_t_a_m_p
    .EXAMPLE
    Clear-CouchDBLog -Rotate
    Clear default couch.log and save a copy before delete it.
    .EXAMPLE
    Clear-CouchDBLog -Path /custom/couchdb/log/couch.log
    Clear custom log /custom/couchdb/log/couch.log.
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/server.html#clear-the-log
    #>
    [CmdletBinding()]
    param(
        [Parameter(ValueFromPipeline = $true)]
        [string] $Path,
        [switch] $Rotate
    )
    # Check if $Path is empty
    if (-not($Path)) {
        # Windows?
        try {
            $Windows = ([bool](Get-CimInstance -ClassName Win32_OperatingSystem -ErrorAction SilentlyContinue))
        } catch [System.Management.Automation.CommandNotFoundException] {
            $Windows = $false
        }
        # Set default path...
        # Windows platform
        if ($Windows) {
            $Path = "C:\CouchDB\couch.log"
            $root = "C:\CouchDB"
            # Unix platform
        } else {
            $Path = "/var/log/couchdb/couch.log"
            $root = "/var/log"
        }
    }
    # ...and if not exists, search it
    if (-not(Test-Path -Path $Path -ErrorAction SilentlyContinue)) {
        Write-Warning -Message "Default log path $Path not exists!"
        Write-Host "Search couch.log in the $root path..."
        $Path = (Get-ChildItem -Path $root -Recurse | Where-Object { $_.Name -like "couch.log" } | Select-Object FullName).FullName
        if (-not(Test-Path -Path $Path)) {
            throw "couch.log not found! Specify the `$Path parameter or check configuration!"
        }
        Write-Host
    }
    # Clear log
    if ($Rotate.IsPresent) {
        Copy-Item -Path $Path -Destination "$Path.$(Get-Date -Format 'MM-dd-yyyy_HH_mm_ss')" -Force
        Clear-Content -Path $Path -Force
    } else {
        Clear-Content -Path $Path -Force
    }
}