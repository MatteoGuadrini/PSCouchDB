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