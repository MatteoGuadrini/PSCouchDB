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
    Set-CouchDBDesignDocumentAttachment -Database test -Document "space" -Revision "2-4705a219cdcca7c72aac4f623f5c46a8" -Attachment test.txt
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
        [string] $Node = $(if ((Get-CouchDBNode -Server $Server -Port $Port -Authorization $Authorization -Ssl:$Ssl).name -contains "couchdb@localhost") { "couchdb@localhost" } else { "couchdb@127.0.0.1" }),
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
    .PARAMETER SourceProxy
    The source proxy server.
    .PARAMETER TargetProxy
    The target proxy server.
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
        [string] $SourceProxy,
        [string] $TargetProxy,
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
    if ($SourceProxy) {
        $Json.Add("source_proxy", $SourceProxy)
    }
    if ($TargetProxy) {
        $Json.Add("target_proxy", $TargetProxy)
    }
    # Check doc_ids
    if ($Documents.Count -ne 0) {
        $Json.Add("doc_ids", $Documents)
    }
    # Convert data to json
    $Data = $Json | ConvertTo-Json -Depth 4
    Send-CouchDBRequest -Server $Server -Port $Port -Method "POST" -Database $Database -Data $Data -Authorization $Authorization -Ssl:$Ssl
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
