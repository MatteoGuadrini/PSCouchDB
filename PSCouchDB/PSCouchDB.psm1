# Native Powershell CouchDB class
class PSCouchDBDocument {
    <#
    .SYNOPSIS
    CouchDB document
    .DESCRIPTION
    Class than representing the CouchDB document
    .EXAMPLE
    using module PSCouchDB
    $doc = New-Object PSCouchDBDocument
    #>
    # Propetries
    [string] $_id
    [ValidatePattern('(^\d+\-\w{32})')]
    [string] $_rev
    [hashtable] $_attachments = @{}
    hidden [hashtable] $doc = @{}

    # Constructors
    # No specified _id
    PSCouchDBDocument () { 
        $this._id = (New-CouchDBUuids -Count 1).uuids[0]
        $this.doc.Add('_id', $this._id)
    }

    # Specified _id
    PSCouchDBDocument ([string]$_id) {
        $this._id = $_id
        $this.doc.Add('_id', $this._id)
    }

    # Specified _id and _rev
    PSCouchDBDocument ([string]$_id, [string]$_rev) {
        $this._id = $_id
        $this._rev = $_rev
        $this.doc.Add('_id', $this._id)
        $this.doc.Add('_rev', $this._rev)
    }

    # Specified _id, _rev and _attachments
    PSCouchDBDocument ([string]$_id, [string]$_rev, [PSCouchDBAttachment]$attachment) {
        $this._id = $_id
        $this._rev = $_rev
        $this._attachments.Add($attachment.filename, $attachment)
        $this.doc.Add('_id', $this._id)
        $this.doc.Add('_rev', $this._rev)
        $this.doc.Add('_attachments', @{})
        $this.doc._attachments.Add($attachment.filename, @{'content_type' = $attachment.content_type; 'data' = $attachment.data })
    }

    PSCouchDBDocument ([string]$_id, [string]$_rev, [string]$attachment) {
        $this._id = $_id
        $this._rev = $_rev
        $attach = New-Object -TypeName PSCouchDBAttachment -ArgumentList $attachment
        $this._attachments.Add($attach.filename, $attach)
        $this.doc.Add('_id', $this._id)
        $this.doc.Add('_rev', $this._rev)
        $this.doc.Add('_attachments', @{})
        $this.doc._attachments.Add($attach.filename, @{'content_type' = $attach.content_type; 'data' = $attach.data })
    }

    # Methods
    [hashtable] GetDocument () {
        return $this.doc
    }

    SetElement ([string]$key) {
        # Check key isn't _id
        if (-not($key -eq "_id")) { 
            $this.doc[$key] = $null
        } else {
            Write-Warning -Message "_id must have a value. _id unchanged."
        }
    }

    SetElement ([string]$key, $value) {
        if ($key -eq "_id") {
            $this._id = $value
        } elseif ($key -eq "_rev") {
            $this._rev = $value
        }
        $this.doc[$key] = $value
    }

    RemoveElement ([string]$key) {
        if ($this.doc.ContainsKey($key)) {
            $this.doc.Remove($key)
        } else {
            Write-Error -Message "Document element `"$key`" doesn't exists."
        }
    }

    [string] ToJson () {
        return $this.doc | ConvertTo-Json -Depth 10 -Compress:$false
    }

    [string] ToJson ([int]$depth) {
        return $this.doc | ConvertTo-Json -Depth $depth -Compress:$false
    }

    [string] ToJson ([int]$depth, [bool]$compress) {
        return $this.doc | ConvertTo-Json -Depth $depth -Compress:$compress
    }

    [hashtable] FromJson ([string]$json) {
        $body = ConvertFrom-Json -InputObject $json
        $body.psobject.properties | ForEach-Object {
            # Skip attachments
            if ($_.Name -eq '_attachments') { return }
            if ($_.Name -and $_.Value) {
                $this.SetElement($_.Name, $_.Value)
            } else {
                $this.SetElement($_.Name)
            }
        }
        if ($this.doc._id) { $this._id = $this.doc._id }
        if ($this.doc._rev) { $this._rev = $this.doc._rev }
        return $this.doc
    }

    AddAttachment ([PSCouchDBAttachment]$attachment) {
        $this._attachments.Add($attachment.filename, $attachment)
        if (-not($this.doc.ContainsKey('_attachments'))) {
            $this.doc.Add('_attachments', @{})
        }
        $this.doc._attachments.Add($attachment.filename, @{'content_type' = $attachment.content_type; 'data' = $attachment.data })
    }

    AddAttachment ([string]$attachment) {
        $attach = New-Object -TypeName PSCouchDBAttachment -ArgumentList $attachment
        $this._attachments.Add($attach.filename, $attach)
        if (-not($this.doc.ContainsKey('_attachments'))) {
            $this.doc.Add('_attachments', @{})
        }
        $this.doc._attachments.Add($attach.filename, @{'content_type' = $attach.content_type; 'data' = $attach.data })
    }

    ReplaceAttachment ([PSCouchDBAttachment]$attachment) {
        $this.RemoveAttachment($attachment.filename)
        $this.AddAttachment($attachment)
    }

    ReplaceAttachment ([string]$attachment) {
        $attach = New-Object -TypeName PSCouchDBAttachment -ArgumentList $attachment
        $this.RemoveAttachment($attach.filename)
        $this.AddAttachment($attach)
    }

    RemoveAttachment ([string]$attachment) {
        if ($this._attachments.ContainsKey($attachment)) {
            $this._attachments.Remove($attachment)
            $this.doc._attachments.Remove($attachment)
        }
    }

    RemoveAllAttachments () {
        if ($this.doc.ContainsKey('_attachments')) {
            $this._attachments = @{}
            if ($this.doc.ContainsKey('_attachments')) {
                $this.doc.Remove('_attachments')
            }
        }
    }
}

class PSCouchDBAttachment {
    <#
    .SYNOPSIS
    CouchDB document attachment
    .DESCRIPTION
    Class than representing the CouchDB document attachment
    .EXAMPLE
    using module PSCouchDB
    $attachment = New-Object PSCouchDBAttachment -ArgumentList "C:\test.txt"
    #>
    # Propetries
    [string] $filename
    [string] $content_type
    hidden $data

    # Constructors
    PSCouchDBAttachment ([string] $path) {
        if (Test-Path -Path $path) {
            # Get a filename
            $name = [System.IO.Path]::GetFileNameWithoutExtension($path)
            $extension = [System.IO.Path]::GetExtension($path)
            $this.filename = "$name$extension"
            # Get a content-type
            $this.content_type = [PSCouchDBAttachment]::ConfirmMime($this.filename)
            # Get data
            if ((Get-Item -Path $path).length -gt 0) {
                $bytes = [System.Text.Encoding]::UTF8.GetBytes((Get-Content -Path $path))
                $this.data = [System.Convert]::ToBase64String($bytes)
            } else {
                throw [System.IO.InvalidDataException] "$path attachment is empty."
            }
        } else {
            throw [System.IO.FileNotFoundException] "$path attachment not found."
        }
    }

    [string] GetData () {
        # Get data to string
        $bytes = [System.Convert]::FromBase64String($this.data)
        return [System.Text.Encoding]::UTF8.GetString($bytes)
    }

    SaveData ($file) {
        $this.GetData() | Out-File -FilePath $file -Encoding utf8
    }

    [string] static ConfirmMime ([string]$filename) {
        $extension = [System.IO.Path]::GetExtension($filename)
        $mime = switch ($extension) {
            # application MIME  
            ".exe" { "application/octet-stream"; break }
            ".bin" { "application/octet-stream"; break }
            ".pdf" { "application/pdf"; break }
            ".crt" { "application/pkcs8"; break }
            ".cer" { "application/pkcs8"; break }
            ".p7b" { "application/pkcs8"; break }
            ".pfx" { "application/pkcs8"; break }
            ".zip" { "application/zip"; break }
            ".7z" { "application/zip"; break }
            ".rar" { "application/zip"; break }
            ".tar" { "application/zip"; break }
            ".tar.gz" { "application/zip"; break }
            # audio MIME
            ".mp3" { "audio/mpeg"; break }
            ".mp4" { "audio/mpeg"; break }
            ".ogg" { "audio/vorbis"; break }
            ".vob" { "audio/vorbis"; break }
            # font MIME
            ".woff" { "font/woff"; break }
            ".ttf" { "font/ttf"; break }
            ".otf" { "font/otf"; break }
            # image MIME
            ".jpeg" { "image/jpeg"; break }
            ".jpg" { "image/jpeg"; break }
            ".png" { "image/png"; break }
            ".bmp" { "image/bmp"; break }
            ".svg" { "image/svg+xml"; break }
            ".heic" { "image/heic"; break }
            ".tiff" { "image/tiff"; break }
            ".wmf" { "image/wmf"; break }
            ".gif" { "image/gif"; break }
            ".webp" { "image/webp"; break }
            # model 3d MIME
            ".3mf" { "model/3mf"; break }
            ".vml" { "model/vml"; break }
            ".dwf" { "model/vnd.dwf"; break }
            # text MIME
            ".css" { "text/css"; break }
            ".csv" { "text/csv"; break }
            ".dns" { "text/dns"; break }
            ".html" { "text/html"; break }
            ".md" { "text/markdown"; break }
            ".rtf" { "text/rtf"; break }
            ".vcard" { "text/vcard"; break }
            ".xml" { "text/xml"; break }
            # video MIME
            ".3gpp" { "video/3gpp"; break }
            ".mpeg" { "video/mpeg4-generic"; break }
            ".avi" { "video/mpeg4-generic"; break }
            ".xvid" { "video/mpeg4-generic"; break }
            ".dvix" { "video/mpeg4-generic"; break }
            ".mpg" { "video/mpeg4-generic"; break }
            default {
                "multipart/form-data"; break
            }
        }
        return $mime
    }
}

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

class PSCouchDBView {
    <#
    .SYNOPSIS
    View object for CouchDB design document
    .DESCRIPTION
    Class than representing the CouchDB view; this object contains the view function and reduce.
    .EXAMPLE
    using module PSCouchDB
    $design_doc = New-Object PSCouchDBView -ArgumentList "view_name"
    #>
    # Properties
    [PSCustomObject] $view = @{}
    [string] $name
    [string] $map
    [ValidateSet('_approx_count_distinct', '_count', '_stats', '_sum')]
    [string] $reduce

    # Constructor
    PSCouchDBView ([string]$name) {
        $this.name = $name
        Add-Member -InputObject $this.view NoteProperty $this.name @{}
        $this.view."$($this.name)".Add('map', $null)
    }

    PSCouchDBView ([string]$name, [string]$map) {
        $this.name = $name
        $this.map = $map
        Add-Member -InputObject $this.view NoteProperty $this.name @{}
        $this.view."$($this.name)".Add('map', $map)
    }

    PSCouchDBView ([string]$name, [string]$map, [string]$reduce) {
        $this.name = $name
        $this.map = $map
        $this.reduce = $reduce
        Add-Member -InputObject $this.view NoteProperty $this.name @{}
        $this.view."$($this.name)".Add('map', $map)
        $this.view."$($this.name)".Add('reduce', $reduce)
    }

    # Methods
    [string] ToString () {
        return $this.GetJsonView()
    }

    [hashtable] GetView () {
        return $this.view."$($this.name)"
    }

    [string] GetJsonView () {
        return $this.view | ConvertTo-Json
    }

    AddMapFunction ([string]$function) {
        if ($null -eq $this.view."$($this.name)".map) {
            $this.map = $function
            $this.view."$($this.name)".map = $function
        } else {
            throw "Map function already exists! Use ReplaceMapFunction() for substitute it."
        }
    }

    ReplaceMapFunction ([string]$function) {
        $this.map = $function
        $this.view."$($this.name)".map = $function
    }

    RemoveMapFunction () {
        if ($null -ne $this.view."$($this.name)".map) {
            $this.map = $null
            $this.view."$($this.name)".map = $null
        } else {
            throw "Map function doesn't exists!"
        }
    }

    AddReduceFunction ([string]$function) {
        if ($null -eq $this.view."$($this.name)".reduce) {
            $this.reduce = $function
            $this.view."$($this.name)".reduce = $function
        } else {
            throw "Reduce function already exists! Use ReplaceReduceFunction() for substitute it."
        }
    }

    ReplaceReduceFunction ([string]$function) {
        $this.reduce = $function
        $this.view."$($this.name)".reduce = $function
    }

    RemoveReduceFunction () {
        if ($null -ne $this.view."$($this.name)".reduce) {
            $this.reduce = $null
            $this.view."$($this.name)".reduce = $null
        } else {
            throw "Reduce function doesn't exists!"
        }
    }

    static [string] BuildMapFunction ([hashtable] $condition) {
        <#
        possible CONDITION:
        @{
            EQUAL = 'doc.field1 == 0';  # Add if condition to function: if (doc.field1 == 0) {}
            EQUEMIT = 'doc.field1';     # Add emit function to if equal condition: if (doc.field1 == 0) {emit(doc.field1)}
            MINIMUM = 'doc.field1 < 0'; # Add if condition to function: if (doc.field1 < 0) {}
            MINEMIT = 'doc.field2';     # Add emit function to if equal condition: if (doc.field1 < 0) {emit(doc.field1)}
            MAXIMUM = 'doc.field1 > 0'; # Add if condition to function: if (doc.field1 > 0) {}
            MAXEMIT = 'doc.field3';     # Add emit function to if equal condition: if (doc.field1 > 0) {emit(doc.field1)}
            EMITDOC = "doc"             # If other emit is specified, this is null
        }
        #>
        $fun = "function(doc){{"
        # Substitute variable in hashtable; the pattern is {NAME}
        $currentIndex = 0
        $replacementList = @()
        if (-not($condition.ContainsKey('EMITDOC'))) {$condition.Add('EMITDOC', 'doc')}
        foreach($key in $condition.Keys){
            # Build function
            switch ($key) {
                'EQUAL' {if ($condition.ContainsKey('EQUEMIT')) {$fun += 'if ({EQUAL}) {{emit({EQUEMIT});}}'} else {$fun += 'if ({EQUAL}) {{emit({EMITDOC});}}'}}
                'MINIMUM' {if ($condition.ContainsKey('MINEMIT')) {$fun += 'if ({MINIMUM}) {{emit({MINEMIT});}}'} else {$fun += 'if ({MINIMUM}) {{emit({EMITDOC});}}'}}
                'MAXIMUM' {if ($condition.ContainsKey('MAXEMIT')) {$fun += 'if ({MAXIMUM}) {{emit({MAXEMIT});}}'} else {$fun += 'if ({MAXIMUM}) {{emit({EMITDOC});}}'}}
            }
            $inputPattern = '{(.*)' + $key + '(.*)}'
            $replacementPattern = '{${1}' + $currentIndex + '${2}}'
            $fun = $fun -replace $inputPattern,$replacementPattern
            $replacementList += $condition[$key]
            $currentIndex++
        }
        $fun += '}}'
        return $fun -f $replacementList
    }
}

class PSCouchDBDesignDoc : PSCouchDBDocument {
    <#
    .SYNOPSIS
    Native CouchDB design document
    .DESCRIPTION
    Class than representing the CouchDB design documents, are used to build indexes, validate document updates, format query results, and filter replications.
    .EXAMPLE
    using module PSCouchDB
    $design_doc = New-Object PSCouchDBDesignDoc
    #>
    # Properties
    $views
    [ValidatePattern("\(\s?newDoc\s?,\s?oldDoc\s?,\s?userCtx\s?,\s?secObj\s?\)")]
    [string] $validate_doc_update
    hidden [string] $language = 'javascript'

    # Constructor
    PSCouchDBDesignDoc () {
        $this._id = "_design/$((New-CouchDBUuids -Count 1).uuids[0])"
        $this.views = New-Object Collections.Generic.List[PSCouchDBView]
        $this.doc['_id'] = $this._id
        $this.doc.Add('views', @{})
    }

    # Specified _id
    PSCouchDBDesignDoc ([string]$_id) {
        if ($_id -match '_design/') {
            $this._id = $_id
        } else {
            $this._id = "_design/$_id"
        }
        $this.views = New-Object Collections.Generic.List[PSCouchDBView]
        $this.doc['_id'] = $this._id
    }

    # Specified _id and _rev
    PSCouchDBDesignDoc ([string]$_id, [string]$_rev) {
        if ($_id -match '_design/') {
            $this._id = $_id
        } else {
            $this._id = "_design/$_id"
        }
        $this._rev = $_rev
        $this.views = New-Object Collections.Generic.List[PSCouchDBView]
        $this.doc['_id'] = $this._id
        $this.doc['_rev'] = $this._rev
    }

    # Specified _id, _rev and _attachments
    PSCouchDBDesignDoc ([string]$_id, [string]$_rev, [PSCouchDBView]$view) {
        if ($_id -match '_design/') {
            $this._id = $_id
        } else {
            $this._id = "_design/$_id"
        }
        $this._rev = $_rev
        $this.views = New-Object Collections.Generic.List[PSCouchDBView]
        $this.views.Add($view)
        $this.doc['_id'] = $this._id
        $this.doc['_rev'] = $this._rev
        $this.doc.Add('views', @{})
        $this.doc.views.Add($view.name, $view.GetView())
    }

    # Methods
    AddView ([PSCouchDBView]$view) {
        if ($this.views -notcontains $view) {
            [void] $this.views.Add($view)
            if (-not($this.doc.ContainsKey('views'))) {$this.doc.Add('views', @{})}
            $this.doc.views.Add($view.name, $view.GetView())
        }
    }

    AddView ([string]$name, [string]$map) {
        $view = New-Object PSCouchDBView -ArgumentList $name, $map
        $this.AddView($view)
    }

    AddView ([string]$name, [string]$map, [string]$reduce) {
        $view = New-Object PSCouchDBView -ArgumentList $name, $map, $reduce
        $this.AddView($view)
    }

    RemoveView ([string]$name) {
        if ($this.views.name -contains $name) {
            foreach ($view in $this.views) {
                if ($view.name -eq $name) {
                    [void] $this.views.Remove($view)
                    $this.doc.views.Remove($name)
                    break
                }
            }
        }
    }

    ReplaceView ([PSCouchDBView]$view) {
        $this.RemoveView($view.name)
        $this.AddView($view)
    }

    ReplaceView ([string]$name, [string]$map) {
        $view = New-Object PSCouchDBView -ArgumentList $name, $map
        $this.RemoveView($view.name)
        $this.AddView($view)
    }

    ReplaceView ([string]$name, [string]$map, [string]$reduce) {
        $view = New-Object PSCouchDBView -ArgumentList $name, $map, $reduce
        $this.RemoveView($view.name)
        $this.AddView($view)
    }

    SetValidateFunction ([string]$function) {
        $this.validate_doc_update = $function
        $this.doc.Add("validate_doc_update", $function)
    }
}

class PSCouchDBBulkDocument {
    <#
    .SYNOPSIS
    CouchDB bulk document
    .DESCRIPTION
    Class than representing the CouchDB bulk document
    .EXAMPLE
    using module PSCouchDB
    $bdocs = New-Object PSCouchDBBulkDocument -ArgumentList '{"_id":"test","name":"test"}'
    # for multiple docs
    $doc120 = New-Object PSCouchDBDocument -ArgumentList '120'
    $doc121 = New-Object PSCouchDBDocument -ArgumentList '121'
    $doc122 = New-Object PSCouchDBDocument -ArgumentList '122'
    $bdocs = [PSCouchDBBulkDocument]@{docs=@($doc120,$doc121,$doc122)}
    #>  
    # Propetries
    [PSCouchDBDocument[]] $docs

    # Constructor
    PSCouchDBBulkDocument () {
        $this.docs = @()
    }

    PSCouchDBBulkDocument ([PSCouchDBDocument] $doc) {
        $this.docs = @()
        $this.docs += $doc
    }

    PSCouchDBBulkDocument ([string] $doc) {
        $this.docs = @()
        $addDoc = New-Object -TypeName PSCouchDBDocument
        [void] $addDoc.FromJson($doc)
        $this.docs += $addDoc
    }

    PSCouchDBBulkDocument ([PSCouchDBDocument[]] $docs) {
        $this.docs = $docs
    }

    # Method
    AddDocument ([string] $doc) {
        $addDoc = New-Object -TypeName PSCouchDBDocument
        [void] $addDoc.FromJson($doc)
        $this.docs += $addDoc
    }

    AddDocument ([PSCouchDBDocument] $doc) {
        $this.docs += $doc
    }

    RemoveDocument ([string] $_id) {
        $this.docs = $this.docs | Where-Object { $_._id -ne $_id }
    }

    SetDeleted () {
        foreach ($doc in $this.docs) {
            $doc.SetElement("_deleted", $true)
        }
    }

    [PSCouchDBDocument[]] GetDocuments () {
        return $this.docs
    }

    [string] ToString () {
        [hashtable] $documents = @{docs = @()}
        foreach ($doc in $this.docs) {
            $documents.docs += $doc.GetDocument()
        }
        return $documents | ConvertTo-Json -Depth 99
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

function Search-CouchDBHelp () {
    <#
    .SYNOPSIS
    Search help.
    .DESCRIPTION
    Search pattern keyword in a CouchDB help topic.
    .PARAMETER Pattern
    The pattern of serach criteria. The pattern it can be a verb, a nuoun or a parameter.
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

function New-CouchDBObject () {
    <#
    .SYNOPSIS
    Create a PSCouchDB custom object.
    .DESCRIPTION
    Create a PSCouchDB custom object. For example create a
    document object, design document object, attachment object etc...
    .PARAMETER TypeName
    The name of the object than you would create.
    .PARAMETER ArgumentList
    The argument of constructor of object.
    .EXAMPLE
    New-CouchDBObject -TypeName PSCouchDBDocument -ArgumentList '1-0033838372622627'
    .EXAMPLE
    New-CouchDBObject -TypeName PSCouchDBDocument -ArgumentList '1-0033838372622627','1-2c903913030efb4d711db085b1f44107'
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/classes.html
    #>
    param(
    [string] $TypeName,
    [array] $ArgumentList
    )
    return New-Object -TypeName $TypeName -ArgumentList $ArgumentList
}