# Global preferences
[bool] $Global:CouchDBCachePreference = $false
[bool] $Global:CouchDBSaveCredentialPreference = $true

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

    SetDocumentId ([string]$id) {
        $this.doc['_id'] = $id
        $this._id = $id
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

    [byte[]] GetRawData () {
        return [System.Convert]::FromBase64String($this.data)
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
        if (-not($condition.ContainsKey('EMITDOC'))) { $condition.Add('EMITDOC', 'doc') }
        foreach ($key in $condition.Keys) {
            # Build function
            switch ($key) {
                'EQUAL' { if ($condition.ContainsKey('EQUEMIT')) { $fun += 'if ({EQUAL}) {{emit({EQUEMIT});}}' } else { $fun += 'if ({EQUAL}) {{emit({EMITDOC});}}' } }
                'MINIMUM' { if ($condition.ContainsKey('MINEMIT')) { $fun += 'if ({MINIMUM}) {{emit({MINEMIT});}}' } else { $fun += 'if ({MINIMUM}) {{emit({EMITDOC});}}' } }
                'MAXIMUM' { if ($condition.ContainsKey('MAXEMIT')) { $fun += 'if ({MAXIMUM}) {{emit({MAXEMIT});}}' } else { $fun += 'if ({MAXIMUM}) {{emit({EMITDOC});}}' } }
            }
            $inputPattern = '{(.*)' + $key + '(.*)}'
            $replacementPattern = '{${1}' + $currentIndex + '${2}}'
            $fun = $fun -replace $inputPattern, $replacementPattern
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
            if (-not($this.doc.ContainsKey('views'))) { $this.doc.Add('views', @{}) }
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
        [hashtable] $documents = @{docs = @() }
        foreach ($doc in $this.docs) {
            $documents.docs += $doc.GetDocument()
        }
        return $documents | ConvertTo-Json -Depth 99
    }
}

class PSCouchDBSecurity {
    <#
    .SYNOPSIS
    CouchDB security database document
    .DESCRIPTION
    Class than representing the CouchDB security database document
    .EXAMPLE
    using module PSCouchDB
    $sec = New-Object PSCouchDBSecurity -ArgumentList 'myadmin'
    # Multiple names or roles
    $sec = [PSCouchDBSecurity]@{admins=@{names=@('myadmin','admin'); roles=@('admin')}}
    $sec = [PSCouchDBSecurity]@{admins=@{names=@('myadmin','admin'); roles=@('admin')}; members=@{names=@('reader','member1'); roles=@('read', 'access')}}
    #>
    # Propetries
    [pscustomobject] $admins = @{
        roles = @()
        names = @()
    }

    [pscustomobject] $members = @{
        roles = @()
        names = @()
    }

    # Constructor
    PSCouchDBSecurity () {}

    PSCouchDBSecurity ([string]$adminName) { $this.admins.names += $adminName }

    PSCouchDBSecurity ([string]$adminName, [string]$adminRoles) { 
        $this.admins.names += $adminName
        $this.admins.roles += $adminRoles
    }

    PSCouchDBSecurity ([string]$adminName, [string]$adminRole, [string]$memberName) { 
        $this.admins.names += $adminName
        $this.admins.roles += $adminRole
        $this.members.names += $memberName
    }

    PSCouchDBSecurity ([string]$adminName, [string]$adminRole, [string]$memberName, [string]$memberRole) { 
        $this.admins.names += $adminName
        $this.admins.roles += $adminRole
        $this.members.names += $memberName
        $this.members.roles += $memberRole
    }

    PSCouchDBSecurity ([array]$adminsNames, [array]$adminsRoles) { 
        $this.admins.names = $adminsNames
        $this.admins.roles = $adminsRoles
    }

    PSCouchDBSecurity ([array]$adminsNames, [array]$adminsRoles, [array]$membersNames, [array]$membersRoles) { 
        $this.admins.names = $adminsNames
        $this.admins.roles = $adminsRoles
        $this.members.names = $membersNames
        $this.members.roles = $membersRoles
    }

    # Method
    [hashtable] GetAdmins () {
        return $this.admins
    }

    [hashtable] GetMembers () {
        return $this.members
    }

    [string] ToJson () {
        return $this | ConvertTo-Json
    }

    [string] ToString () {
        return $this.ToJson()
    }

    AddAdmins ([string]$name) {
        $this.admins.names += $name
    }

    AddAdmins ([array]$name) {
        $this.admins.names = $this.admins.names + $name
    }

    AddAdmins ([string]$name, [string]$role) {
        $this.admins.names += $name
        $this.admins.roles += $role
    }

    AddAdmins ([array]$name, [array]$role) {
        $this.admins.names = $this.admins.names + $name
        $this.admins.roles = $this.admins.roles + $role
    }

    AddMembers ([string]$name) {
        $this.members.names += $name
    }

    AddMembers ([array]$name) {
        $this.members.names = $this.admins.names + $name
    }

    AddMembers ([string]$name, [string]$role) {
        $this.members.names += $name
        $this.members.roles += $role
    }

    AddMembers ([array]$name, [array]$role) {
        $this.members.names = $this.members.names + $name
        $this.members.roles = $this.members.roles + $role
    }

    RemoveAdminName ([string]$name) {
        [array] $this.admins.names = $this.admins.names | Where-Object { $_ -ne $name }
    }

    RemoveAdminRole ([string]$role) {
        [array] $this.admins.roles = $this.admins.roles | Where-Object { $_ -ne $role }
    }

    RemoveMemberName ([string]$name) {
        [array] $this.members.names = $this.members.names | Where-Object { $_ -ne $name }
    }

    RemoveMemberRole ([string]$role) {
        [array] $this.members.roles = $this.members.roles | Where-Object { $_ -ne $role }
    }
}

class PSCouchDBReplication {
    <#
    .SYNOPSIS
    CouchDB replication database document
    .DESCRIPTION
    Class than representing the CouchDB replication database document
    .EXAMPLE
    using module PSCouchDB
    # local replication
    $rep = New-Object PSCouchDBReplication -ArgumentList 'db','repdb'
    # remote replication
    $rep = New-Object PSCouchDBReplication -ArgumentList 'db','repdb', 'remoteserver'
    #>
    # Propetries
    [string] $_id
    [ValidatePattern('(^\d+\-\w{32})')]
    [string] $_rev
    [System.UriBuilder] $source
    [System.UriBuilder] $target
    hidden [bool] $cancel
    hidden [int] $checkpoint_interval = 0
    [bool] $continuous
    hidden [bool] $create_target
    hidden [array] $doc_ids = @()
    [ValidatePattern('(^\w+\/\w+)')]
    hidden [string] $filter
    hidden [string] $source_proxy
    hidden [string] $target_proxy
    hidden [hashtable] $query_params
    hidden [string] $selector
    hidden [string] $since_seq
    hidden [bool] $use_checkpoints
    hidden [hashtable] $replicator = @{}

    # Constuctor
    PSCouchDBReplication ([string]$sourceDb, [string]$targetDb) {
        $this._id = "${sourceDb}_${targetDb}"
        $this.source = "http://localhost:5984/$sourceDb"
        $this.target = "http://localhost:5984/$targetDb"
        $this.replicator.Add('_id', $this._id)
        $this.replicator.Add('source', [uri] $this.source.Uri)
        $this.replicator.Add('target', [uri] $this.target.Uri)
    }

    PSCouchDBReplication ([string]$sourceDb, [string]$targetDb, [string]$targetServer) {
        $this._id = "${sourceDb}_${targetDb}"
        $this.source = "http://localhost:5984/$sourceDb"
        $this.target = "http://${targetServer}:5984/$targetDb"
        $this.replicator.Add('_id', $this._id)
        $this.replicator.Add('source', [uri] $this.source.Uri)
        $this.replicator.Add('target', [uri] $this.target.Uri)
    }

    # Method
    SetRevision ([string]$revision) {
        $this._rev = $revision
        $this.replicator.Add('_rev', $this._rev)
    }

    AddSourceAuthentication ([string]$user, [string]$passwd) {
        $this.source.UserName = "${user}:${passwd}"
        $this.replicator['source'] = [uri] $this.source.Uri
    }

    AddTargetAuthentication ([string]$user, [string]$passwd) {
        $this.target.UserName = "${user}:${passwd}"
        $this.replicator['target'] = [uri] $this.target.Uri
    }

    SetSourceSsl () {
        $this.source.Scheme = "https"
        $this.source.Port = 6984
        $this.replicator['source'] = [uri] $this.source.Uri
    }

    SetSourceSsl ([int]$port) {
        $this.source.Scheme = "https"
        $this.source.Port = $port
        $this.replicator['source'] = [uri] $this.source.Uri
    }

    SetTargetSsl () {
        $this.target.Scheme = "https"
        $this.target.Port = 6984
        $this.replicator['target'] = [uri] $this.target.Uri
    }

    SetTargetSsl ([int]$port) {
        $this.target.Scheme = "https"
        $this.target.Port = $port
        $this.replicator['target'] = [uri] $this.target.Uri
    }

    SetSourceServer ([string]$server) {
        $this.source.Host = $server
        $this.replicator['source'] = [uri] $this.source.Uri
    }

    SetTargetServer ([string]$server) {
        $this.target.Host = $server
        $this.replicator['target'] = [uri] $this.target.Uri
    }

    SetCancel () { 
        $this.cancel = $true
        $this.replicator.Add('cancel', $this.cancel)
    }

    SetCheckpointInterval ([int]$ms) { 
        $this.checkpoint_interval = $ms
        $this.replicator.Add('checkpoint_interval', $this.checkpoint_interval)
    }

    SetContinuous () { 
        $this.continuous = $true
        $this.replicator.Add('continuous', $this.continuous)
    }

    CreateTarget () { 
        $this.create_target = $true
        $this.replicator.Add('create_target', $this.create_target)
    }

    AddDocIds ([array]$ids) { 
        $this.doc_ids += $this.doc_ids + $ids
        $this.replicator.Add('doc_ids', $this.doc_ids)
    }

    SetFilter ([string]$filter) { 
        $this.filter = $filter
        $this.replicator.Add('filter', $this.filter)
    }

    SetSourceProxy ([string]$proxyUri) { 
        $this.source_proxy = $proxyUri
        $this.replicator.Add('source_proxy', [uri] $this.source_proxy)
    }

    SetTargetProxy ([string]$proxyUri) { 
        $this.target_proxy = $proxyUri
        $this.replicator.Add('target_proxy', [uri] $this.target_proxy)
    }

    SetQueryParams ([hashtable]$paramaters) { 
        $this.query_params = $paramaters
        $this.replicator.Add('query_params', $this.query_params)
    }

    SetSelector ([string]$selector) { 
        $this.selector = $selector
        $this.replicator.Add('selector', $this.selector)
    }

    SetSelector ([PSCouchDBQuery]$selector) { 
        $this.selector = $selector.GetNativeQuery()
        $this.replicator.Add('selector', $this.selector)
    }

    SetSinceSequence ([string]$sequence) { 
        $this.since_seq = $sequence
        $this.replicator.Add('since_seq', $this.since_seq)
    }

    UseCheckpoints () { 
        $this.use_checkpoints = $true
        $this.replicator.Add('use_checkpoints', $this.use_checkpoints)
    }

    [hashtable] GetDocument () {
        return $this.replicator
    }

    [string] ToJson () {
        return $this.GetDocument() | ConvertTo-Json -Depth 5
    }

    [string] ToString () {
        return $this.ToJson()
    }

}

class PSCouchDBRequest {
    <#
    .SYNOPSIS
    CouchDB web request
    .DESCRIPTION
    Class than representing the CouchDB web request
    .EXAMPLE
    using module PSCouchDB
    # Get database info
    $req = New-Object PSCouchDBRequest -ArgumentList 'db'
    # GET http://localhost:5984/db
    $req.Request()
    # remote replication
    $req = New-Object PSCouchDBRequest -ArgumentList 'db','doc'
    # GET http://localhost:5984/db/doc
    $req.Request()
    #>
    # Propetries
    [System.UriBuilder] $uri
    [ValidateSet("HEAD", "GET", "PUT", "DELETE", "POST")]
    [string] $method = 'GET'
    [string] $protocol = 'http'
    [string] $server = 'localhost'
    [int] $port = 5984
    [string] $database
    [string] $document
    [PSCouchDBAttachment] $attachment
    [PSCredential] $authorization
    [string] $parameter
    [string] $data
    hidden [bool] $cache
    hidden [System.Net.WebRequest] $client
    hidden [System.Net.WebProxy] $proxy

    # Constructor
    PSCouchDBRequest () {
        # Add uri
        $this.uri = "{0}://{1}:{2}" -f $this.protocol, $this.server, $this.port
        Add-Member -InputObject $this.uri LastStatusCode 0
    }

    PSCouchDBRequest ([string]$database) {
        # Add uri
        $this.uri = "{0}://{1}:{2}/{3}" -f $this.protocol, $this.server, $this.port, $database
        $this.database = $database
        Add-Member -InputObject $this.uri LastStatusCode 0
    }

    PSCouchDBRequest ([string]$database, [string]$document) {
        # Add uri
        $this.uri = "{0}://{1}:{2}/{3}/{4}" -f $this.protocol, $this.server, $this.port, $database, $document
        $this.database = $database
        $this.document = $document
        Add-Member -InputObject $this.uri LastStatusCode 0
    }

    # Method
    [PSCustomObject] Request () {
        # Create web client
        $this.client = [System.Net.WebRequest]::Create($this.uri.Uri)
        $this.client.ContentType = "application/json; charset=utf-8";
        $this.client.Method = $this.method
        $this.client.UserAgent = "User-Agent: PSCouchDB (compatible; MSIE 7.0;)"
        # Check proxy
        if ($this.proxy) {
            $this.client.Proxy = $this.proxy
        }
        # Check authorization
        if ($this.authorization) {
            $base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(("$($this.uri.UserName):$($this.uri.Password)")))
            $this.client.Headers.Add("Authorization", ("Basic {0}" -f $base64AuthInfo))
        }
        # Check data
        if ($this.data -or $this.attachment) {
            $Stream = $this.client.GetRequestStream()
            if ($this.data) {
                $Body = [byte[]][char[]]$this.data
                $Stream.Write($Body, 0, $Body.Length)
            }
            # Check attachment
            elseif ($this.attachment) {
                $this.client.ContentType = $this.attachment.content_type
                $Body = [byte[]]$this.attachment.GetRawData()
                $Stream.Write($Body, 0, $Body.Length)
            }
            $Stream.Close()
        }
        try {
            [System.Net.WebResponse] $resp = $this.client.GetResponse()
            $this.uri.LastStatusCode = $resp.StatusCode
        } catch [System.Net.WebException] {
            [System.Net.HttpWebResponse] $errcode = $_.Exception.Response
            $this.uri.LastStatusCode = $errcode.StatusCode
            throw ([PSCouchDBRequestException]::new($errcode.StatusCode)).CouchDBMessage
        }
        $rs = $resp.GetResponseStream()
        [System.IO.StreamReader] $sr = New-Object System.IO.StreamReader -ArgumentList $rs
        [string] $results = $sr.ReadToEnd()
        $resp.Close()
        # Check cache
        if ($this.cache) {
            $cached = ($results | ConvertFrom-Json)
            [void]$this.uri.Cache.Add($cached)
        }
        if ($results -match "^({.*)|(\[.*)$") {
            return $results | ConvertFrom-Json
        } else {
            return [PSCustomObject]@{ results = $results }
        }
    }

    RequestAsJob ([string]$name) {
        $job = Start-Job -Name $name {
            param($uri, $method, $user, $pass, $data, $attachment)
            # Create web client
            $Request = [System.Net.WebRequest]::Create($uri)
            $Request.ContentType = "application/json; charset=utf-8";
            $Request.Method = $method
            $Request.UserAgent = "User-Agent: PSCouchDB (compatible; MSIE 7.0;)"
            # Check proxy
            if ($this.proxy) {
                $this.client.Proxy = $this.proxy
            }
            # Check authorization
            if ($user -and $pass) {
                $base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(("${user}:${pass}")))
                $Request.Headers.Add("Authorization", ("Basic {0}" -f $base64AuthInfo))
            }
            # Check data
            if ($data -or $attachment) {
                $Stream = $Request.GetRequestStream()
                if ($data) {
                    $Body = [byte[]][char[]]$data
                    $Stream.Write($Body, 0, $Body.Length)
                }
                # Check attachment
                elseif ($attachment) {
                    $Request.ContentType = $ttachment.content_type
                    $Body = [byte[]]$attachment.GetRawData()
                    $Stream.Write($Body, 0, $Body.Length)
                }
                $Stream.Close()
            }
            try {
                [System.Net.WebResponse] $resp = $Request.GetResponse()
            } catch [System.Net.WebException] {
                [System.Net.HttpWebResponse] $errcode = $_.Exception.Response
                throw "[$($errcode.StatusCode)] Error."
            }
            $rs = $resp.GetResponseStream()
            [System.IO.StreamReader] $sr = New-Object System.IO.StreamReader -ArgumentList $rs
            [string] $results = $sr.ReadToEnd()
            $resp.Close()
            if ($results -match "^({.*)|(\[.*)$") {
                return $results | ConvertFrom-Json
            } else {
                return [PSCustomObject]@{ results = $results }
            }
        } -ArgumentList $this.uri.Uri, $this.method, $(if ($this.authorization) {$this.authorization.UserName} else {$null}), $(if ($this.authorization) {$this.authorization.GetNetworkCredential().Password} else {$null}), $this.data, $this.attachment
        Register-TemporaryEvent $job "StateChanged" -Action {
            Write-Host -ForegroundColor Green "#$($sender.Id) ($($sender.Name)) complete."
        }
    }

    [string] GetHeader () {
        # Create web client
        $this.client = [System.Net.WebRequest]::Create($this.uri.Uri)
        $this.client.ContentType = "application/json; charset=utf-8";
        $this.client.Method = 'HEAD'
        $this.client.UserAgent = "User-Agent: PSCouchDB (compatible; MSIE 7.0;)"
        # Check proxy
        if ($this.proxy) {
            $this.client.Proxy = $this.proxy
        }
        # Check authorization
        if ($this.authorization) {
            $base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(("$($this.uri.UserName):$($this.uri.Password)")))
            $this.client.Headers.Add("Authorization", ("Basic {0}" -f $base64AuthInfo))
        }
        try {
            [System.Net.WebResponse] $resp = $this.client.GetResponse()
            $this.uri.LastStatusCode = $resp.StatusCode
        } catch [System.Net.WebException] {
            [System.Net.HttpWebResponse] $errcode = $_.Exception.Response
            $this.uri.LastStatusCode = $errcode.StatusCode
            throw ([PSCouchDBRequestException]::new($errcode.StatusCode)).CouchDBMessage
        }
        return $resp.Headers.ToString()
    }

    SetProxy ([string]$uri) {
        $proxyUri = [uri]$uri
        $this.proxy = New-Object System.Net.WebProxy
        $this.proxy.Address = $proxyUri
        $this.proxy.BypassProxyOnLocal = $true
    }

    SetProxy ([string]$uri, [string]$user, [string]$pass) {
        $proxyUri = [uri]$uri
        $this.proxy = New-Object System.Net.WebProxy
        $this.proxy.Credentials = [System.Net.NetworkCredential]::new($user, $pass)
        $this.proxy.Address = $proxyUri
        $this.proxy.BypassProxyOnLocal = $true
    }

    SetProxy ([string]$uri, [PSCredential]$credential) {
        $auth = $credential.UserName, $credential.GetNetworkCredential().Password
        $this.SetProxy($uri, $auth[0], $auth[1])
    }

    RemoveProxy () {
        $this.proxy = $null
    }

    SetSsl () {
        $this.protocol = 'https'
        $this.uri.Scheme = 'https'
        $this.SetPort(6984)
    }

    SetSsl ([int]$port) {
        $this.protocol = 'https'
        $this.uri.Scheme = 'https'
        $this.SetPort($port)
    }

    SetPort ([int]$port) {
        $this.port = $port
        $this.uri.Port = $port
    }

    SetServer ([string]$server) {
        $this.server = $server
        $this.uri.Host = $server
    }

    AddAuthorization ([PSCredential]$credential) {
        $this.authorization = $credential
        $this.uri.UserName = "$($credential.UserName):$($credential.GetNetworkCredential().Password)"
    }

    AddAuthorization ([string]$auth) {
        # Check if string is in this format: word:word
        if ($auth -match "^\w+\:\w+$") {
            $newAuth = $auth -split ":"
            [SecureString]$secStringPassword = ConvertTo-SecureString $newAuth[1] -AsPlainText -Force
            [PSCredential]$credOject = New-Object System.Management.Automation.PSCredential ($newAuth[0], $secStringPassword)
            $this.AddAuthorization($credOject)
        } else {
            throw [System.Text.RegularExpressions.RegexMatchTimeoutException]::New('Authorization string must be this format: "user:password"') 
        }
    }

    SetMethod ([string]$method) {
        $this.method = $method
    }

    SetDatabase ([string]$database) {
        $this.database = $database
        $path = "/{0}" -f $database
        $this.uri.Path = $path
    }

    SetDocument ([string]$document) {
        if ($this.database) {
            $this.document = $document
            $path = "/{0}/{1}" -f $this.database, $document
            $this.uri.Path = $path
        } else {
            throw [System.Net.WebException] "Database isn't set."
        }
    }

    SetParameter ([array]$parameter) {
        if ($this.database) {
            $this.parameter = $parameter -join '&'
            $this.uri.Query = $this.parameter
        } else {
            throw [System.Net.WebException] "Database isn't set."
        }
    }

    SetData ([string]$json) {
        $this.data = $json
    }

    AddAttachment ([string]$file) {
        if ($this.document) {
            $attach = New-Object -TypeName PSCouchDBAttachment -ArgumentList $file
            $path = "/{0}/{1}/{2}" -f $this.database, $this.document, $attach.filename
            $this.uri.Path = $path
            $this.attachment = $attach
        } else {
            throw [System.Net.WebException] "Document isn't set."
        }
    }

    [string] GetData () {
        return $this.data
    }

    [int] GetStatus () {
        return $this.uri.LastStatusCode
    }

    EnableCache () {
        $this.cache = $true
        $c = New-Object System.Collections.ArrayList
        Add-Member -InputObject $this.uri Cache $c
    }

    DisableCache () {
        $this.cache = $false
    }

    ClearCache () {
        $this.uri.Cache = New-Object System.Collections.ArrayList
    }

    [uri] GetUri () {
        return $this.uri.Uri
    }

    [string] ToString () {
        $str = "
{0} {1}
Host: {2}:{3}
Param: {4}

{5}" -f $this.method, $this.uri.Path, $this.server, $this.port, $this.uri.Query, $this.data
        return $str
    }
}

# CouchDB exception class

class PSCouchDBRequestException : System.Exception {
    [string] $CouchDBMessage
    [int] $CouchDBStausCode

    PSCouchDBRequestException([int]$statusCode) {
        $this.CouchDBStausCode = $statusCode
        switch ($this.CouchDBStausCode) {
            304 { $this.CouchDBMessage = "[$($this.CouchDBStausCode)] Not Modified: The additional content requested has not been modified." }
            400 { $this.CouchDBMessage = "[$($this.CouchDBStausCode)] Bad Request: Bad request structure. The error can indicate an error with the request URL, path or headers." }
            401 { $this.CouchDBMessage = "[$($this.CouchDBStausCode)] Unauthorized: The item requested was not available using the supplied authorization, or authorization was not supplied." }
            403 { $this.CouchDBMessage = "[$($this.CouchDBStausCode)] Forbidden: The requested item or operation is forbidden." }
            404 { $this.CouchDBMessage = "[$($this.CouchDBStausCode)] Not Found: The requested content could not be found." }
            405 { $this.CouchDBMessage = "[$($this.CouchDBStausCode)] Method Not Allowed: A request was made using an invalid HTTP request type for the URL requested." }
            406 { $this.CouchDBMessage = "[$($this.CouchDBStausCode)] Not Acceptable: The requested content type is not supported by the server." }
            409 { $this.CouchDBMessage = "[$($this.CouchDBStausCode)] Conflict: Request resulted in an update conflict." }
            412 { $this.CouchDBMessage = "[$($this.CouchDBStausCode)] Precondition Failed: The request headers from the client and the capabilities of the server do not match." }
            413 { $this.CouchDBMessage = "[$($this.CouchDBStausCode)] Request Entity Too Large: A document exceeds the configured couchdb/max_document_size value or the entire request exceeds the httpd/max_http_request_size value." }
            415 { $this.CouchDBMessage = "[$($this.CouchDBStausCode)] Unsupported Media Type: The content types supported, and the content type of the information being requested or submitted indicate that the content type is not supported." }
            416 { $this.CouchDBMessage = "[$($this.CouchDBStausCode)] Requested Range Not Satisfiable: The range specified in the request header cannot be satisfied by the server." }
            417 { $this.CouchDBMessage = "[$($this.CouchDBStausCode)] Expectation Failed: The bulk load operation failed." }
            { $this.CouchDBStausCode -ge 500 } { $this.CouchDBMessage = "[$($this.CouchDBStausCode)] Internal Server Error: The request was invalid, either because the supplied JSON was invalid, or invalid information was supplied as part of the request." }
            Default { $this.CouchDBMessage = "[$($this.CouchDBStausCode)] Unknown Error: something wrong." }
        }
    }
}

# Functions of CouchDB module

function Send-CouchDBRequest {
    <#
    .SYNOPSIS
    Send a request through rest method to CouchDB server.
    .DESCRIPTION
    This command builds the url, data and send to CouchDB server.
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
    Can specified PSCredential.
    This takes part in the url here: 
    http://{authorization}@localhost:5984.
    .PARAMETER Revision
    The CouchDB revision document.
    The revision document format like this: {count}-{uuid}
    2-b91bb807b4685080c6a651115ff558f5
    This takes part in the url here: 
    http://localhost:5984/db/doc?rev={revision}.
    .PARAMETER Params
    The CouchDB other parameter.
    This takes part in the url here:
    http://localhost:5984/db/doc?{param}
    http://localhost:5984/db/doc?{param}={value}.
    .PARAMETER Attachment
    The CouchDB document attachment.
    .PARAMETER Data
    The CouchDB document data. Is a Json data format.
    The encoding is UTF-8.
    .PARAMETER Ssl
    Set ssl connection on CouchDB server.
    This modify protocol to https and port to 6984.
    https://localhost:6984.
    .PARAMETER JobName
    JobName for background powershell job.
    To get a result for a Job, run "Get-Job -Id <number> | Receive-Job -Keep"
    .PARAMETER ProxyServer
    Proxy server through which all non-local calls pass.
    Ex. ... -ProxyServer 'http://myproxy.local:8080' ...
    .PARAMETER ProxyCredential
    Proxy server credential. It must be specified with a PSCredential object.
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
    https://pscouchdb.readthedocs.io/en/latest/classes.html#pscouchdbrequest-class
    #>
    [CmdletBinding()]
    param (
        [ValidateSet("HEAD", "GET", "PUT", "DELETE", "POST")] [string] $Method,
        [string] $Server,
        [int] $Port,
        [string] $Database,
        [string] $Document,
        $Authorization,
        [string] $Revision,
        [string] $Attachment,
        [string] $Data,
        [array] $Params,
        [switch] $Ssl,
        [string] $JobName,
        [string] $ProxyServer,
        [pscredential] $ProxyCredential
    )
    # Create PSCouchDBRequest object
    $req = New-Object PSCouchDBRequest
    $parameters = @()
    # Set cache
    if ($Global:CouchDBCachePreference) {
        $req.EnableCache()
    }
    if ($Server) {
        Write-Verbose -Message "Set server to $Server"
        $req.SetServer($Server)
    }
    # Set proxy server
    if ($ProxyServer) {
        if ($ProxyCredential -is [pscredential]) {
            Write-Verbose -Message "Set proxy server $ProxyServer with credential"
            $req.SetProxy($ProxyServer, $ProxyCredential)
        } else {
            Write-Verbose -Message "Set proxy server $ProxyServer"
            $req.SetProxy($ProxyServer)
        }
    }
    # Set protocol
    if ($Ssl.IsPresent) {
        # Set default port
        Write-Verbose -Message "Enable SSL on port 6984"
        $req.SetSsl()
    }
    # Set port
    if ($Port) {
        Write-Verbose -Message "Set port on $Port"
        $req.SetPort($Port)
    }
    # Set method
    switch ($Method) {
        "HEAD" { $req.SetMethod("HEAD") }
        "GET" { $req.SetMethod("GET") }
        "PUT" { $req.SetMethod("PUT") }
        "DELETE" { $req.SetMethod("DELETE") }
        "POST" { $req.SetMethod("POST") }
        Default { $req.SetMethod("GET") }
    }
    Write-Verbose -Message "Set method to $($req.method)"
    # Set database
    if ($Database) {
        if ($Database -match "\?") {
            $arr = $Database -split "\?"
            $Database = $arr[0]
            $Param = $arr[1]
            if ($Param) {
                $parameters += $Param
            }
        }
        Write-Verbose -Message "Set database to $Database"
        $req.SetDatabase($Database)
    }
    # Set document
    if ($Document) {
        if ($Document -match "\?") {
            $arr = $Document -split "\?"
            $Document = $arr[0]
            $Param = $arr[1]
            if ($Param) {
                $parameters += $Param
            }
        }
        Write-Verbose -Message "Set document to $Document"
        $req.SetDocument($Document)
    }
    # Set attachment
    if ($Attachment) {
        if ('GET','HEAD' -contains $Method) {
            Write-Verbose -Message "Set attachment to $Attachment"
            $req.SetDocument("$Document/$Attachment")
        } else {
            if (-not(Test-Path -Path $Attachment -ErrorAction SilentlyContinue)) {
                $req.SetDocument("$Document/$Attachment")
            } else {
                Write-Verbose -Message "Set attachment to $Attachment"
                $req.AddAttachment($Attachment)
            }
        }
    }
    # Set revision
    if ($Revision) {
        Write-Verbose -Message "Set revision to $Revision"
        $parameters += "rev=$Revision"
    }
    # Check other params
    if ($Params) {
        $parameters += $Params
    }
    if ($parameters) {
        Write-Verbose -Message "Set parameters: $parameters"
        $req.SetParameter($parameters)
    }
    # Check authorization
    if ($Authorization -or $Global:CouchDBCredential) {
        if ($Global:CouchDBSaveCredentialPreference) {
            if (-not($Global:CouchDBCredential)) {
                $Global:CouchDBCredential = $Authorization
            }
            # Check if authorization has been changed
            if ($Authorization -and $Global:CouchDBCredential -ne $Authorization) {
                Write-Verbose -Message "Override global authorization"
                $Global:CouchDBCredential = $Authorization
            }
            Write-Verbose -Message "Add authorization"
            $req.AddAuthorization($Global:CouchDBCredential)
        } else {
            Remove-CouchDBSession
            Write-Verbose -Message "Add authorization"
            $req.AddAuthorization($Authorization)
        }
    }
    # Check json data
    if ($Data) {
        Write-Verbose -Message "Set json data to: $Data"
        $req.SetData($Data)
    }
    # Get header or request
    Write-Verbose -Message "Request to CouchDB server: $req"
    if ($Method -eq "HEAD") {
        $req.GetHeader()
    } else {
        if ($JobName) {
            $req.RequestAsJob($JobName)
        } else {
            $req.Request()
            # Add to cache
            if ($req.cache) {
                if ($CouchDBCache) {
                    [void]$CouchDBCache.AddRange($req.uri.Cache)
                } else {
                    $Global:CouchDBCache = $req.uri.Cache
                }
            }
        }
    }
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
        [ValidateSet("PSCouchDBRequest", "PSCouchDBQuery", "PSCouchDBDocument", "PSCouchDBAttachment", "PSCouchDBBulkDocument",
        "PSCouchDBSecurity", "PSCouchDBReplication", "PSCouchDBView", "PSCouchDBDesignDoc")]
        [string] $TypeName,
        [array] $ArgumentList
    )
    return New-Object -TypeName $TypeName -ArgumentList $ArgumentList
}