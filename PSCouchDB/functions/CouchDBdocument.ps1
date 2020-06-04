# Document functions of CouchDB module

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
        PUT /{db}/{partition:docid}
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER Database
    The CouchDB database.
    .PARAMETER Document
    The CouchDB document.
    .PARAMETER Partition
    The CouchDB partition.
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
    The example create document "Hitchhikers" with data $data.
    .EXAMPLE
    $data = @{"answer"=42; "ask"="Ultimate Question of Life, the Universe and Everything"}
    New-CouchDBDocument -Database test -Document "Hitchhikers"-Data $data -Partition Guide -Authorization "admin:password"
    The example create document "Hitchhikers" with data $data and partition "Guide"
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
        [string] $Partition,
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
    # Check Partition
    if ($Partition) { $Document = "${Partition}:${Document}" }
    # Check BatchMode
    if ($BatchMode.IsPresent) { $Document += "?batch=ok" }
    Send-CouchDBRequest -Server $Server -Port $Port -Method "PUT" -Database $Database -Document $Document -Data $Data -Authorization $Authorization -Ssl:$Ssl
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
    .PARAMETER AsJob
    Send the command in the background.
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
        [switch] $Ssl,
        [switch] $AsJob
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
    if ($AsJob.IsPresent) {
        $job = Start-Job -Name "Bulk-Get" { 
            param($Server, $Port, $Method, $Database, $Document, $Data, $Authorization, $Ssl)
            Send-CouchDBRequest -Server $Server -Port $Port -Method "POST" -Database $Database -Document $Document -Data $Data -Authorization $Authorization -Ssl:$Ssl 
        } -ArgumentList $Server, $Port, $Method, $Database, $Document, $Data, $Authorization, $Ssl
        Register-TemporaryEvent $job "StateChanged" -Action {
            Write-Host -ForegroundColor Green "Bulk get #$($sender.Id) ($($sender.Name)) complete."
        }
    } else {
        Send-CouchDBRequest -Server $Server -Port $Port -Method "POST" -Database $Database -Document $Document -Data $Data -Authorization $Authorization -Ssl:$Ssl
    }
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
    .PARAMETER AsJob
    Send the command in the background.
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
        [switch] $Ssl,
        [switch] $AsJob
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
    if ($AsJob.IsPresent) {
        $job = Start-Job -Name "Bulk-Docs" {
            param($Server, $Port, $Method, $Database, $Document, $Data, $Authorization, $Ssl)
            Send-CouchDBRequest -Server $Server -Port $Port -Method "POST" -Database $Database -Document $Document -Data $Data -Authorization $Authorization -Ssl:$Ssl 
        } -ArgumentList $Server, $Port, $Method, $Database, $Document, $Data, $Authorization, $Ssl
        Register-TemporaryEvent $job "StateChanged" -Action {
            Write-Host -ForegroundColor Green "Bulk docs #$($sender.Id) ($($sender.Name)) complete."
        }
    } else {
        Send-CouchDBRequest -Server $Server -Port $Port -Method "POST" -Database $Database -Document $Document -Data $Data -Authorization $Authorization -Ssl:$Ssl
    }
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
    .PARAMETER AsJob
    Send the command in the background.
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
        [switch] $Ssl,
        [switch] $AsJob
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
        if ($AsJob.IsPresent) {
            $job = Start-Job -Name "Search-FullText" {
                param($Server, $Port, $Method, $Database, $Document, $Data, $Authorization, $Ssl)
                Send-CouchDBRequest -Server $Server -Port $Port -Method "POST" -Database $Database -Document $Document -Data $Data -Authorization $Authorization -Ssl:$Ssl
            } -ArgumentList $Server, $Port, $Method, $Database, $Document, $Data, $Authorization, $Ssl
            Register-TemporaryEvent $job "StateChanged" -Action {
                Write-Host -ForegroundColor Green "Search full text docs with queries #$($sender.Id) ($($sender.Name)) complete."
            }
        } else {
            Send-CouchDBRequest -Server $Server -Port $Port -Method "POST" -Database $Database -Document $Document -Data $Data -Authorization $Authorization -Ssl:$Ssl
        }
    } else {
        if ($AsJob.IsPresent) {
            $job = Start-Job -Name "Search-FullText" {
                param($Server, $Port, $Method, $Database, $Document, $Authorization, $Ssl)
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
            } -ArgumentList $Server, $Port, $Method, $Database, $Document, $Authorization, $Ssl
            Register-TemporaryEvent $job "StateChanged" -Action {
                Write-Host -ForegroundColor Green "Search full text docs #$($sender.Id) ($($sender.Name)) complete."
            }
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
    .PARAMETER AsJob
    Send the command in the background.
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
        [switch] $Ssl,
        [Parameter(ParameterSetName = "PSCouchDB")]
        [Parameter(ParameterSetName = "Native")]
        [switch] $AsJob
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
    if ($AsJob.IsPresent) {
        $job = Start-Job -Name "Find-Docs" {
            param($Server, $Port, $Method, $Database, $Document, $Data, $Authorization, $Ssl)
            Send-CouchDBRequest -Server $Server -Port $Port -Method "POST" -Database $Database -Document $Document -Data $Data -Authorization $Authorization -Ssl:$Ssl
        } -ArgumentList $Server, $Port, $Method, $Database, $Document, $Data, $Authorization, $Ssl
        Register-TemporaryEvent $job "StateChanged" -Action {
            Write-Host -ForegroundColor Green "Find docs #$($sender.Id) ($($sender.Name)) complete."
        }
    } else {
        Send-CouchDBRequest -Server $Server -Port $Port -Method "POST" -Database $Database -Document $Document -Data $Data -Authorization $Authorization -Ssl:$Ssl
    }
}

function Get-CouchDBPartitionDocuments () {
    <#
    .SYNOPSIS
    Get documents into partitions.
    .DESCRIPTION
    Get some info about the partition containing the document.
    .NOTES
    CouchDB API:
        GET /{db}/_partition/{partition}
        GET /{db}/_partition/{partition}/_all_docs
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER Database
    The CouchDB database.
    .PARAMETER Partition
    The CouchDB partition.
    .PARAMETER AllDocuments
    The CouchDB partition.
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
    .PARAMETER AsJob
    Send the command in the background.
    .EXAMPLE
    Get-CouchDBPartitionDocuments -Database test -Partition testing -Authorization "admin:password"
    Get info for "testing" partition.
    .EXAMPLE
    Get-CouchDBPartitionDocuments -Database test -Partition testing -AllDocuments -Authorization "admin:password"
    Get all documents on "testing" partition.
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/documents.html#get-partitioned-documents
    #>
    [CmdletBinding(DefaultParameterSetName = "Info")]
    param(
        [Parameter(ParameterSetName = "Info")]
        [Parameter(ParameterSetName = "AllDocs")]
        [string] $Server,
        [Parameter(ParameterSetName = "Info")]
        [Parameter(ParameterSetName = "AllDocs")]
        [int] $Port,
        [Parameter(ParameterSetName = "Info")]
        [Parameter(ParameterSetName = "AllDocs")]
        [Parameter(mandatory = $true)]
        [string] $Database,
        [Parameter(ParameterSetName = "Info")]
        [Parameter(ParameterSetName = "AllDocs")]
        [Parameter(mandatory = $true, ValueFromPipeline = $true)]
        [string] $Partition,
        [Parameter(ParameterSetName = "AllDocs")]
        [switch] $AllDocuments,
        [Parameter(ParameterSetName = "AllDocs")]
        [switch] $Descending,
        [Parameter(ParameterSetName = "AllDocs")]
        [Alias('End')]
        [string] $EndKey,
        [Parameter(ParameterSetName = "AllDocs")]
        [Alias('EndDoc')]
        [string] $EndKeyDocument,
        [Parameter(ParameterSetName = "AllDocs")]
        [switch] $Group,
        [Parameter(ParameterSetName = "AllDocs")]
        [int] $GroupLevel,
        [Parameter(ParameterSetName = "AllDocs")]
        [Alias('IncDoc')]
        [switch] $IncludeDocuments,
        [Parameter(ParameterSetName = "AllDocs")]
        [Alias('IncEnd')]
        [bool] $InclusiveEnd = $true,
        [Parameter(ParameterSetName = "AllDocs")]
        $Key,
        [Parameter(ParameterSetName = "AllDocs")]
        [array] $Keys,
        [Parameter(ParameterSetName = "AllDocs")]
        [int] $Limit,
        [Parameter(ParameterSetName = "AllDocs")]
        [bool] $Reduce = $true,
        [Parameter(ParameterSetName = "AllDocs")]
        [int] $Skip,
        [Parameter(ParameterSetName = "AllDocs")]
        [bool] $Sorted = $true,
        [Parameter(ParameterSetName = "AllDocs")]
        [switch] $Stable,
        [Parameter(ParameterSetName = "AllDocs")]
        [ValidateSet("ok", "update_after", "false")]
        [string] $Stale,
        [Parameter(ParameterSetName = "AllDocs")]
        [Alias('Start')]
        [string] $StartKey,
        [Parameter(ParameterSetName = "AllDocs")]
        [Alias('StartDoc')]
        [string] $StartKeyDocument,
        [Parameter(ParameterSetName = "AllDocs")]
        [ValidateSet("true", "false", "lazy")]
        [string] $Update,
        [Parameter(ParameterSetName = "AllDocs")]
        [switch] $UpdateSequence,
        [Parameter(ParameterSetName = "Info")]
        [Parameter(ParameterSetName = "AllDocs")]
        [string] $Authorization,
        [Parameter(ParameterSetName = "Info")]
        [Parameter(ParameterSetName = "AllDocs")]
        [switch] $Ssl,
        [Parameter(ParameterSetName = "Info")]
        [Parameter(ParameterSetName = "AllDocs")]
        [switch] $AsJob
    )
    # Check _all_docs
    if ($AllDocuments.IsPresent) {
        $Document = "_partition/$Partition/_all_docs"
    } else {
        $Document = "_partition/$Partition"
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
    if ($AsJob.IsPresent) {
        $job = Start-Job -Name "Get-Partition" {
            param($Server, $Port, $Method, $Database, $Document, $Data, $Authorization, $Ssl)
            Send-CouchDBRequest -Server $Server -Port $Port -Method "GET" -Database $Database -Document $Document -Authorization $Authorization -Ssl:$Ssl
        } -ArgumentList $Server, $Port, $Method, $Database, $Document, $Data, $Authorization, $Ssl
        Register-TemporaryEvent $job "StateChanged" -Action {
            Write-Host -ForegroundColor Green "Get partitioned documents #$($sender.Id) ($($sender.Name)) complete."
        }
    } else {
        Send-CouchDBRequest -Server $Server -Port $Port -Method "GET" -Database $Database -Document $Document -Authorization $Authorization -Ssl:$Ssl
    }
}