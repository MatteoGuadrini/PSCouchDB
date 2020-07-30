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
        GET /{db}/_partition/{partition}
        GET /{db}/_partition/{partition}/_all_docs
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
    The CouchDB document.
    .PARAMETER AllDocuments
    The CouchDB document is _all_docs.
    .PARAMETER Partition
    The CouchDB partition.
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
    .PARAMETER AsJob
    Send the command in the background.
    .PARAMETER Variable
    Export into a PSCouchDBDocument variable object.
    .EXAMPLE
    Get-CouchDBDocument -Database test -Document "Hitchhikers"
    This example get document "Hitchhikers" on database "test".
    .EXAMPLE
    Get-CouchDBDocument -Database test -AllDocuments
    This example get all documents on database "test".
    .EXAMPLE
    Get-CouchDBDocument -Database test -Revisions
    This example get all revision on database "test".
    .EXAMPLE
    if (Get-CouchDBDocument -Database test -Document "Hitchhikers" -Info) { echo "doc exists!" }
    Test if document "Hitchhikers" on database "test" exists.
    .EXAMPLE
    Get-CouchDBDocument -Database test -Document "Hitchhikers" -Variable test
    This example export into variable $test the document "Hitchhikers".
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/documents.html#get-a-document
    #>
    [CmdletBinding(DefaultParameterSetName = "Document")]
    param(
        [Parameter(ParameterSetName = "AllDocuments")]
        [Parameter(ParameterSetName = "Document")]
        [Parameter(ParameterSetName = "Info")]
        [string] $Server,
        [Parameter(ParameterSetName = "AllDocuments")]
        [Parameter(ParameterSetName = "Document")]
        [Parameter(ParameterSetName = "Info")]
        [int] $Port,
        [Parameter(ParameterSetName = "AllDocuments")]
        [Parameter(ParameterSetName = "Document")]
        [Parameter(ParameterSetName = "Info")]
        [Parameter(mandatory = $true, ValueFromPipeline = $true)]
        [string] $Database,
        [Parameter(ParameterSetName = "Document")]
        [Parameter(ParameterSetName = "Info")]
        [string] $Document,
        [Parameter(ParameterSetName = "AllDocuments")]
        [switch] $AllDocument,
        [Parameter(ParameterSetName = "AllDocuments")]
        [Parameter(ParameterSetName = "Document")]
        [Parameter(ParameterSetName = "Info")]
        [string] $Partition,
        [Parameter(ParameterSetName = "Document")]
        [Parameter(ParameterSetName = "Info")]
        [string] $Revision,
        [Parameter(ParameterSetName = "Info")]
        [switch] $Info,
        [Parameter(ParameterSetName = "AllDocuments")]
        [Parameter(ParameterSetName = "Document")]
        [Parameter(ParameterSetName = "Info")]
        [switch] $Local,
        [Parameter(ParameterSetName = "Document")]
        [switch] $Revisions,
        [Parameter(ParameterSetName = "Document")]
        [switch] $History,
        [Parameter(ParameterSetName = "Document")]
        [switch] $Attachments,
        [Parameter(ParameterSetName = "Document")]
        [switch] $AttachmentsInfo,
        [Parameter(ParameterSetName = "Document")]
        [ValidateCount(2, 10)]
        [array] $AttachmentsSince,
        [Parameter(ParameterSetName = "Document")]
        [switch] $Conflicts,
        [Parameter(ParameterSetName = "Document")]
        [switch] $DeletedConflicts,
        [Parameter(ParameterSetName = "Document")]
        [switch] $Latest,
        [Parameter(ParameterSetName = "Document")]
        [switch] $LocalSequence,
        [Parameter(ParameterSetName = "Document")]
        [switch] $Metadata,
        [Parameter(ParameterSetName = "Document")]
        [array] $OpenRevisions,
        [Parameter(ParameterSetName = "AllDocuments")]
        [switch] $Descending,
        [Parameter(ParameterSetName = "AllDocuments")]
        [Alias('End')]
        [string] $EndKey,
        [Parameter(ParameterSetName = "AllDocuments")]
        [Alias('EndDoc')]
        [string] $EndKeyDocument,
        [Parameter(ParameterSetName = "AllDocuments")]
        [switch] $Group,
        [Parameter(ParameterSetName = "AllDocuments")]
        [int] $GroupLevel,
        [Parameter(ParameterSetName = "AllDocuments")]
        [Alias('IncDoc')]
        [switch] $IncludeDocuments,
        [Parameter(ParameterSetName = "AllDocuments")]
        [Alias('IncEnd')]
        [bool] $InclusiveEnd = $true,
        [Parameter(ParameterSetName = "AllDocuments")]
        $Key,
        [Parameter(ParameterSetName = "AllDocuments")]
        [array] $Keys,
        [Parameter(ParameterSetName = "AllDocuments")]
        [int] $Limit,
        [Parameter(ParameterSetName = "AllDocuments")]
        [bool] $Reduce = $true,
        [Parameter(ParameterSetName = "AllDocuments")]
        [int] $Skip,
        [Parameter(ParameterSetName = "AllDocuments")]
        [bool] $Sorted = $true,
        [Parameter(ParameterSetName = "AllDocuments")]
        [switch] $Stable,
        [Parameter(ParameterSetName = "AllDocuments")]
        [ValidateSet("ok", "update_after", "false")]
        [string] $Stale,
        [Parameter(ParameterSetName = "AllDocuments")]
        [Alias('Start')]
        [string] $StartKey,
        [Parameter(ParameterSetName = "AllDocuments")]
        [Alias('StartDoc')]
        [string] $StartKeyDocument,
        [Parameter(ParameterSetName = "AllDocuments")]
        [ValidateSet("true", "false", "lazy")]
        [string] $Update,
        [Parameter(ParameterSetName = "AllDocuments")]
        [switch] $UpdateSequence,
        [Parameter(ParameterSetName = "AllDocuments")]
        [Parameter(ParameterSetName = "Document")]
        [Parameter(ParameterSetName = "Info")]
        $Authorization,
        [Parameter(ParameterSetName = "AllDocuments")]
        [Parameter(ParameterSetName = "Document")]
        [Parameter(ParameterSetName = "Info")]
        [switch] $Ssl,
        [Parameter(ParameterSetName = "AllDocuments")]
        [Parameter(ParameterSetName = "Document")]
        [switch] $AsJob,
        [Parameter(ParameterSetName = "Document")]
        [string] $Variable
    )
    # Check all docs 
    if ($AllDocuments.IsPresent) {
        $Document = '_all_docs'
    } elseif (-not($Document)) {
        $Document = '_all_docs'
    }
    # Check local docs
    if ($Local.IsPresent) {
        if ($AllDocuments.IsPresent) {
            Write-Warning -Message "-Document $Document parameter is rewrite in _local_docs because -Local parameter is specified."
            $Document = "_local_docs"
        } else {
            Write-Warning -Message "-Document $Document parameter is rewrite in _local/$Document because -Local parameter is specified."
            $Document = "_local/$Document"
        }
    }
    # Check partition
    if ($Partition) {
        if ($AllDocuments.IsPresent) {
            $Document = "_partition/$Partition/_all_docs"
        } else {
            $Document = "_partition/$Partition"
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
    # Export document in a variable
    if ($Variable) {
        $doc = Send-CouchDBRequest -Server $Server -Port $Port -Method "GET" -Database $Database -Document $Document -Authorization $Authorization -Ssl:$Ssl
        $exportDoc = New-Object -TypeName PSCouchDBDocument
        [void] $exportDoc.FromJson(($doc | ConvertTo-Json -Depth 99))
        Set-Variable -Name $Variable -Value $exportDoc -Scope Global
        return $null
    }
    if ($AsJob.IsPresent) {
        Send-CouchDBRequest -Server $Server -Port $Port -Method "GET" -Database $Database -Document $Document -JobName "Get-CouchDBDocument" -Authorization $Authorization -Ssl:$Ssl
    } else {
        Send-CouchDBRequest -Server $Server -Port $Port -Method "GET" -Database $Database -Document $Document -Authorization $Authorization -Ssl:$Ssl
    }
}

function New-CouchDBDocument () {
    <#
    .SYNOPSIS
    Create a new document.
    .DESCRIPTION
    Creates a new document in the specified database, using the supplied JSON document structure or [hashtable] object.
    If the JSON structure, [hashtable] or [PSCouchDBDocument] object includes the _id field, then the document will be created with the specified document ID.
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
    .PARAMETER Attachment
    Add attachment file (full path) to CouchDB document.
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
    $data = '{"ask":"Ultimate Question of Life, the Universe and Everything","answer":42}'
    New-CouchDBDocument -Database test -Document "Hitchhikers" -Data $data -Authorization "admin:password"
    The example create document "Hitchhikers" with data $data.
    .EXAMPLE
    $data = @{"answer"=42; "ask"="Ultimate Question of Life, the Universe and Everything"}
    New-CouchDBDocument -Database test -Document "Hitchhikers" -Data $data -Partition Guide -Authorization "admin:password"
    The example create document "Hitchhikers" with data $data and partition "Guide"
    .EXAMPLE
    using module PSCouchDB
    $data = New-Object PSCouchDBDocument
    $data.SetElement('answer', 42)
    $data.SetElement('ask', "Ultimate Question of Life, the Universe and Everything")
    New-CouchDBDocument -Database test -Document "Hitchhikers" -Data $data -Authorization "admin:password"
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
        [string] $Attachment,
        [switch] $BatchMode,
        $Authorization,
        [switch] $Ssl
    )
    # Check type of Data
    if ($Data -is [hashtable]) {
        $Doc = New-Object -TypeName PSCouchDBDocument -ArgumentList $Document
        [void] $Doc.FromJson(($Data | ConvertTo-Json -Depth 99))
        $Data = $Doc
    } elseif ($Data -is [string]) {
        $Doc = New-Object -TypeName PSCouchDBDocument -ArgumentList $Document
        [void] $Doc.FromJson($Data)
        $Data = $Doc
    } elseif ($Data -is [PSCouchDBDocument]) {
        $Document = $Data._id
    }
    # Add attachment
    if ($Attachment) { $Data.AddAttachment($Attachment) }
    # Convert data to json
    $Data = $Data.ToJson(99)
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
    The data in Json format, PSCouchDBDocument or hastable.
    .PARAMETER Replace
    Overwrite data.
    .PARAMETER Attachment
    Add attachment file (full path) to CouchDB document.
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
    $data = '{"answer":42, "ask":"Ultimate Question of Life, the Universe and Everything"}'
    Set-CouchDBDocument -Database test -Document "Hitchhikers" -Revision 1-2c903913030efb4d711db085b1f44107 -Data $data -Authorization "admin:password"
    The example modify document "Hitchhikers" with data $data; if the element of $data exists, overwrite, else adding new element.
    .EXAMPLE
    $data = @{"answer"=42; "ask"="Ultimate Question of Life, the Universe and Everything"}
    Set-CouchDBDocument -Database test -Document "Hitchhikers" -Revision 1-2c903913030efb4d711db085b1f44107 -Data $data -Replace -Authorization "admin:password"
    The example overwrite document "Hitchhikers" with data $data.
    .EXAMPLE
    using module PSCouchDB
    $data = New-Object -TypeName PSCouchDBDocument
    $data.SetElement('test',1)
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
        [string] $Attachment,
        [switch] $BatchMode,
        [switch] $NoConflict,
        $Authorization,
        [switch] $Ssl
    )
    if ($Data -is [hashtable]) {
        # Hashtable Data
        $NewData = New-Object -TypeName PSCouchDBDocument
        [void] $NewData.FromJson(($Data | ConvertTo-Json -Depth 99))
        $Data = $NewData
        $Data._id = $Document
        $Data._rev = $Revision
    } elseif ($Data -is [PSCouchDBDocument]) {
        # PSCouchDBDocument Data
        $Data._id = $Document
        $Data._rev = $Revision
    } elseif ($Data -is [string]) {
        # String Data
        $NewData = New-Object -TypeName PSCouchDBDocument
        [void] $NewData.FromJson($Data)
        $Data = $NewData
        $Data._id = $Document
        $Data._rev = $Revision
    }
    if (-not($Replace.IsPresent)) {
        $OldDoc = Get-CouchDBDocument -Server $Server -Port $Port -Database $Database -Document $Document -Revision $Revision -Authorization $Authorization -Ssl:$Ssl -ErrorAction SilentlyContinue
        $OldData = New-Object -TypeName PSCouchDBDocument -ArgumentList $OldDoc._id
        [void] $OldData.FromJson(($OldDoc | ConvertTo-Json -Depth 99))
        foreach ($entry in $OldData.GetDocument().Keys) {
            $Data.SetElement($entry, $OldData.doc[$entry])
        }
        # Restore attachment of old document
        foreach ($att in $($OldDoc)._attachments.psobject.properties) {
            $tempfile = New-TemporaryFile
            Get-CouchDBAttachment -Server $Server -Port $Port -Database $Database -Document $Document -Revision $Revision -Attachment $att.Name -Authorization $Authorization -Ssl:$Ssl | Out-File -Encoding utf8 -FilePath $tempfile
            # Attach file to document
            $attachName = Join-Path -Path $tempfile.DirectoryName -ChildPath $att.Name
            Rename-Item -Path $tempfile.FullName -NewName $attachName -Force
            $Data.AddAttachment($attachName)
            Remove-Item -Path $attachName -Force
        }
        # Add attachment
        if ($Attachment) { $Data.AddAttachment($Attachment) }
    } else {
        # Replace attachment
        if ($Attachment) { $Data.ReplaceAttachment($Attachment) }
    }
    # Check BatchMode
    if ($BatchMode.IsPresent) { 
        $Document += "?batch=ok" 
        # Check NoConflict
    } elseif ($NoConflict.IsPresent -and $Revision) { 
        $Document += "?rev=$Revision&new_edits=false"
        $Revision = $null
    }
    # Convert doc object to json
    $Data = $Data.ToJson(99)
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
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory = $true, ValueFromPipeline = $true)]
        [string] $Database,
        [Parameter(mandatory = $true)]
        [string] $Document,
        [Parameter(mandatory = $true)]
        [string] $Revision,
        $Authorization,
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
        $Authorization,
        [switch] $Ssl
    )
    # Check document id exists
    if (-not(Get-CouchDBDocument -Server $Server -Port $Port -Database $Database -Document $Document -Revision $Revision -Info -Authorization $Authorization -Ssl:$Ssl -ErrorAction SilentlyContinue)) {
        throw "The specific document $Document does not exists."
    } else {
        $Doc = New-Object -TypeName PSCouchDBDocument
        [void] $Doc.FromJson((Get-CouchDBDocument -Server $Server -Port $Port -Database $Database -Document $Document -Revision $Revision -Authorization $Authorization -Ssl:$Ssl | ConvertTo-Json -Depth 99))
        $Doc.SetElement('_id', $Destination)
        # Remove _rev
        $Doc.RemoveElement('_rev')
        $Data = $Doc.ToJson(99)
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
    .PARAMETER Data
    The data in Json format or PSCouchDBBulkDocument.
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
    using module PSCouchDB
    $bdocs = New-Object PSCouchDBBulkDocument -ArgumentList '{"_id":"test"}'
    $bdocs.AddDocument('{"_id":"test1"}')
    Get-CouchDBBulkDocument -Database test -Data $bdocs -Authorization admin:password
    This example get list of two document: "test","test1" on a database "test".
    .EXAMPLE
    using module PSCouchDB
    $bdocs = New-Object PSCouchDBBulkDocument -ArgumentList '{"_id":"test", "_rev":"1-49ce25e3db701c8cb613c1fd18d99619"}'
    $bdocs.AddDocument('{"_id":"test1", "_rev":"1-49ce25e3db701c8cb613c1fd18d99619"}')
    Get-CouchDBBulkDocument -Database test -Data $bdocs -Authorization admin:password
    This example get list of two document: "test","test1" with _rev on a database "test".
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/documents.html#get-a-bulk-documents
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory = $true)]
        [string] $Database,
        $Data,
        $Authorization,
        [switch] $Ssl,
        [switch] $AsJob
    )
    # Check data is string or PSCouchDBBulkDocument
    if ($Data -is [PSCouchDBBulkDocument]) {
        $Data = $Data.ToString()
    }
    $Document = "_bulk_get"
    if ($AsJob.IsPresent) {
        Send-CouchDBRequest -Server $Server -Port $Port -Method "POST" -Database $Database -Document $Document -Data $Data -JobName "Get-CouchDBBulkDocument" -Authorization $Authorization -Ssl:$Ssl
    } else {
        Send-CouchDBRequest -Server $Server -Port $Port -Method "POST" -Database $Database -Document $Document -Data $Data -Authorization $Authorization -Ssl:$Ssl
    }
}

function New-CouchDBBulkDocument () {
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
    .PARAMETER Data
    The data in Json format or PSCouchDBBulkDocument.
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
    using module PSCouchDB
    $bdocs = New-Object PSCouchDBBulkDocument -ArgumentList '{"_id":"test","name":"test"}'
    $bdocs.AddDocument('{"_id":"test1","name":"test"}')
    New-CouchDBBulkDocument -Database test -Data $bdocs -Authorization admin:password
    Add two documents to database "test" with PSCouchDBBulkDocument object.
    .EXAMPLE
    $bdocs = "{
        "docs":  [
                    {
                        "_id":  "test",
                        "name":  "test"
                    },
                    {
                        "_id":  "test1",
                        "name":  "test"
                    }
                ]
    }"
    New-CouchDBBulkDocument -Database test -Data $bdocs -Authorization admin:password
    Add two documents to database "test" with json format.
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/documents.html#create-documents-in-bulk
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory = $true)]
        [string] $Database,
        $Data,
        $Authorization,
        [switch] $Ssl,
        [switch] $AsJob
    )
    # Check data is string or PSCouchDBBulkDocument
    if ($Data -is [PSCouchDBBulkDocument]) {
        $Data = $Data.ToString()
    }
    $Document = "_bulk_docs"
    if ($AsJob.IsPresent) {
        Send-CouchDBRequest -Server $Server -Port $Port -Method "POST" -Database $Database -Document $Document -Data $Data -JobName "New-CouchDBBulkDocument" -Authorization $Authorization -Ssl:$Ssl
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
    .PARAMETER Variable
    Export into a PSCouchDBAttachment variable object.
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
        [string] $Variable,
        [Parameter(ParameterSetName = "Attachment")]
        [Parameter(ParameterSetName = "Info")]
        $Authorization,
        [Parameter(ParameterSetName = "Attachment")]
        [Parameter(ParameterSetName = "Info")]
        [switch] $Ssl
    )
    # Export attachment in a variable
    if ($Variable) {
        $tempfile = New-TemporaryFile
        $attachName = Join-Path -Path $tempfile.DirectoryName -ChildPath $(Split-Path -Path $Attachment -Leaf)
        $attachment = Send-CouchDBRequest -Server $Server -Port $Port -Method "GET" -Database $Database -Document $Document -Revision $Revision -Attachment $Attachment -Authorization $Authorization -Ssl:$Ssl | Out-File $tempfile.FullName -Encoding utf8
        Rename-Item -Path $tempfile.FullName -NewName $attachName -Force
        $exportAttachment = New-Object -TypeName PSCouchDBAttachment -ArgumentList $attachName
        Remove-Item -Path $attachName -Force
        Set-Variable -Name $Variable -Value $exportAttachment -Scope Global
        return $null
    }
    if ($Info.IsPresent) {
        $Method = "HEAD"
    } else {
        $Method = "GET"
    }
    # Save Attachment
    if ($OutFile) {
        (Send-CouchDBRequest -Server $Server -Port $Port -Method $Method -Database $Database -Document $Document -Revision $Revision -Attachment $Attachment -Authorization $Authorization -Ssl:$Ssl).results | Out-File $OutFile -Encoding utf8
        return "$OutFile"
    }
    Send-CouchDBRequest -Server $Server -Port $Port -Method $Method -Database $Database -Document $Document -Revision $Revision -Attachment $Attachment -Authorization $Authorization -Ssl:$Ssl
}

function Add-CouchDBAttachment () {
    <#
    .SYNOPSIS
    Create or replace a new attachment on document.
    .DESCRIPTION
    Create or replace a new CouchDB attachment on document.
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
    Add-CouchDBAttachment -Database test -Document "Hitchhikers" -Revision "2-4705a219cdcca7c72aac4f623f5c46a8" -Attachment test.txt
    This example add attachment "test.txt" on "Hitchhikers" document from database "test".
    .EXAMPLE
    using module PSCouchDB
    $Attachment = New-Object PSCouchDBAttachment -ArgumentList "C:\temp\bin.exe"
    Add-CouchDBAttachment -Database test -Document "Hitchhikers" -Revision "2-4705a219cdcca7c72aac4f623f5c46a8" -Attachment $Attachment
    This example add attachment "bin.exe" on "Hitchhikers" document from database "test" with PSCouchDBAttachment object.
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/documents.html#create-an-attachment
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
        $Attachment,
        [Parameter(mandatory = $true)]
        [string] $Revision,
        $Authorization,
        [switch] $Ssl
    )
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
    Send-CouchDBRequest -Server $Server -Port $Port -Method "PUT" -Database $Database -Document $Document -Attachment $Attachment -Revision $Revision -Authorization $Authorization -Ssl:$Ssl
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
    [CmdletBinding()]
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
        $Authorization,
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
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory = $true)]
        [string] $Database,
        [Parameter(mandatory = $true, ValueFromPipeline = $true)]
        [array] $Document,
        $Authorization,
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
        $Authorization,
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
            Send-CouchDBRequest -Server $Server -Port $Port -Method "POST" -Database $Database -Document $Document -Data $Data -JobName "Search-CouchDBFullText" -Authorization $Authorization -Ssl:$Ssl
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
    .PARAMETER Partition
    The CouchDB partition.
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
        [Parameter(ParameterSetName = "Native")]
        [string] $Partition,
        [Parameter(ParameterSetName = "PSCouchDB")]
        [Parameter(ParameterSetName = "Native")]
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
        $Authorization,
        [Parameter(ParameterSetName = "PSCouchDB")]
        [Parameter(ParameterSetName = "Native")]
        [switch] $Ssl,
        [Parameter(ParameterSetName = "PSCouchDB")]
        [Parameter(ParameterSetName = "Native")]
        [switch] $AsJob
    )

    # Check partition
    if ($Partition) {
        $Document = "_partition/$Partition/"
    }
    if ($Explain.IsPresent) {
        $Document += '_explain'
    } else {
        $Document += '_find'
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
        Send-CouchDBRequest -Server $Server -Port $Port -Method "POST" -Database $Database -Document $Document -Data $Data -JobName "Find-CouchDBDocuments" -Authorization $Authorization -Ssl:$Ssl
    } else {
        Send-CouchDBRequest -Server $Server -Port $Port -Method "POST" -Database $Database -Document $Document -Data $Data -Authorization $Authorization -Ssl:$Ssl
    }
}
