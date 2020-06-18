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
    [CmdletBinding()]
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
        [string] $Authorization,
        [switch]$Force,
        [switch] $Ssl
    )
    $Document = "_design/$Document"
    if ($Force -or $PSCmdlet.ShouldContinue("Do you wish remove attachment $Attachment in design document $Document on database $Database ?", "Remove attachment $Attachment in design document $Document on database $Database")) {
        Send-CouchDBRequest -Server $Server -Port $Port -Method "DELETE" -Database $Database -Document $Document -Attachment $Attachment -Revision $Revision -Authorization $Authorization -Ssl:$Ssl
    }
}