# Design document functions of CouchDB module

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
    .PARAMETER ProxyServer
    Proxy server through which all non-local calls pass.
    Ex. ... -ProxyServer 'http://myproxy.local:8080' ...
    .PARAMETER ProxyCredential
    Proxy server credential. It must be specified with a PSCredential object.
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
        [Parameter(mandatory = $true, ValueFromPipeline = $true, Position = 0)]
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
        $Authorization,
        [switch] $Ssl,
        [string] $ProxyServer,
        [pscredential] $ProxyCredential
    )
    $Document = "_design_docs"
    $parameters = @()
    # Check descending parameter
    if ($Descending.IsPresent) {
        $parameters += "descending=true"
    }
    # Check endkey parameter
    if ($EndKey) {
        $parameters += "endkey=`"$EndKey`""
    }
    # Check endkey_docid parameter
    if ($EndKeyDocument) {
        $parameters += "endkey_docid=`"$EndKeyDocument`""
    }
    # Check include_docs parameter
    if ($IncludeDocument.IsPresent) {
        $parameters += "include_docs=true"
    }
    # Check inclusive_end parameter
    if ($InclusiveEnd -eq $false) {
        $parameters += "inclusive_end=false"
    }
    # Check key parameter
    if ($Key) {
        $parameters += "key=`"$Key`""
    }
    # Check keys parameter
    if ($Keys) {
        $parameters += "keys=$(
                if ($Keys.Count -eq 1) {
                    "[$($Keys | ConvertTo-Json -Compress)]"
                } else {
                    $Keys | ConvertTo-Json -Compress
                }
            )"
    }
    # Check conflicts parameter
    if ($Conflict.IsPresent) {
        $parameters += "conflicts=true"
    }
    # Check limit parameter
    if ($Limit) {
        $parameters += "limit=$Limit"
    }
    # Check skip parameter
    if ($Skip) {
        $parameters += "skip=$Skip"
    }
    # Check startkey parameter
    if ($StartKey) {
        $parameters += "startkey=`"$StartKey`""
    }
    # Check startkey_docid parameter
    if ($StartKeyDocument) {
        $parameters += "startkey_docid=`"$StartKeyDocument`""
    }
    # Check update_seq parameter
    if ($UpdateSequence.IsPresent) {
        $parameters += "update_seq=true"
    }
    Send-CouchDBRequest -Server $Server -Port $Port -Method "GET" -Database $Database -Document $Document -Params $parameters -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential
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
        GET /{db}/_design/{ddoc}/_search_info/{index}
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER Database
    The CouchDB database.
    .PARAMETER Document
    The CouchDB design document.
    .PARAMETER Index
    Executes a search request against the named index in the specified design document.
    WARNING: Search endpoints require a running search plugin connected to each cluster node.
    .PARAMETER Info
    The CouchDB header of document.
    .PARAMETER Authorization
    The CouchDB authorization form; user and password.
    Authorization format like this: user:password
    ATTENTION: if the password is not specified, it will be prompted.
    .PARAMETER Ssl
    Set ssl connection on CouchDB server.
    This modify protocol to https and port to 6984.
    .PARAMETER Variable
    Export into a PSCouchDBDesignDoc variable object.
    .PARAMETER ProxyServer
    Proxy server through which all non-local calls pass.
    Ex. ... -ProxyServer 'http://myproxy.local:8080' ...
    .PARAMETER ProxyCredential
    Proxy server credential. It must be specified with a PSCredential object.
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
        [Parameter(mandatory = $true, Position = 0)]
        [string] $Database,
        [Parameter(mandatory = $true, ValueFromPipeline = $true, Position = 1)]
        [string] $Document,
        [string] $Index,
        [switch] $Info,
        $Authorization,
        [switch] $Ssl,
        [string] $Variable,
        [string] $ProxyServer,
        [pscredential] $ProxyCredential
    )
    $Document = "_design/$Document"
    # Export document in a variable
    if ($Variable) {
        $ddoc = Send-CouchDBRequest -Server $Server -Port $Port -Method "GET" -Database $Database -Document $Document -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential
        $exportDdoc = New-Object -TypeName PSCouchDBDesignDoc -ArgumentList $ddoc._id,$ddoc._rev
        # Retrieve views function
        foreach ($v in $ddoc.views.psobject.properties) {
            $name = $v.name
            $map = $v.psobject.properties.value.map
            $reduce = $v.psobject.properties.reduce
            if ($map) {
                $exportDdoc.AddView($name, $map)
            } elseif ($map -and $reduce) {
                $exportDdoc.AddView($name, $map, $reduce)
            }
        }
        # Retrieve validate_doc_update function
        if ($ddoc.validate_doc_update) {
            $exportDdoc.SetValidateFunction($validate)
        }
        Set-Variable -Name $Variable -Value $exportDdoc -Scope Global
        return $null
    }
    # Check method
    if ($Info.IsPresent) { $Method = "HEAD" } else { $Method = "GET" }
    # Search index
    if ($Index) { $Method = "GET"; $Document += "/_search_info/$Index" }
    Send-CouchDBRequest -Server $Server -Port $Port -Method $Method -Database $Database -Document $Document -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential
}

function Find-CouchDBDesignDocument {
    <#
    .SYNOPSIS
    Executes a search in the specified design document.
    .DESCRIPTION
    Executes a search request against the named index in the specified design document.
    .NOTES
    CouchDB API:
        GET /{db}/_design/{ddoc}/_search/{index}
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER Database
    The CouchDB database.
    .PARAMETER Document
    The CouchDB design document.
    .PARAMETER Index
    The index name.
    .PARAMETER Bookmark
    A bookmark received from a previous search. This parameter enables paging through the results.
    .PARAMETER Counts
    An array of names of string fields for which counts are requested.
    .PARAMETER GroupField
    Field by which to group search matches. :query number group_limit: Maximum group count.
    .PARAMETER GroupSort
    This field defines the order of the groups in a search that uses GroupField. The default sort order is relevance.
    .PARAMETER IncludeDocs
    Include the full content of the documents in the response.
    .PARAMETER IncludeFields
    Field names to include in search results. Any fields that are included must be indexed with the store:true option.
    .PARAMETER Limit
    Limit the number of the returned documents to the specified number. For a grouped search, this parameter limits the number of documents per group.
    .PARAMETER Sort
    Specifies the sort order of the results. In a grouped search (when group_field is used), this parameter specifies the sort order within a group. The default sort order is relevance.
    .PARAMETER Stale
    Set to ok to allow the use of an out-of-date index.
    .PARAMETER Authorization
    The CouchDB authorization form; user and password.
    Authorization format like this: user:password
    ATTENTION: if the password is not specified, it will be prompted.
    .PARAMETER Ssl
    Set ssl connection on CouchDB server.
    This modify protocol to https and port to 6984.
    .PARAMETER Variable
    Export into a PSCouchDBDesignDoc variable object.
    .PARAMETER ProxyServer
    Proxy server through which all non-local calls pass.
    Ex. ... -ProxyServer 'http://myproxy.local:8080' ...
    .PARAMETER ProxyCredential
    Proxy server credential. It must be specified with a PSCredential object.
    .EXAMPLE
    Find-CouchDBDesignDocument -Database test -Document "space" -Index "planet1" -Limit 25
    This example search the named index "planet1" into "space" design document on database "test".
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/ddoc.html#find-a-design-document
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory = $true, Position = 0)]
        [string] $Database,
        [Parameter(mandatory = $true, ValueFromPipeline = $true, Position = 1)]
        [string] $Document,
        [Parameter(mandatory = $true, ValueFromPipeline = $true, Position = 2)]
        [string] $Index,
        [string] $Bookmark,
        [array] $Counts,
        [hashtable] $GroupField,
        [hashtable] $GroupSort,
        [switch] $IncludeDocs,
        [switch] $IncludeFields,
        [int] $Limit,
        [string] $Sort,
        $Authorization,
        [switch] $Ssl,
        [string] $Variable,
        [string] $ProxyServer,
        [pscredential] $ProxyCredential
    )
    $Params = @()
    $Document = "_design/$Document/_search/$Index"
    # Check parameters
    if ($Bookmark) {
        $Params += "bookmark=$($Bookmark | ConvertTo-Json -Compress)"
    }
    if ($Counts) {
        $Params += "counts=$($counts | ConvertTo-Json -Compress)"
    }
    if ($GroupField) {
        $Params += "group_field=$($GroupField | ConvertTo-Json -Compress)"
    }
    if ($GroupSort) {
        $Params += "group_sort=$($GroupSort | ConvertTo-Json -Compress)"
    }
    if ($IncludeDocs) {
        $Params += "include_docs=$($IncludeDocs.IsPresent | ConvertTo-Json -Compress)"
    }
    if ($IncludeFields) {
        $Params += "include_fields=$($IncludeFields.IsPresent | ConvertTo-Json -Compress)"
    }
    if ($Limit) {
        $Params += "limit=$($Limit | ConvertTo-Json -Compress)"
    }
    if ($Sort) {
        $Params += "sort=$($Sort | ConvertTo-Json -Compress)"
    }
    Send-CouchDBRequest -Server $Server -Port $Port -Method "GET" -Database $Database -Document $Document -Params $Params -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential
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
    The CouchDB design document.
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
    .PARAMETER Variable
    Export into a PSCouchDBAttachment variable object.
    .PARAMETER ProxyServer
    Proxy server through which all non-local calls pass.
    Ex. ... -ProxyServer 'http://myproxy.local:8080' ...
    .PARAMETER ProxyCredential
    Proxy server credential. It must be specified with a PSCredential object.
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
        [Parameter(mandatory = $true, Position = 0)]
        [string] $Database,
        [Parameter(ParameterSetName = "Attachment")]
        [Parameter(ParameterSetName = "Info")]
        [Parameter(mandatory = $true, ValueFromPipeline = $true, Position = 1)]
        [string] $Document,
        [Parameter(ParameterSetName = "Attachment")]
        [Parameter(ParameterSetName = "Info")]
        [string] $Revision,
        [Parameter(ParameterSetName = "Info")]
        [switch] $Info,
        [Parameter(ParameterSetName = "Attachment")]
        [Parameter(ParameterSetName = "Info")]
        [Parameter(mandatory = $true, Position = 2)]
        [string] $Attachment,
        [Parameter(ParameterSetName = "Attachment")]
        [string] $OutFile,
        [Parameter(ParameterSetName = "Attachment")]
        [Parameter(ParameterSetName = "Info")]
        $Authorization,
        [Parameter(ParameterSetName = "Attachment")]
        [Parameter(ParameterSetName = "Info")]
        [switch] $Ssl,
        [Parameter(ParameterSetName = "Attachment")]
        [string] $Variable,
        [Parameter(ParameterSetName = "Attachment")]
        [Parameter(ParameterSetName = "Info")]
        [string] $ProxyServer,
        [Parameter(ParameterSetName = "Attachment")]
        [Parameter(ParameterSetName = "Info")]
        [pscredential] $ProxyCredential
    )
    if ($Info.IsPresent) {
        $Method = "HEAD"
    } else {
        $Method = "GET"
    }
    $Document = "_design/$Document"
    # Export attachment in a variable
    if ($Variable) {
        $tempfile = New-TemporaryFile
        $attachName = Join-Path -Path $tempfile.DirectoryName -ChildPath $(Split-Path -Path $Attachment -Leaf)
        $attachment = Send-CouchDBRequest -Server $Server -Port $Port -Method "GET" -Database $Database -Document $Document -Revision $Revision -Attachment $Attachment -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential | Out-File $tempfile.FullName -Encoding utf8
        Rename-Item -Path $tempfile.FullName -NewName $attachName -Force
        $exportAttachment = New-Object -TypeName PSCouchDBAttachment -ArgumentList $attachName
        Remove-Item -Path $attachName -Force
        Set-Variable -Name $Variable -Value $exportAttachment -Scope Global
        return $null
    }
    # Save Attachment
    if ($OutFile) {
        (Send-CouchDBRequest -Server $Server -Port $Port -Method $Method -Database $Database -Document $Document -Revision $Revision -Attachment $Attachment -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential).results | Out-File $OutFile -Encoding utf8
        return "$OutFile"
    }
    Send-CouchDBRequest -Server $Server -Port $Port -Method $Method -Database $Database -Document $Document -Revision $Revision -Attachment $Attachment -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential
}

function Add-CouchDBDesignDocumentAttachment () {
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
    The CouchDB design document.
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
    .PARAMETER ProxyServer
    Proxy server through which all non-local calls pass.
    Ex. ... -ProxyServer 'http://myproxy.local:8080' ...
    .PARAMETER ProxyCredential
    Proxy server credential. It must be specified with a PSCredential object.
    .EXAMPLE
    Add-CouchDBDesignDocumentAttachment -Database test -Document space -Revision "2-4705a219cdcca7c72aac4f623f5c46a8" -Attachment test.txt
    This example add attachment "test.txt" on "space" design document from database "test".
    .EXAMPLE
    using module PSCouchDB
    $Attachment = New-Object PSCouchDBAttachment -ArgumentList "C:\temp\bin.exe"
    Add-CouchDBDesignDocumentAttachment -Database test -Document space -Revision "2-4705a219cdcca7c72aac4f623f5c46a8" -Attachment $Attachment
    This example add attachment "test.txt" on "space" design document from database "test" with PSCouchDBAttachment object.
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/ddoc.html#create-design-document-attachment
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory = $true, Position = 0)]
        [string] $Database,
        [Parameter(mandatory = $true, Position = 1)]
        [string] $Document,
        [Parameter(mandatory = $true, Position = 2)]
        $Attachment,
        [Parameter(mandatory = $true, Position = 3)]
        [string] $Revision,
        $Authorization,
        [switch] $Ssl,
        [string] $ProxyServer,
        [pscredential] $ProxyCredential
    )
    $Document = "_design/$Document"
    # Check if Attachment param is string or PSCouchDBAttachment
    if ($Attachment -is [PSCouchDBAttachment]) {
        $tempfile = New-TemporaryFile
        $attachName = Join-Path -Path $tempfile.DirectoryName -ChildPath $Attachment.filename
        Rename-Item -Path $tempfile.FullName -NewName $attachName -Force
        $Attachment.SaveData($attachName)
        $Attachment = $attachName
    } elseif ($Attachment -is [string]) {
        if (-not(Test-Path -Path $Attachment)) {
            throw "File not found: $Attachment"
        }
    } else {
        throw "Attachment parameter must be string or PSCouchDBAttachment object"
    }
    Send-CouchDBRequest -Server $Server -Port $Port -Method "PUT" -Database $Database -Document $Document -Attachment $Attachment -Revision $Revision -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential
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
    The CouchDB design document.
    .PARAMETER ViewName
    The name of view function in the design document.
    .PARAMETER ViewMapFunction
    The function attach to the name of view function.
    .PARAMETER ViewReduceFunction
    The function attach to the name of view function.
    .PARAMETER ValidationFunction
    A validation function.
    .PARAMETER Data
    The entire design document in json, hashtable or PSCouchDBDesignDoc object.
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
    New-CouchDBDesignDocument -Database test -Document "space" -ViewName "planet_view" -ViewMapFunction "function(doc){if(doc.planet && doc.name) {emit(doc.planet, doc.name);}}" -Authorization "admin:password"
    The example create "space" design document with add "planet_view" view.
    .EXAMPLE
    $data = '{"views":{"data_test":{"map":"function(doc) {emit(doc._id, doc._rev)}"}}}'
    New-CouchDBDesignDocument -Database test -Document "space" -Data $data -Authorization "admin:password"
    The example create "space" design document with custom data.
    .EXAMPLE
    New-CouchDBDesignDocument -Database test -Document "space" -ViewName "planet_view" -ViewMapFunction "function(doc){if(doc.planet && doc.name) {emit(doc.planet, doc.name);}}" -ViewReduceFunction "_count" -Authorization "admin:password"
    The example create "space" design document with add "planet_view" view with reduce function. 
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/ddoc.html#creates-a-design-document
    #>
    [CmdletBinding(DefaultParameterSetName = "View")]
    param(
        [Parameter(ParameterSetName = "View")]
        [Parameter(ParameterSetName = "CustomData")]
        [string] $Server,
        [Parameter(ParameterSetName = "View")]
        [Parameter(ParameterSetName = "CustomData")]
        [int] $Port,
        [Parameter(ParameterSetName = "View")]
        [Parameter(ParameterSetName = "CustomData")]
        [Parameter(mandatory = $true, Position = 0)]
        [string] $Database,
        [Parameter(ParameterSetName = "View")]
        [Parameter(ParameterSetName = "CustomData")]
        [Parameter(mandatory = $true, ValueFromPipeline = $true, Position = 1)]
        [string] $Document,
        [Parameter(ParameterSetName = "View")]
        [string] $ViewName,
        [Parameter(ParameterSetName = "View")]
        [string] $ViewMapFunction,
        [ValidateSet('_approx_count_distinct', '_count', '_stats', '_sum')]
        [Parameter(ParameterSetName = "View")]
        [string] $ViewReduceFunction,
        [Parameter(ParameterSetName = "View")]
        [string] $ValidationFunction,
        [Parameter(ParameterSetName = "CustomData")]
        $Data,
        [Parameter(ParameterSetName = "View")]
        [Parameter(ParameterSetName = "CustomData")]
        $Authorization,
        [Parameter(ParameterSetName = "View")]
        [Parameter(ParameterSetName = "CustomData")]
        [switch] $Ssl,
        [Parameter(ParameterSetName = "View")]
        [Parameter(ParameterSetName = "CustomData")]
        [string] $ProxyServer,
        [Parameter(ParameterSetName = "View")]
        [Parameter(ParameterSetName = "CustomData")]
        [pscredential] $ProxyCredential
    )
    $Document = "_design/$Document"
    # Instance new PSCouchDBDesignDoc object
    $ddoc = New-Object PSCouchDBDesignDoc -ArgumentList $Document
    # View
    if ($PsCmdlet.ParameterSetName -eq "View") {
        if (($ViewName -and $ViewMapFunction) -or ($ViewName -and $ViewReduceFunction)) {
            # Map
            if ($ViewMapFunction -and $ViewReduceFunction) {
                $ddoc.AddView($ViewName, $ViewMapFunction, $ViewReduceFunction)
            } elseif ($ViewMapFunction) {
                $ddoc.AddView($ViewName, $ViewMapFunction)
            }
            if ($ValidationFunction) { $ddoc.SetValidateFunction($ValidationFunction) }
        } elseif ($ValidationFunction) {
            $ddoc.SetValidateFunction($ValidationFunction)
        } else {
            throw "View function required a name!"
        }
        $Data = $ddoc.ToJson(99)
    }
    # CustomData
    if ($PsCmdlet.ParameterSetName -eq "CustomData") {
        if ($Data -is [hashtable]) {
            $Data = $Data | ConvertTo-Json -Depth 99
        } elseif ($Data -is [PSCouchDBDesignDoc]) {
            $Data = $Data.ToJson(99)
        }
    }
    Send-CouchDBRequest -Server $Server -Port $Port -Method "PUT" -Database $Database -Document $Document -Data $Data -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential
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
    The CouchDB design document.
    .PARAMETER Revision
    The CouchDB revision document.
    .PARAMETER ViewName
    The name of view function in the design document.
    .PARAMETER ViewMapFunction
    The function attach to the name of view function.
    .PARAMETER ViewReduceFunction
    The function attach to the name of view function.
    .PARAMETER ValidationFunction
    A validation function.
    .PARAMETER Data
    The entire design document in json, hashtable or PSCouchDBDesignDoc object.
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
    Set-CouchDBDesignDocument -Database test -Document "space" -Revision "2-4705a219cdcca7c72aac4f623f5c46a8" -ViewName "planet_view" -ViewMapFunction "function(doc){if(doc.planet && doc.name) {emit(doc.planet, doc.name);}}" -Authorization "admin:password"
    The example create "space" design document with add "planet_view" view.
    .EXAMPLE
    $data = '{"views":{"data_test":{"map":"function(doc) {emit(doc._id, doc._rev)}"}}}'
    Set-CouchDBDesignDocument -Database test -Document "space" -Revision "2-4705a219cdcca7c72aac4f623f5c46a8" -Data $data -Authorization "admin:password"
    The example create "space" design document with custom data.
    .EXAMPLE
    Set-CouchDBDesignDocument -Database test -Document "space" -Revision "2-4705a219cdcca7c72aac4f623f5c46a8" -ViewName "planet_view" -ViewMapFunction "function(doc){if(doc.planet && doc.name) {emit(doc.planet, doc.name);}}" -ViewReduceFunction "_count" -Authorization "admin:password"
    The example create "space" design document with add "planet_view" view with reduce function. 
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/ddoc.html#creates-a-design-document
    #>
    [CmdletBinding(DefaultParameterSetName = "View")]
    param(
        [Parameter(ParameterSetName = "View")]
        [Parameter(ParameterSetName = "CustomData")]
        [string] $Server,
        [Parameter(ParameterSetName = "View")]
        [Parameter(ParameterSetName = "CustomData")]
        [int] $Port,
        [Parameter(ParameterSetName = "View")]
        [Parameter(ParameterSetName = "CustomData")]
        [Parameter(mandatory = $true, Position = 0)]
        [string] $Database,
        [Parameter(ParameterSetName = "View")]
        [Parameter(ParameterSetName = "CustomData")]
        [Parameter(mandatory = $true, ValueFromPipeline = $true, Position = 1)]
        [string] $Document,
        [Parameter(ParameterSetName = "View")]
        [Parameter(ParameterSetName = "CustomData")]
        [Parameter(mandatory = $true, Position = 2)]
        [string] $Revision,
        [Parameter(ParameterSetName = "View")]
        [string] $ViewName,
        [Parameter(ParameterSetName = "View")]
        [string] $ViewMapFunction,
        [ValidateSet('_approx_count_distinct', '_count', '_stats', '_sum')]
        [Parameter(ParameterSetName = "View")]
        [string] $ViewReduceFunction,
        [Parameter(ParameterSetName = "View")]
        [string] $ValidationFunction,
        [Parameter(ParameterSetName = "CustomData")]
        $Data,
        [Parameter(ParameterSetName = "View")]
        [Parameter(ParameterSetName = "CustomData")]
        $Authorization,
        [Parameter(ParameterSetName = "View")]
        [Parameter(ParameterSetName = "CustomData")]
        [switch] $Ssl,
        [Parameter(ParameterSetName = "View")]
        [Parameter(ParameterSetName = "CustomData")]
        [string] $ProxyServer,
        [Parameter(ParameterSetName = "View")]
        [Parameter(ParameterSetName = "CustomData")]
        [pscredential] $ProxyCredential
    )
    $Document = "_design/$Document"
    # Instance new PSCouchDBDesignDoc object
   $ddoc = New-Object PSCouchDBDesignDoc -ArgumentList $Document,$Revision
    # View
    if ($PsCmdlet.ParameterSetName -eq "View") {
        if (($ViewName -and $ViewMapFunction) -or ($ViewName -and $ViewReduceFunction)) {
            # Map
            if ($ViewMapFunction -and $ViewReduceFunction) {
                $ddoc.AddView($ViewName, $ViewMapFunction, $ViewReduceFunction)
            } elseif ($ViewMapFunction) {
                $ddoc.AddView($ViewName, $ViewMapFunction)
            }
            if ($ValidationFunction) { $ddoc.SetValidateFunction($ValidationFunction) }
        } elseif ($ValidationFunction) {
            $ddoc.SetValidateFunction($ValidationFunction)
        } else {
            throw "View function required a name!"
        }
        $Data = $ddoc.ToJson(99)
    }
    # CustomData
    if ($PsCmdlet.ParameterSetName -eq "CustomData") {
        if ($Data -is [hashtable]) {
            $Data = $Data | ConvertTo-Json -Depth 99
        } elseif ($Data -is [PSCouchDBDesignDoc]) {
            $Data = $Data.ToJson(99)
        }
    }
    Send-CouchDBRequest -Server $Server -Port $Port -Method "PUT" -Database $Database -Document $Document -Revision $Revision -Data $Data -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential
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
    .PARAMETER ProxyServer
    Proxy server through which all non-local calls pass.
    Ex. ... -ProxyServer 'http://myproxy.local:8080' ...
    .PARAMETER ProxyCredential
    Proxy server credential. It must be specified with a PSCredential object.
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
        [Parameter(mandatory = $true, Position = 0)]
        [string] $Database,
        [Parameter(mandatory = $true, ValueFromPipeline = $true, Position = 1)]
        [string] $DesignDoc,
        $Authorization,
        [switch] $Ssl,
        [string] $ProxyServer,
        [pscredential] $ProxyCredential
    )
    $Document = "_compact/$DesignDoc"
    $Data = '{}'
    Send-CouchDBRequest -Server $Server -Port $Port -Method "POST" -Database $Database -Document $Document -Data $Data -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential
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
    .PARAMETER ProxyServer
    Proxy server through which all non-local calls pass.
    Ex. ... -ProxyServer 'http://myproxy.local:8080' ...
    .PARAMETER ProxyCredential
    Proxy server credential. It must be specified with a PSCredential object.
    .EXAMPLE
    Remove-CouchDBDesignDocument -Database test -Document "space" -Revision "2-4705a219cdcca7c72aac4f623f5c46a8" -Authorization "admin:password"
    The example removes a design document "space" on database "test".
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/ddoc.html#remove-design-document
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory = $true, ValueFromPipeline = $true, Position = 0)]
        [string] $Database,
        [Parameter(Mandatory = $true, Position = 1)]
        [string] $Document,
        [Parameter(Mandatory = $true, Position = 2)]
        [string] $Revision,
        $Authorization,
        [switch]$Force,
        [switch] $Ssl,
        [string] $ProxyServer,
        [pscredential] $ProxyCredential
    )
    $Document = "_design/$Document"
    if ($Force -or $PSCmdlet.ShouldContinue("Do you wish remove design document $Document on database $Database ?", "Remove design document $Document on database $Database")) {
        Send-CouchDBRequest -Server $Server -Port $Port -Method "DELETE" -Database $Database -Document $Document -Revision $Revision -Authorization $Authorization -Ssl:$Ssl  -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential
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
    .PARAMETER ProxyServer
    Proxy server through which all non-local calls pass.
    Ex. ... -ProxyServer 'http://myproxy.local:8080' ...
    .PARAMETER ProxyCredential
    Proxy server credential. It must be specified with a PSCredential object.
    .EXAMPLE
    Remove-CouchDBDesignDocumentAttachment -Database test -Document "space" -Attachment test.txt -Revision "2-4705a219cdcca7c72aac4f623f5c46a8" -Authorization "admin:password"
    The example removes an attachment "test.txt" on a design document "space" from database "test".
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/documents.html#delete-an-attachment
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory = $true, ValueFromPipeline = $true, Position = 0)]
        [string] $Database,
        [Parameter(mandatory = $true, Position = 1)]
        [string] $Document,
        [Parameter(mandatory = $true, Position = 2)]
        [string] $Attachment,
        [Parameter(mandatory = $true, Position = 3)]
        [string] $Revision,
        $Authorization,
        [switch]$Force,
        [switch] $Ssl,
        [string] $ProxyServer,
        [pscredential] $ProxyCredential
    )
    $Document = "_design/$Document"
    if ($Force -or $PSCmdlet.ShouldContinue("Do you wish remove attachment $Attachment in design document $Document on database $Database ?", "Remove attachment $Attachment in design document $Document on database $Database")) {
        Send-CouchDBRequest -Server $Server -Port $Port -Method "DELETE" -Database $Database -Document $Document -Attachment $Attachment -Revision $Revision -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential
    }
}