# Database functions of CouchDB module

function Test-CouchDBDatabase () {
    <#
    .SYNOPSIS
    Test database.
    .DESCRIPTION
    Test if database exists.
    .NOTES
    CouchDB API:
        HEAD /{db}
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
    .PARAMETER ProxyServer
    Proxy server through which all non-local calls pass.
    Ex. ... -ProxyServer 'http://myproxy.local:8080' ...
    .PARAMETER ProxyCredential
    Proxy server credential. It must be specified with a PSCredential object.
    .EXAMPLE
    Test-CouchDBDatabase -Database test
    This example test if database "test" exists.
    .EXAMPLE
    if ($null -eq (Test-CouchDBDatabase -Database test -ErrorAction SilentlyContinue)) {
        Write-Output "Database test exists!"
    } else {
        Write-Output "Create it!"
    }
    This example test if database "test" exists and write to output the condition.
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/databases.html#test-a-database
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory = $true, ValueFromPipeline = $true)]
        [string] $Database,
        $Authorization,
        [switch] $Ssl,
        [string] $ProxyServer,
        [pscredential] $ProxyCredential
    )
    Send-CouchDBRequest -Server $Server -Port $Port -Method "HEAD" -Database $Database -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential
}

function Copy-CouchDBDatabase () {
    <#
    .SYNOPSIS
    Copy database.
    .DESCRIPTION
    Create a new database by copying it from an existing one.
    .NOTES
    CouchDB API:
        HEAD /{db}
        PUT /{db}
        GET /{db}/_all_docs
        PUT /{db}/{doc}
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER RemoteServer
    The CouchDB remote server name.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER RemotePort
    The CouchDB server port. Default is 5984.
    .PARAMETER Database
    The source CouchDB database.
    .PARAMETER Destination
    The destination CouchDB database. A new name must be specified.
    .PARAMETER ExcludeIds
    Array of Docids to exclude to copy. 
    .PARAMETER Authorization
    The CouchDB authorization form; user and password.
    Authorization format like this: user:password
    ATTENTION: if the password is not specified, it will be prompted.
    .PARAMETER RemoteAuthorization
    The CouchDB authorization form for remote server; user and password.
    Authorization format like this: user:password
    ATTENTION: if the password is not specified, it will be prompted.
    .PARAMETER Ssl
    Set ssl connection on CouchDB server.
    This modify protocol to https and port to 6984.
    .PARAMETER AsJob
    Send the command in the background.
    .PARAMETER ProxyServer
    Proxy server through which all non-local calls pass.
    Ex. ... -ProxyServer 'http://myproxy.local:8080' ...
    .PARAMETER ProxyCredential
    Proxy server credential. It must be specified with a PSCredential object.
    .EXAMPLE
    Copy-CouchDBDatabase -Database test -Destination test_new -Authorization admin:password
    Copy a test database in a new test_new database.
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/databases.html#copy-a-database
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [string] $RemoteServer,
        [int] $Port,
        [int] $RemotePort,
        [Parameter(mandatory = $true, ValueFromPipeline = $true)]
        [string] $Database,
        [string] $Destination = $(if ($RemoteServer) {$Database} else {$Database + "_new"}),
        [array] $ExcludeIds,
        $Authorization,
        [string] $RemoteAuthorization,
        [switch] $Ssl,
        [switch] $AsJob,
        [string] $ProxyServer,
        [pscredential] $ProxyCredential
    )
    $all_docs = Get-CouchDBDocument -Server $Server -Port $Port -Database $Database -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential
    # Check RemoteServer is defined
    if ($RemoteServer) {
        $DestinationServer = $RemoteServer
    } else {
        $DestinationServer = $Server
    }
    # Check RemotePort is defined
    if ($RemotePort) {
        $DestinationPort = $RemotePort
    } else {
        $DestinationPort = $Port
    }
    # Check RemoteAuthorization is defined
    if ($RemoteAuthorization) {
        $DestinationAuthorization = $RemoteAuthorization
    } else {
        $DestinationAuthorization = $Authorization
    }
    if (-not(Test-CouchDBDatabase -Server $DestinationServer -Port $DestinationPort -Database $Destination -Authorization $DestinationAuthorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential -ErrorAction SilentlyContinue)) {
        New-CouchDBDatabase -Server $DestinationServer -Port $DestinationPort -Database $Destination -Authorization $DestinationAuthorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential | Out-Null
    } else {
        throw "Database $Destination exists! Choose another name."
    }
    # Start copy
    if ($AsJob.IsPresent) {
        $job = Start-Job -Name "Copy-Database" {
            param($Server, $Port, $Method, $Database, $Document, $Data, $Authorization, $Ssl, $all_docs, $ExcludeIds, $DestinationServer, $DestinationPort, $Destination, $DestinationAuthorization, $ProxyServer, [pscredential]$ProxyCredential)
            $count = 0
            foreach ($doc in $all_docs.rows) {
                if ($ExcludeIds -notcontains $doc.id) {
                    $count++
                    $Data = Get-CouchDBDocument -Server $Server -Port $Port -Database $Database -Document $doc.id -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential | ConvertTo-Json -Depth 99 
                    New-CouchDBDocument -Server $DestinationServer -Port $DestinationPort -Database $Destination -Document $doc.id -Data $($Data -replace '"_rev":.*,?', "") -Authorization $DestinationAuthorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential
                }  
            }
        } -ArgumentList $Server, $Port, $Method, $Database, $Document, $Data, $Authorization, $Ssl, $all_docs, $ExcludeIds, $DestinationServer, $DestinationPort, $Destination, $DestinationAuthorization, $ProxyServer, $ProxyCredential
        Register-TemporaryEvent $job "StateChanged" -Action {
            Write-Host -ForegroundColor Green "Copy database #$($sender.Id) ($($sender.Name)) complete."
        }
    } else {
        $count = 0
        foreach ($doc in $all_docs.rows) {
            if ($ExcludeIds -notcontains $doc.id) {
                $count++
                $Data = Get-CouchDBDocument -Server $Server -Port $Port -Database $Database -Document $doc.id -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential | ConvertTo-Json -Depth 99 
                New-CouchDBDocument -Server $DestinationServer -Port $DestinationPort -Database $Destination -Document $doc.id -Data $($Data -replace '"_rev":.*,?', "") -Authorization $DestinationAuthorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential
                Write-Progress -Activity "Copy document $($doc.id) in a new database $Destination in progress" -Status "Progress $count/$($all_docs.total_rows)" -PercentComplete ($count / $all_docs.total_rows * 100)
            } else {
                Write-Host "Skip $($doc.id) because exists in exclude list."
            }   
        }
    }
}

function Get-CouchDBDatabase () {
    <#
    .SYNOPSIS
    Get a database information.
    .DESCRIPTION
    Gets information about the specified database.
    Without database argument, return a list of all databases.
    .NOTES
    CouchDB API:
        GET /{db}
        GET /_all_dbs
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER Database
    The CouchDB database. Default is _all_dbs.
    .PARAMETER AllDatabase
    The all CouchDB database.
    .PARAMETER Descending
    Return the databases in descending order by key. Default is false. The database must be _all_dbs.
    .PARAMETER EndKey
    Stop returning databases when the specified key is reached. The database must be _all_dbs.
    .PARAMETER Limit
    Limit the number of the returned databases to the specified number. The database must be _all_dbs.
    .PARAMETER Skip
    Skip this number of databases before starting to return the results. Default is 0. The database must be _all_dbs.
    .PARAMETER StartKey
    Return databases starting with the specified key. The database must be _all_dbs.
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
    Get-CouchDBDatabase -Database test
    This example get info of the database "test".
    .EXAMPLE
    Get-CouchDBDatabase
    This example get info of all databases.
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/databases.html#read-a-database
    #>
    [CmdletBinding(DefaultParameterSetName = "Database")]
    param(
        [Parameter(ParameterSetName = "AllDatabase")]
        [Parameter(ParameterSetName = "Database")]
        [Parameter(ValueFromPipeline = $true)]
        [string] $Server,
        [Parameter(ParameterSetName = "Database")]
        [Parameter(ParameterSetName = "AllDatabase")]
        [int] $Port,
        [Parameter(ParameterSetName = "Database")]
        [Parameter(ParameterSetName = "AllDatabase")]
        [string] $Database,
        [Parameter(ParameterSetName = "AllDatabase")]
        [switch] $AllDatabase,
        [Parameter(ParameterSetName = "AllDatabase")]
        [switch] $Descending,
        [Parameter(ParameterSetName = "AllDatabase")]
        [Alias('End')]
        [string] $EndKey,
        [Parameter(ParameterSetName = "AllDatabase")]
        [int] $Limit,
        [Parameter(ParameterSetName = "AllDatabase")]
        [int] $Skip,
        [Parameter(ParameterSetName = "AllDatabase")]
        [Alias('Start')]
        [string] $StartKey,
        [Parameter(ParameterSetName = "Database")]
        [Parameter(ParameterSetName = "AllDatabase")]
        $Authorization,
        [Parameter(ParameterSetName = "Database")]
        [Parameter(ParameterSetName = "AllDatabase")]
        [switch] $Ssl,
        [Parameter(ParameterSetName = "Database")]
        [Parameter(ParameterSetName = "AllDatabase")]
        [string] $ProxyServer,
        [Parameter(ParameterSetName = "Database")]
        [Parameter(ParameterSetName = "AllDatabase")]
        [pscredential] $ProxyCredential
    )
    # All database?
    if ($AllDatabase.IsPresent) {
        $Params = @()
        $Database = "_all_dbs"
    } elseif (-not($Database)) {
        $Params = @()
        $Database = "_all_dbs"
    }
    if ($PSCmdlet.ParameterSetName -eq "AllDatabase") {
        # Check Descending param
        if ($Descending.IsPresent) {
            $Params += "descending=true"
        }
        # Check EndKey param
        if ($EndKey) {
            $Params += "endkey=`"$EndKey`""
        }
        # Check Limit param
        if ($Limit) {
            $Params += "limit=$Limit"
        }
        # Check Skip param
        if ($Skip) {
            $Params += "skip=$Skip"
        }
        # Check StartKey param
        if ($StartKey) {
            $Params += "startkey=`"$StartKey`""
        }
    }
    Send-CouchDBRequest -Server $Server -Port $Port -Method "GET" -Database $Database -Params $Params -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential
}

function New-CouchDBDatabase () {
    <#
    .SYNOPSIS
    Create a new database.
    .DESCRIPTION
    Creates a new database. The database name must be composed by following next rules:
    Name must begin with a lowercase letter (a-z)
    Lowercase characters (a-z)
    Digits (0-9)
    Any of the characters _, $, (, ), +, -, and /.
    If you're familiar with Regular Expressions, the rules above could be written as ^[a-z][a-z0-9_$()+/-]*$.
    .NOTES
    CouchDB API:
        PUT /{db}
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER Database
    The CouchDB database.
    .PARAMETER Partition
    The CouchDB partition database.
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
    New-CouchDBDatabase -Database test -Authorization "admin:password"
    This example create a database "test".
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/databases.html#create-a-database
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory = $true, ValueFromPipeline = $true)]
        [string] $Database,
        [switch] $Partition,
        $Authorization,
        [switch] $Ssl,
        [string] $ProxyServer,
        [pscredential] $ProxyCredential
    )
    if ($Partition.IsPresent) { $Params = "partitioned=true" }
    Send-CouchDBRequest -Server $Server -Port $Port -Method "PUT" -Database $Database -Params $Params -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential
}

function Remove-CouchDBDatabase () {
    <#
    .SYNOPSIS
    Remove a database.
    .DESCRIPTION
    Deletes the specified database, and all the documents and attachments contained within it.
    .NOTES
    CouchDB API:
        DELETE /{db}
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
    Remove-CouchDBDatabase -Database test -Authorization "admin:password"
    This example remove a database "test".
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/databases.html#remove-a-database
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory = $true, ValueFromPipeline = $true)]
        [string] $Database,
        $Authorization,
        [switch]$Force,
        [switch] $Ssl,
        [string] $ProxyServer,
        [pscredential] $ProxyCredential
    )
    if ($Force -or $PSCmdlet.ShouldContinue("Do you wish remove database $Database ?", "Remove database $Database")) {
        Send-CouchDBRequest -Server $Server -Port $Port -Method "DELETE" -Database $Database -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential
    }
}

function Get-CouchDBIndex () {
    <#
    .SYNOPSIS
    Get indexes on database.
    .DESCRIPTION
    When you make a GET request to /db/_index, you get a list of all indexes in the database
    .NOTES
    CouchDB API:
        GET /{db}/_index
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
    .PARAMETER ProxyServer
    Proxy server through which all non-local calls pass.
    Ex. ... -ProxyServer 'http://myproxy.local:8080' ...
    .PARAMETER ProxyCredential
    Proxy server credential. It must be specified with a PSCredential object.
    .EXAMPLE
    Get-CouchDBIndex -Database test
    This example get index document for database "test".
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/databases.html#get-a-index
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory = $true, ValueFromPipeline = $true)]
        [string] $Database,
        $Authorization,
        [switch] $Ssl,
        [string] $ProxyServer,
        [pscredential] $ProxyCredential
    )
    $Document = '_index'
    Send-CouchDBRequest -Server $Server -Port $Port -Method "GET" -Database $Database -Document $Document -Authorization $Authorization -Ssl:$Ssl  -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential
}

function New-CouchDBIndex () {
    <#
    .SYNOPSIS
    Create a new index on database.
    .DESCRIPTION
    Mango is a declarative JSON querying language for CouchDB databases. 
    Mango wraps several index types, starting with the Primary Index out-of-the-box. 
    Mango indexes, with index type json, are built using MapReduce Views.
    .NOTES
    CouchDB API:
        POST /{db}/_index
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER Database
    The CouchDB database.
    .PARAMETER Name
    The name of index.
    .PARAMETER Fields
    Array fields that are indexed.
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
    New-CouchDBIndex -Database test -Name test-index -Fields name,surname -Authorization "admin:password"
    This example create index document "test_index" with fields "name" and "surname" for database "test".
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/databases.html#create-a-new-index
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory = $true, ValueFromPipeline = $true)]
        [string] $Database,
        [Parameter(mandatory = $true)]
        [string] $Name,
        [Parameter(mandatory = $true)]
        [array] $Fields,
        $Authorization,
        [switch] $Ssl,
        [string] $ProxyServer,
        [pscredential] $ProxyCredential
    )
    $Document = '_index'
    $index = @{ 'index' = @{ }; 'type' = 'json' }
    $index.Add('name', "$Name")
    $index.index.fields = @()
    foreach ($Field in $Fields) {
        $index.index.fields += $Field
    }
    $Data = $index | ConvertTo-Json -Depth 3 -Compress
    Send-CouchDBRequest -Server $Server -Port $Port -Method "POST" -Database $Database -Document $Document -Data $Data -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential
}

function Remove-CouchDBIndex () {
    <#
    .SYNOPSIS
    Remove a index on a database.
    .DESCRIPTION
    Remove a index on CouchDB database.
    .NOTES
    CouchDB API:
        DELETE /{db}/_index/{designdoc}/json/{name}
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER Database
    The CouchDB database.
    .PARAMETER DesignDoc
    The CouchDB design document.
    .PARAMETER Name
    The name of index.
    .PARAMETER Fields
    Array fields that are indexed.
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
    $ddoc = Get-CouchDBIndex -Database test -Authorization "admin:password"
    Remove-CouchDBIndex -Database test -DesignDoc $ddoc.indexes.ddoc[1] -Name $ddoc.indexes.name[1] -Authorization "admin:password"
    The example removes an index document on database "test".
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/databases.html#remove-a-index
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory = $true)]
        [string] $Database,
        [Parameter(mandatory = $true)]
        [string] $DesignDoc,
        [Parameter(mandatory = $true, ValueFromPipeline = $true)]
        [string] $Name,
        $Authorization,
        [switch]$Force,
        [switch] $Ssl,
        [string] $ProxyServer,
        [pscredential] $ProxyCredential
    )
    $Document = "_index/$DesignDoc/json/$Name"
    if ($Force -or $PSCmdlet.ShouldContinue("Do you wish remove index $Name on $DesignDoc ?", "Remove index $Name on $DesignDoc on database $Database")) {
        Send-CouchDBRequest -Server $Server -Port $Port -Method "DELETE" -Database $Database -Document $Document -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential
    }
}

function Get-CouchDBDatabaseInfo () {
    <#
    .SYNOPSIS
    Get a databases information.
    .DESCRIPTION
    Returns information of a list of the specified databases in the CouchDB instance.
    .NOTES
    CouchDB API:
        GET /_purged_infos_limit
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER Keys
    Array of database names to be requested.
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
    Get-CouchDBDatabaseInfo -Keys test
    This example get info of the database purged documents limit "test".
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/databases.html#get-purged-info-limit
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory = $true, ValueFromPipeline = $true)]
        [array] $Keys,
        $Authorization,
        [switch] $Ssl,
        [string] $ProxyServer,
        [pscredential] $ProxyCredential
    )
    $Database = '_dbs_info'
    $Data = @{ keys = @() }
    if ($Keys) { $Data.keys += $Keys }
    $Data = $Data | ConvertTo-Json -Depth 3
    Send-CouchDBRequest -Server $Server -Port $Port -Method "POST" -Database $Database -Data $Data -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential
}

function Get-CouchDBDatabaseShards () {
    <#
    .SYNOPSIS
    Get shards database list.
    .DESCRIPTION
    Returns a list of shard will have its internal database range, and the nodes on which replicas of those shards are stored.
    .NOTES
    CouchDB API:
        GET /{db}/_shards
        GET /{db}/_shards/{docid}
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
    .PARAMETER Ssl
    Set ssl connection on CouchDB server.
    This modify protocol to https and port to 6984.
    .PARAMETER ProxyServer
    Proxy server through which all non-local calls pass.
    Ex. ... -ProxyServer 'http://myproxy.local:8080' ...
    .PARAMETER ProxyCredential
    Proxy server credential. It must be specified with a PSCredential object.
    .EXAMPLE
    Get-CouchDBDatabaseShards -Database test
    This example get list of shard will have its internal database range "test".
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/databases.html#get-shards
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory = $true, ValueFromPipeline = $true)]
        [string] $Database,
        [string] $Document,
        $Authorization,
        [switch] $Ssl,
        [string] $ProxyServer,
        [pscredential] $ProxyCredential
    )
    $Database = $Database + '/_shards'
    Send-CouchDBRequest -Server $Server -Port $Port -Method "GET" -Database $Database -Document $Document -Authorization $Authorization -Ssl:$Ssl-ProxyServer $ProxyServer -ProxyCredential $ProxyCredential
}

function Sync-CouchDBDatabaseShards () {
    <#
    .SYNOPSIS
    Sync shards on database.
    .DESCRIPTION
    Force-starts internal shard synchronization for all replicas of all database shards.
    .NOTES
    CouchDB API:
        POST /{db}/_sync_shards
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
    .PARAMETER ProxyServer
    Proxy server through which all non-local calls pass.
    Ex. ... -ProxyServer 'http://myproxy.local:8080' ...
    .PARAMETER ProxyCredential
    Proxy server credential. It must be specified with a PSCredential object.
    .EXAMPLE
    Sync-CouchDBDatabaseShards -Database test -Authorization "admin:password"
    This example sync shards in all replicas from database "test".
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/databases.html#sync-shards
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory = $true, ValueFromPipeline = $true)]
        [string] $Database,
        $Authorization,
        [switch] $Ssl,
        [string] $ProxyServer,
        [pscredential] $ProxyCredential
    )
    $Database = $Database + '/_sync_shards'
    $Data = "{}"
    Send-CouchDBRequest -Server $Server -Port $Port -Method "POST" -Database $Database -Data $Data -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential
}

function Compress-CouchDBDatabase () {
    <#
    .SYNOPSIS
    Compress database.
    .DESCRIPTION
    Request compaction of the specified database. Compaction compresses the disk database file.
    .NOTES
    CouchDB API:
        POST /{db}/_compact
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
    .PARAMETER Ssl
    Set ssl connection on CouchDB server.
    This modify protocol to https and port to 6984.
    .PARAMETER ProxyServer
    Proxy server through which all non-local calls pass.
    Ex. ... -ProxyServer 'http://myproxy.local:8080' ...
    .PARAMETER ProxyCredential
    Proxy server credential. It must be specified with a PSCredential object.
    .EXAMPLE
    Compress-CouchDBDatabase -Database test -Authorization "admin:password"
    This example compact database "test".
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/documents.html#get-an-attachment
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory = $true, ValueFromPipeline = $true)]
        [string] $Database,
        $Authorization,
        [switch] $Ssl,
        [string] $ProxyServer,
        [pscredential] $ProxyCredential
    )
    $Document = '_compact'
    $Data = '{}'
    Send-CouchDBRequest -Server $Server -Port $Port -Method "POST" -Database $Database -Document $Document -Data $Data -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential
}

function Write-CouchDBFullCommit () {
    <#
    .SYNOPSIS
    Commits any recent changes.
    .DESCRIPTION
    Commits any recent changes to the specified database to disk. 
    You should call this if you want to ensure that recent changes have been flushed.
    .NOTES
    CouchDB API:
        POST /{db}/_ensure_full_commit
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
    Write-CouchDBFullCommit -Database test -Authorization "admin:password"
    The example write all commit the disk of database "test".
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/databases.html#write-a-commit
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory = $true, ValueFromPipeline = $true)]
        [string] $Database,
        $Authorization,
        [switch]$Force,
        [switch] $Ssl,
        [string] $ProxyServer,
        [pscredential] $ProxyCredential
    )
    $Document = '_ensure_full_commit'
    $Data = '{}'
    if ($Force -or $PSCmdlet.ShouldContinue("Do you wish to commits any recent changes to the specified database $Database to disk ?", "Commit changes")) {
        Send-CouchDBRequest -Server $Server -Port $Port -Method "POST" -Database $Database -Document $Document -Data $Data -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential
    }
}

function Clear-CouchDBView () {
    <#
    .SYNOPSIS
    Clean view indexes.
    .DESCRIPTION
    Removes view index files that are no longer required by CouchDB as a result of changed views within design documents.
    .NOTES
    CouchDB API:
        GET /{db}/_view_cleanup
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
    .PARAMETER ProxyServer
    Proxy server through which all non-local calls pass.
    Ex. ... -ProxyServer 'http://myproxy.local:8080' ...
    .PARAMETER ProxyCredential
    Proxy server credential. It must be specified with a PSCredential object.
    .EXAMPLE
    Clear-CouchDBView -Database test -Authorization "admin:password"
    This example removes index files on database "test".
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/databases.html#clear-view
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory = $true, ValueFromPipeline = $true)]
        [string] $Database,
        $Authorization,
        [switch] $Ssl,
        [string] $ProxyServer,
        [pscredential] $ProxyCredential
    )
    $Document = "_view_cleanup"
    Send-CouchDBRequest -Server $Server -Port $Port -Method "POST" -Database $Database -Document $Document -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential
}

function Get-CouchDBDatabasePurgedLimit () {
    <#
    .SYNOPSIS
    Get a database purged documents limit.
    .DESCRIPTION
    Gets the current purged_infos_limit (purged documents limit).
    .NOTES
    CouchDB API:
        GET /_purged_infos_limit
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
    .PARAMETER ProxyServer
    Proxy server through which all non-local calls pass.
    Ex. ... -ProxyServer 'http://myproxy.local:8080' ...
    .PARAMETER ProxyCredential
    Proxy server credential. It must be specified with a PSCredential object.
    .EXAMPLE
    Get-CouchDBDatabasePurgedLimit -Database test
    This example get info of the database purged documents limit "test".
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/databases.html#get-purged-info-limit
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory = $true, ValueFromPipeline = $true)]
        [string] $Database,
        $Authorization,
        [switch] $Ssl,
        [string] $ProxyServer,
        [pscredential] $ProxyCredential
    )
    $Database = $Database + "/_purged_infos_limit"
    Send-CouchDBRequest -Server $Server -Port $Port -Method "GET" -Database $Database -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential
}

function Set-CouchDBDatabasePurgedLimit () {
    <#
    .SYNOPSIS
    Set a database purged documents limit.
    .DESCRIPTION
    Set the current purged_infos_limit (purged documents limit).
    .NOTES
    CouchDB API:
        PUT /{db}/_purged_infos_limit
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER Database
    The CouchDB database.
    .PARAMETER Limit
    The CouchDB purge limit documents number.
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
    Set-CouchDBDatabasePurgedLimit -Database test -Limit 1500 -Authorization "admin:password"
    This example set purged documents limit to 1500 on database "test".
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/databases.html#set-purged-info-limit
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory = $true, ValueFromPipeline = $true)]
        [string] $Database,
        [Parameter(mandatory = $true)]
        [int] $Limit,
        $Authorization,
        [switch] $Ssl,
        [string] $ProxyServer,
        [pscredential] $ProxyCredential
    )
    $Database = $Database + "/_purged_infos_limit"
    $Data = "$Limit"
    Send-CouchDBRequest -Server $Server -Port $Port -Method "PUT" -Database $Database -Data $Data -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential
}

function Get-CouchDBMissingRevision () {
    <#
    .SYNOPSIS
    Returns the missing revisions.
    .DESCRIPTION
    With given a list of document revisions, returns the document revisions that do not exist in the database.
    .NOTES
    CouchDB API:
        POST /{db}/_missing_revs
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER Database
    The CouchDB database.
    .PARAMETER Document
    The CouchDB document.
    .PARAMETER Revision
    Array CouchDB revisions.
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
    Get-CouchDBMissingRevision -Database test -Document "Hitchhikers" -Revision 2-7051cbe5c8faecd085a3fa619e6e6337,3-825cb35de44c433bfb2df415563a19de
    This example check if revisions 2-7051cbe5c8faecd085a3fa619e6e6337,3-825cb35de44c433bfb2df415563a19de exists on document "Hitchhikers" from database "test".
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/databases.html#get-missing-revisions
    #>
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory = $true)]
        [string] $Database,
        [Parameter(mandatory = $true)]
        [string] $Document,
        [Parameter(mandatory = $true, ValueFromPipeline = $true)]
        [array] $Revision,
        $Authorization,
        [switch] $Ssl,
        [string] $ProxyServer,
        [pscredential] $ProxyCredential
    )
    $Data = @{$Document = $Revision }
    $Data = $Data | ConvertTo-Json
    $Database = $Database + '/_missing_revs'
    Send-CouchDBRequest -Server $Server -Port $Port -Method "POST" -Database $Database -Data $Data -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential
}

function Get-CouchDBRevisionDifference () {
    <#
    .SYNOPSIS
    Returns the revision's difference.
    .DESCRIPTION
    Given a set of document/revision IDs, returns the subset of those that do not correspond to revisions stored in the database.
    .NOTES
    CouchDB API:
        POST /{db}/_revs_diff
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER Database
    The CouchDB database.
    .PARAMETER Document
    The CouchDB document.
    .PARAMETER Revision
    Array CouchDB revisions.
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
    Get-CouchDBRevisionDifference -Database test -Document "Hitchhikers" -Revision 2-7051cbe5c8faecd085a3fa619e6e6337,3-825cb35de44c433bfb2df415563a19de
    This example get revisions that do not correspond to revisions 2-7051cbe5c8faecd085a3fa619e6e6337,3-825cb35de44c433bfb2df415563a19de on document "Hitchhikers" from database "test".
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/databases.html#get-revision-difference
    #>
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory = $true)]
        [string] $Database,
        [Parameter(mandatory = $true)]
        [string] $Document,
        [Parameter(mandatory = $true, ValueFromPipeline = $true)]
        [array] $Revision,
        $Authorization,
        [switch] $Ssl,
        [string] $ProxyServer,
        [pscredential] $ProxyCredential
    )
    $Data = @{ $Document = $Revision }
    $Data = $Data | ConvertTo-Json
    $Database = $Database + '/_revs_diff'
    Send-CouchDBRequest -Server $Server -Port $Port -Method "POST" -Database $Database -Data $Data -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential
}

function Get-CouchDBRevisionLimit () {
    <#
    .SYNOPSIS
    Get revision's limit.
    .DESCRIPTION
    Gets the current revs_limit (revision limit) setting.
    .NOTES
    CouchDB API:
        GET /{db}/_revs_limit
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
    .PARAMETER ProxyServer
    Proxy server through which all non-local calls pass.
    Ex. ... -ProxyServer 'http://myproxy.local:8080' ...
    .PARAMETER ProxyCredential
    Proxy server credential. It must be specified with a PSCredential object.
    .EXAMPLE
    Get-CouchDBRevisionLimit -Database test
    This example get revision limit number from database "test".
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/databases.html#get-revision-limit
    #>
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory = $true, ValueFromPipeline = $true)]
        [string] $Database,
        $Authorization,
        [switch] $Ssl,
        [string] $ProxyServer,
        [pscredential] $ProxyCredential
    )
    $Database = $Database + '/_revs_limit'
    Send-CouchDBRequest -Server $Server -Port $Port -Method "GET" -Database $Database -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential
}

function Set-CouchDBRevisionLimit () {
    <#
    .SYNOPSIS
    Set revision limit.
    .DESCRIPTION
    Set the current revs_limit (revision limit) setting.
    .NOTES
    CouchDB API:
        PUT /{db}/_revs_limit
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER Database
    The CouchDB database.
    .PARAMETER Limit
    The CouchDB revision limit. Default is 1000.
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
    Set-CouchDBRevisionLimit -Database test -Limit 100 -Authorization "admin:password"
    This example set revision limit number to 1000 on database "test".
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/databases.html#set-revision-limit
    #>
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory = $true, ValueFromPipeline = $true)]
        [string] $Database,
        [int] $Limit = 1000,
        $Authorization,
        [switch] $Ssl,
        [string] $ProxyServer,
        [pscredential] $ProxyCredential
    )
    $Database = $Database + '/_revs_limit'
    $Data = $Limit
    Send-CouchDBRequest -Server $Server -Port $Port -Method "PUT" -Database $Database -Data $Data -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential
}

function Export-CouchDBDatabase () {
    <#
    .SYNOPSIS
    Export database.
    .DESCRIPTION
    Dump specified database in a JSON file.
    .NOTES
    CouchDB API:
        GET /{db}/{docid}
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER Database
    The CouchDB database.
    .PARAMETER Path
    The path of JSON file.
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
    .PARAMETER AsJob
    Send the command in the background.
    .EXAMPLE
    Export-CouchDBDatabase -Database test
    Export "test" database in a json file.
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/databases.html#export
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory = $true, ValueFromPipeline = $true)]
        [string] $Database,
        [string] $Path = $(Join-Path -Path "$($PWD.path)" -ChildPath "$($Database)_$(Get-Date -Format 'MM-dd-yyyy_HH_mm_ss').json"),
        $Authorization,
        [switch] $Ssl,
        [switch] $AsJob,
        [string] $ProxyServer,
        [pscredential] $ProxyCredential
    )
    # Create list container
    $list = New-Object System.Collections.Generic.List[System.Object]
    $count = 0
    $all_docs = (Get-CouchDBDocument -Server $Server -Port $Port -Database $Database -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential).rows
    foreach ($doc in $all_docs) {
        $count++
        $list.Add($(Get-CouchDBDocument -Server $Server -Port $Port -Database $Database -Document $doc.id -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential))
        Write-Progress -Activity "Export document $($doc.id) in progress" -Status "Progress $count/$($all_docs.count)" -PercentComplete ($count / $all_docs.count * 100)
    }
    if ($AsJob.IsPresent) {
        $job = Start-Job -Name "Export-Database" {
            param($list, $Path)
            Write-Host "Export JSON file to $Path."
            # Export all docs to json file
            $list | ConvertTo-Json -Depth 99 | Out-File -FilePath $Path -Encoding utf8
        } -ArgumentList $list, $Path
        Register-TemporaryEvent $job "StateChanged" -Action {
            Write-Host -ForegroundColor Green "Export database #$($sender.Id) ($($sender.Name)) complete."
        }
    } else {
        Write-Host "Export JSON file to $Path."
        # Export all docs to json file
        $list | ConvertTo-Json -Depth 99 | Out-File -FilePath $Path -Encoding utf8
        # Result
        if (Test-Path -Path $Path -ErrorAction SilentlyContinue) {
            Write-Host
            Write-Host "ok"
            Write-Host "--"
            Write-Host $true
        } else {
            Write-Host
            Write-Host "ok"
            Write-Host "--"
            Write-Host $false
        }
    }
}

function Import-CouchDBDatabase () {
    <#
    .SYNOPSIS
    Import database.
    .DESCRIPTION
    Restore specified database from a JSON file.
    .NOTES
    CouchDB API:
        POST /{db}/_bulk_docs
        PUT /{db}
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER Database
    The CouchDB database.
    .PARAMETER Path
    The path of JSON file.
    .PARAMETER RemoveRevision
    Remove all revision to docs.
    This is useful when creating a new database.
    .PARAMETER Authorization
    The CouchDB authorization form; user and password.
    Authorization format like this: user:password
    ATTENTION: if the password is not specified, it will be prompted.
    .PARAMETER Ssl
    Set ssl connection on CouchDB server.
    This modify protocol to https and port to 6984.
    .PARAMETER AsJob
    Send the command in the background.
    .PARAMETER ProxyServer
    Proxy server through which all non-local calls pass.
    Ex. ... -ProxyServer 'http://myproxy.local:8080' ...
    .PARAMETER ProxyCredential
    Proxy server credential. It must be specified with a PSCredential object.
    .EXAMPLE
    Import-CouchDBDatabase -Path test_01-25-2019_00_01_00.json -Database test_restored
    Import "test" database from a json file.
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/databases.html#import
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory = $true)]
        [string] $Database,
        [Parameter(mandatory = $true, ValueFromPipeline = $true)]
        [string] $Path,
        [switch] $RemoveRevision,
        $Authorization,
        [switch] $Ssl,
        [switch] $AsJob,
        [string] $ProxyServer,
        [pscredential] $ProxyCredential
    )
    # Check RemoveRevision parameter
    if ($RemoveRevision.IsPresent) {
        $docs = $(Get-Content -Path $Path) -replace '"_rev":.*,', "" | Out-String | ConvertFrom-Json
    } else {
        # Create container "docs"
        $docs = $(Get-Content -Path $Path) | Out-String | ConvertFrom-Json
    }
    # Check if database exists
    if (-not(Test-CouchDBDatabase -Server $Server -Port $Port -Database $Database -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential -ErrorAction SilentlyContinue)) {
        New-CouchDBDatabase -Server $Server -Port $Port -Database $Database -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential | Out-Null
    }
    # Import data in bulk
    if ($docs) {
        $Data = New-Object PSCouchDBBulkDocument
        foreach ($doc in $docs) {
            $Data.AddDocument(($doc | ConvertTo-Json -Depth 99))
        }
    } else {
        Write-Warning -Message "File is empty!"
        return $null
    }
    if ($AsJob.IsPresent) {
        New-CouchDBBulkDocument -Server $Server -Port $Port -Database $Database -Data $Data -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential -AsJob
    } else {
        New-CouchDBBulkDocument -Server $Server -Port $Port -Database $Database -Data $Data -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential
    }
}


function Connect-CouchDBDatabase () {
    <#
    .SYNOPSIS
    Connect database.
    .DESCRIPTION
    To permanently connect to a database.
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
    .EXAMPLE
    Connect-CouchDBDatabase -Database test -Authorization admin:password
    Connect to server localhost:5984 on database test.
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/databases.html#connect-database
    #>
    [CmdletBinding()]
    param(
        [string] $Server = 'localhost',
        [int] $Port = 5984,
        [Parameter(mandatory = $true, ValueFromPipeline = $true)]
        [string] $Database,
        $Authorization
    )
    # Save original prompt
    Set-Variable -Name "orig_prompt" -Value $(Get-Content function:prompt) -Scope Global

    # Default parameter set variable
    $Global:PSDefaultParameterValues["*CouchDB*:Server"] = $Server
    $Global:PSDefaultParameterValues["*CouchDB*:Port"] = $Port
    $Global:PSDefaultParameterValues["*CouchDB*:Database"] = $Database

    # Define global variable
    $Global:CouchDBServer = $Server
    $Global:CouchDBPort = $Port
    $Global:CouchDBDatabase = $Database

    # Add authorization global variable
    Set-Variable -Name "CouchDBCredential" -Value $Authorization -Scope Global

    function Global:prompt {
        Write-Host -NoNewLine -ForegroundColor Red "[CouchDB Server:$($Global:CouchDBServer):$($Global:CouchDBPort) Database:$($Global:CouchDBDatabase)]`n"
    }
}

function Disconnect-CouchDBDatabase () {
    <#
    .SYNOPSIS
    Disconnect database.
    .DESCRIPTION
    Disconnect database.
    .EXAMPLE
    Disconnect-CouchDBDatabase
    Disconnect to server localhost:5984 on database test.
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/databases.html#connect-database
    #>
    # Remove parameter set variable
    $Global:PSDefaultParameterValues["*CouchDB*:Server"] = $null
    $Global:PSDefaultParameterValues["*CouchDB*:Port"] = $null
    $Global:PSDefaultParameterValues["*CouchDB*:Database"] = $null

    # Remove global variable
    Remove-Variable CouchDBServer -Scope global
    Remove-Variable CouchDBPort -Scope global
    Remove-Variable CouchDBDatabase -Scope global

    # Remove authorization global variable
    Remove-Variable CouchDBCredential -Scope global

    Set-Item -Path function:prompt -Value $Global:orig_prompt
}