# Replication functions of CouchDB module

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
    .PARAMETER ProxyServer
    Proxy server through which all non-local calls pass.
    Ex. ... -ProxyServer 'http://myproxy.local:8080' ...
    .PARAMETER ProxyCredential
    Proxy server credential. It must be specified with a PSCredential object.
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
        [Parameter(ValueFromPipeline = $true, Position = 0)]
        [string] $Document = '_all_docs',
        $Authorization,
        [switch] $Ssl,
        [string] $ProxyServer,
        [pscredential] $ProxyCredential
    )
    $Database = "_replicator"
    if (-not(Test-CouchDBDatabase -Server $Server -Port $Port -Database $Database -Authorization $Authorization -Ssl:$Ssl  -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential -ErrorAction SilentlyContinue)) {
        throw "Database replicator $Database not exists."
    }
    Send-CouchDBRequest -Server $Server -Port $Port -Method "GET" -Database $Database -Document $Document -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential
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
    .PARAMETER ProxyServer
    Proxy server through which all non-local calls pass.
    Ex. ... -ProxyServer 'http://myproxy.local:8080' ...
    .PARAMETER ProxyCredential
    Proxy server credential. It must be specified with a PSCredential object.
    .EXAMPLE
    Get-CouchDBReplicationScheduler -Authorization "admin:password"
    This example get scheduler of replication documents.
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/server.html#get-replica
    #>
    [CmdletBinding()]
    param(
        [Parameter(ValueFromPipeline = $true, Position = 0)]
        [string] $Server,
        [int] $Port,
        [int] $Limit,
        [int] $Skip,
        $Authorization,
        [switch] $Ssl,
        [string] $ProxyServer,
        [pscredential] $ProxyCredential
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
    Send-CouchDBRequest -Server $Server -Port $Port -Method "GET" -Database $Database -Document $Document -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential
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
    .PARAMETER ProxyServer
    Proxy server through which all non-local calls pass.
    Ex. ... -ProxyServer 'http://myproxy.local:8080' ...
    .PARAMETER ProxyCredential
    Proxy server credential. It must be specified with a PSCredential object.
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
        [Parameter(Position = 0)]
        [string] $ReplicatorDatabase,
        [ValidateScript( { if ($ReplicatorDatabase) { $true } else { $false } })]
        [Parameter(Position = 1)]
        [string] $ReplicatorDocuments,
        $Authorization,
        [switch] $Ssl,
        [string] $ProxyServer,
        [pscredential] $ProxyCredential
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
    Send-CouchDBRequest -Server $Server -Port $Port -Method "GET" -Database $Database -Document $Document -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential
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
        POST /_replicator
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER Data
    The data in json format or PSCouchDBReplication object.
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
    using module PSCouchDB
    $rep = New-Object PSCouchDBReplication -ArgumentList 'test','reptest'
    $rep.SetContinuous()
    New-CouchDBReplication -Data $rep -Authorization "admin:password"
    This example create replication from database "test" to database "reptest" in Continuous mode.
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/server.html#create-replica
    #>
    [CmdletBinding()]
    param(
        [Parameter(ValueFromPipeline = $true)]
        [string] $Server,
        [int] $Port,
        [Parameter(Position = 0)]
        $Data,
        $Authorization,
        [switch] $Ssl,
        [string] $ProxyServer,
        [pscredential] $ProxyCredential
    )
    $Database = "_replicator"
    # Check if replicator database exists
    if (-not(Test-CouchDBDatabase -Server $Server -Port $Port -Database $Database -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential -ErrorAction SilentlyContinue)) {
        New-CouchDBDatabase -Server $Server -Port $Port -Database $Database -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential | Out-Null
    }
    # Check data if PSCouchDBReplication or string
    if ($Data -is [PSCouchDBReplication]) {
        $Data = $Data.ToJson()
    }
    Send-CouchDBRequest -Server $Server -Port $Port -Method "POST" -Database $Database -Data $Data -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential
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
    .PARAMETER DocIds
    The CouchDB document ids array.
    .PARAMETER Filter
    Reference to a filter function from a design document that will filter whole stream emitting only filtered events.
    .PARAMETER Continuous
    Sends a line of JSON per event. Keeps the socket open until timeout.
    .PARAMETER IncludeDocs
    Include the associated document with each result. If there are Conflicts, only the winning revision is returned.
    .PARAMETER Conflicts
    Includes conflicts information in response. Ignored if IncludeDocs isn't true.
    .PARAMETER Descending
    Return the change results in descending sequence order (most recent change first).
    .PARAMETER Feed
    [normal] Specifies Normal Polling Mode. All past changes are returned immediately. Default.
    [longpoll] Specifies Long Polling Mode. Waits until at least one change has occurred, sends the change, then closes the connection. Most commonly used in conjunction with since=now, to wait for the next change.
    [continuous] Sets Continuous Mode. Sends a line of JSON per event. Keeps the socket open until timeout.
    [eventsource] Sets Event Source Mode. Works the same as Continuous Mode, but sends the events in EventSource format.
    .PARAMETER Heartbeat
    Period in milliseconds after which an empty line is sent in the results. Only applicable for longpoll, continuous, and eventsource feeds. Overrides any timeout to keep the feed alive indefinitely. Default is 60000.
    .PARAMETER Attachments
    Include the Base64-encoded content of attachments in the documents that are included if IncludeDocs is true. Ignored if IncludeDocs isn't true. Default is false.
    .PARAMETER AttachmentsEncoding
    Include encoding information in attachment stubs if IncludeDocs is true and the particular attachment is compressed. Ignored if IncludeDocs isn't true. Default is false.
    .PARAMETER LastEventId
    Alias of Last-Event-ID header.
    .PARAMETER Limit
    Limit number of result rows to the specified value (note that using 0 here has the same effect as 1).
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
    Get-CouchDBDatabaseChanges -Database test
    This example get list of changes made to documents in the database "test".
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/databases.html#changes
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory = $true, ValueFromPipeline = $true, Position = 0)]
        [string] $Database,
        [array] $DocIds,
        [string] $Filter,
        [switch] $Continuous,
        [switch] $IncludeDocs,
        [switch] $Conflicts,
        [switch] $Descending,
        [ValidateSet("normal", "longpoll", "continuous", "eventsource")]
        [string] $Feed,
        [int] $Heartbeat,
        [switch] $Attachments,
        [switch] $AttachmentsEncoding,
        [int] $LastEventId,
        [int] $Limit,
        $Authorization,
        [switch] $Ssl,
        [string] $ProxyServer,
        [pscredential] $ProxyCredential
    )
    $parameters = @()
    if (-not(Test-CouchDBDatabase -Server $Server -Port $Port -Database $Database -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential -ErrorAction SilentlyContinue)) {
        throw "Database $Database is not exists."
    }
    $Document = '_changes'
    # Calculate POST parametes and data
    if ($DocIds) {
        $parameters += 'filter=_doc_ids'
        $Data = "{ `"doc_ids`": $($DocIds | ConvertTo-Json -Compress) }"
    }
    Send-CouchDBRequest -Server $Server -Port $Port -Method "POST" -Database $Database -Document $Document -Data $Data -Params $parameters -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential
    return
    # Calculate GET parametes and data
    if ($Filter) {
        $parameters += "filter=$Filter"
    }
    if ($Continuous.IsPresent) { 
        $parameters += 'feed=continuous'
    }
    if ($IncludeDocs.IsPresent) { 
        $parameters += 'include_docs=true'
    }
    if ($Conflicts.IsPresent) {
        if ($IncludeDocs.IsPresent) {
            $parameters += 'conflicts=true'
        } else {
            Write-Warning -Message "Conflicts ignored because IncludeDocs isn't true."
        }
    }
    if ($Descending.IsPresent) { 
        $parameters += 'descending=true'
    }
    if ($Feed) { 
        $parameters += "feed=$Feed"
    }
    if ($Heartbeat) { 
        $parameters += "heartbeat=$Heartbeat"
    }
    if ($Attachments.IsPresent) {
        if ($IncludeDocs.IsPresent) {
            $parameters += 'attachments=true'
        } else {
            Write-Warning -Message "Attachments ignored because IncludeDocs isn't true."
        }
    }
    if ($AttachmentsEncoding.IsPresent) {
        if ($IncludeDocs.IsPresent) {
            $parameters += 'att_encoding_info=true'
        } else {
            Write-Warning -Message "AttachmentsEncoding ignored because IncludeDocs isn't true."
        }
    }
    if ($LastEventId) { 
        $parameters += "last-event-id=$LastEventId"
    }
    if ($Limit) { 
        $parameters += "limit=$Limit"
    }
    Send-CouchDBRequest -Server $Server -Port $Port -Method "GET" -Database $Database -Document $Document -Params $parameters -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential
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
        PUT /_replicator
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER Data
    The data in json format or PSCouchDBReplication object.
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
    using module PSCouchDB
    $rep = New-Object PSCouchDBReplication -ArgumentList 'test','reptest'
    $rep.SetContinuous()
    $rep.SetRevision("4-c2cefa18494e47182a125b11eccecd13")
    Set-CouchDBReplication -Data $rep -Authorization "admin:password"
    This example modify replication from database "test" to database "reptest" in Continuous mode.
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/server.html#modify-replica
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory = $true, Position = 0)]
        $Data,
        $Authorization,
        [switch] $Ssl,
        [string] $ProxyServer,
        [pscredential] $ProxyCredential
    )
    $Database = "_replicator"
    if (-not(Test-CouchDBDatabase -Database $Database -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential -ErrorAction SilentlyContinue)) {
        throw "Database _replicator not exists."
    }
    # Check data if PSCouchDBReplication or string
    if ($Data -is [PSCouchDBReplication]) {
        $Data = $Data.ToJson()
    }
    Send-CouchDBRequest -Server $Server -Port $Port -Method "PUT" -Database $Database -Data $Data -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential
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
    .PARAMETER ProxyServer
    Proxy server through which all non-local calls pass.
    Ex. ... -ProxyServer 'http://myproxy.local:8080' ...
    .PARAMETER ProxyCredential
    Proxy server credential. It must be specified with a PSCredential object.
    .EXAMPLE
    Remove-CouchDBReplication -Document localhost-test_localhost-test_dump -Revision "2-4705a219cdcca7c72aac4f623f5c46a8" -Authorization "admin:password"
    The example removes "localhost-test_localhost-test_dump" replication document.
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/server.html#remove-replica
    #>
    [CmdletBinding()]
    param(
        [Parameter(ValueFromPipeline = $true)]
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory = $true, Position = 0)]
        [string] $Document,
        [Parameter(mandatory = $true, Position = 1)]
        [string] $Revision,
        $Authorization,
        [switch] $Force,
        [switch] $Ssl,
        [string] $ProxyServer,
        [pscredential] $ProxyCredential
    )
    $Database = "_replicator"
    if (-not(Test-CouchDBDatabase -Database $Database -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential -ErrorAction SilentlyContinue)) {
        throw "Database _replicator is not exists."
    }
    if ($Force -or $PSCmdlet.ShouldContinue("Do you wish remove replication $Document ?", "Remove $Document")) {
        Send-CouchDBRequest -Server $Server -Port $Port -Method "DELETE" -Database $Database -Document $Document -Revision $Revision -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential
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
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER Data
    The data in json format or PSCouchDBReplication object.
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
    using module PSCouchDB
    $rep = New-Object PSCouchDBReplication -ArgumentList 'test','reptest'
    $rep.SetContinuous()
    $rep.AddDocIds(@("Hitchhikers","Hitchhikers_Guide"))
    Request-CouchDBReplication -Data $rep -Authorization "admin:password"
    This example request replication of documents "Hitchhikers","Hitchhikers_Guide" from database "test" to database "reptest".
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/server.html#replication-request
    #>
    [CmdletBinding()]
    param(
        [Parameter(ValueFromPipeline = $true)]
        [string] $Server,
        [int] $Port,
        $Data,
        $Authorization,
        [switch] $Ssl,
        [string] $ProxyServer,
        [pscredential] $ProxyCredential
    )
    $Database = "_replicate"
    # Check data if PSCouchDBReplication or string
    if ($Data -is [PSCouchDBReplication]) {
        $Data = $Data.ToJson()
    }
    Send-CouchDBRequest -Server $Server -Port $Port -Method "POST" -Database $Database -Data $Data -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential
}