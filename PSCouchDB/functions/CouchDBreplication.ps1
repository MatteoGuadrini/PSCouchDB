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
        $Authorization,
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
        $Authorization,
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
        $Authorization,
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
        $Data,
        $Authorization,
        [switch] $Ssl
    )
    $Database = "_replicator"
    # Check if replicator database exists
    if (-not(Test-CouchDBDatabase -Server $Server -Port $Port -Database $Database -Authorization $Authorization -Ssl:$Ssl -ErrorAction SilentlyContinue)) {
        New-CouchDBDatabase -Server $Server -Port $Port -Database $Database -Authorization $Authorization -Ssl:$Ssl | Out-Null
    }
    # Check data if PSCouchDBReplication or string
    if ($Data -is [PSCouchDBReplication]) {
        $Data = $Data.ToJson()
    }
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
        $Authorization,
        [switch] $Ssl
    )
    $parameters = @()
    if (-not(Test-CouchDBDatabase -Server $Server -Port $Port -Database $Database -Authorization $Authorization -Ssl:$Ssl -ErrorAction SilentlyContinue)) {
        throw "Database $Database is not exists."
    }
    $Document = '_changes'
    if ($Filter) {
        $parameters += 'filter=_doc_ids'
        $Data = "{ `"doc_ids`": $($Filter | ConvertTo-Json -Compress) }"
        Send-CouchDBRequest -Server $Server -Port $Port -Method "POST" -Database $Database -Document $Document -Params $parameters -Data $Data -Authorization $Authorization -Ssl:$Ssl
    } elseif ($Continuous.IsPresent) { 
        $parameters += 'feed=continuous'
        $Data = "{}"
        Send-CouchDBRequest -Server $Server -Port $Port -Method "POST" -Database $Database -Document $Document -Params $parameters -Data $Data -Authorization $Authorization -Ssl:$Ssl
    } else {
        Send-CouchDBRequest -Server $Server -Port $Port -Method "GET" -Database $Database -Document $Document -Params $parameters -Authorization $Authorization -Ssl:$Ssl
    }
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
        [Parameter(mandatory = $true)]
        $Data,
        $Authorization,
        [switch] $Ssl
    )
    $Database = "_replicator"
    if (-not(Test-CouchDBDatabase -Database $Database -Authorization $Authorization -Ssl:$Ssl -ErrorAction SilentlyContinue)) {
        throw "Database _replicator not exists."
    }
    # Check data if PSCouchDBReplication or string
    if ($Data -is [PSCouchDBReplication]) {
        $Data = $Data.ToJson()
    }
    Send-CouchDBRequest -Server $Server -Port $Port -Method "PUT" -Database $Database -Data $Data -Authorization $Authorization -Ssl:$Ssl
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
    [CmdletBinding()]
    param(
        [Parameter(ValueFromPipeline = $true)]
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory = $true)]
        [string] $Document,
        [Parameter(mandatory = $true)]
        [string] $Revision,
        $Authorization,
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
        [switch] $Ssl
    )
    $Database = "_replicate"
    # Check data if PSCouchDBReplication or string
    if ($Data -is [PSCouchDBReplication]) {
        $Data = $Data.ToJson()
    }
    Send-CouchDBRequest -Server $Server -Port $Port -Method "POST" -Database $Database -Data $Data -Authorization $Authorization -Ssl:$Ssl
}