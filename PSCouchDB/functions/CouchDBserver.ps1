# Server functions of CouchDB module
function Get-CouchDBServer () {
    <#
    .SYNOPSIS
    Get server information.
    .DESCRIPTION
    Accessing the root of a CouchDB instance returns meta information about the instance.
    .NOTES
    CouchDB API:
        GET /
        GET /_up
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER Authorization
    The CouchDB authorization form; user and password.
    Authorization format like this: user:password
    ATTENTION: if the password is not specified, it will be prompted.
    .PARAMETER Status
    Get the status of server. API _up. 
    .PARAMETER Ssl
    Set ssl connection on CouchDB server.
    This modify protocol to https and port to 6984.
    .PARAMETER ProxyServer
    Proxy server through which all non-local calls pass.
    Ex. ... -ProxyServer 'http://myproxy.local:8080' ...
    .PARAMETER ProxyCredential
    Proxy server credential. It must be specified with a PSCredential object.
    .EXAMPLE
    Get-CouchDBServer
    This example get a meta information of localhost server.
    .EXAMPLE
    Get-CouchDBServer -Serer couchdb1.local -Port 8080 -Status
    This example get a status of couchdb1.local server with custom port.
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/server.html#server-operation
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        $Authorization,
        [switch] $Status,
        [switch] $Ssl,
        [string] $ProxyServer,
        [pscredential] $ProxyCredential
    )
    if ($Status.IsPresent) {
        $Database = "_up"
    }
    Send-CouchDBRequest -Server $Server -Port $Port -Method "GET" -Database $Database -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential
}

function Get-CouchDBUser () {
    <#
    .SYNOPSIS
    Get an user.
    .DESCRIPTION
    Get a CouchDB user.
    .NOTES
    CouchDB API:
        GET /_users
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER Userid
    The user_id than exists in _users database.
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
    Get-CouchDBUser -Userid test_user
    This example get info of user "test_user".
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/permission.html
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory = $true, ValueFromPipeline = $true)]
        [string] $Userid,
        $Authorization,
        [switch] $Ssl,
        [string] $ProxyServer,
        [pscredential] $ProxyCredential
    )
    $Database = "_users"
    $Document = "org.couchdb.user:$Userid"
    Send-CouchDBRequest -Server $Server -Port $Port -Method "GET" -Database $Database -Document $Document -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential
}

function Get-CouchDBAdmin () {
    <#
    .SYNOPSIS
    Get an admin user.
    .DESCRIPTION
    Get a CouchDB admin user.
    .NOTES
    CouchDB API:
        GET /_node/{node-name}/_config/admins
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER Node
    The CouchDB node of cluster. Default is couchdb@localhost.
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
    Get-CouchDBAdmin -Authorization "admin:password"
    This example 
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/permission.html
    #>
    [CmdletBinding()]
    param(
        [Parameter(ValueFromPipeline = $true)]
        [string] $Server,
        [int] $Port,
        [string] $Node,
        $Authorization,
        [switch] $Ssl,
        [string] $ProxyServer,
        [pscredential] $ProxyCredential
    )
    # Check node
    if (-not($Node)) {
        if ((Get-CouchDBNode -Server $Server -Port $Port -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential).name) {
            $Node = (Get-CouchDBNode -Server $Server -Port $Port -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential).name
        } else {
            $Node = Read-Host "Enter the node name (ex. couchdb@localhost)"
        }
    }
    $Database = "_node"
    $Document = "$Node/_config/admins"
    Send-CouchDBRequest -Server $Server -Port $Port -Method "GET" -Database $Database -Document $Document -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential
}

function Get-CouchDBActiveTask () {
    <#
    .SYNOPSIS
    Get an active task.
    .DESCRIPTION
    List of running tasks, including the task type, name, status and process ID.
    .NOTES
    CouchDB API:
        GET /_active_tasks
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
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
    Get-CouchDBActiveTask -Authorization "admin:password"
    This example get all active task.
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/server.html
    #>
    [CmdletBinding()]
    param(
        [Parameter(ValueFromPipeline = $true)]
        [string] $Server,
        [int] $Port,
        $Authorization,
        [switch] $Ssl,
        [string] $ProxyServer,
        [pscredential] $ProxyCredential
    )
    $Database = "_active_tasks"
    Send-CouchDBRequest -Server $Server -Port $Port -Method "GET" -Database $Database -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential
}

function Get-CouchDBClusterSetup () {
    <#
    .SYNOPSIS
    Get a cluster setup.
    .DESCRIPTION
    Returns the status of the node or cluster, per the cluster setup wizard.
    .NOTES
    CouchDB API:
        GET /_cluster_setup
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER EnsureDatabaseExist
    List of system databases to ensure exist on the node/cluster. Defaults to ["_users","_replicator","_global_changes"].
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
    Get-CouchDBClusterSetup
    This example get a cluster setup.
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/server.html
    #>
    [CmdletBinding()]
    param(
        [Parameter(ValueFromPipeline = $true)]
        [string] $Server,
        [int] $Port,
        [AllowEmptyCollection()]
        [array] $EnsureDatabaseExist,
        $Authorization,
        [switch] $Ssl,
        [string] $ProxyServer,
        [pscredential] $ProxyCredential
    )
    $parameters = @()
    $Database = "_cluster_setup"
    # Check EnsureDatabaseExist parameter
    if ($PSBoundParameters.ContainsKey('EnsureDatabaseExist')) {
        if ($EnsureDatabaseExist) {
            $parameters += "ensure_dbs_exist=$(
                    if ($EnsureDatabaseExist.Count -eq 1) {
                        "[$($EnsureDatabaseExist | ConvertTo-Json -Compress)]"
                    } else {
                        $EnsureDatabaseExist | ConvertTo-Json -Compress
                    }
                )"
        } else {
            $parameters += 'ensure_dbs_exist=["_users","_replicator","_global_changes"]'
        }
    }
    Send-CouchDBRequest -Server $Server -Port $Port -Method "GET" -Database $Database -Params $parameters -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential
}

function Measure-CouchDBStatistics () {
    <#
    .SYNOPSIS
    Measure server statistics.
    .DESCRIPTION
    Measure CouchDB server statistics.
    .NOTES
    CouchDB API:
        GET /_node/{node-name}/_system
        GET /_node/{node-name}/_stats
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER System
    Return system statistics.
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
    Measure-CouchDBStatistics
    This example measure statistics of CouchDB Server.
    .EXAMPLE
    Measure-CouchDBStatistics -System
    This example measure statistics of CouchDB Server.
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/server.html
    #>
    [CmdletBinding()]
    param(
        [Parameter(ValueFromPipeline = $true)]
        [string] $Server = 'localhost',
        [int] $Port,
        [switch] $System,
        $Authorization,
        [switch] $Ssl,
        [string] $ProxyServer,
        [pscredential] $ProxyCredential
    )
    if ($System.IsPresent) {
        $Database = "_node/couchdb@$Server/_system"
    } else {
        $Database = "_node/couchdb@$Server/_stats"
    }
    Send-CouchDBRequest -Server $Server -Port $Port -Method "GET" -Database $Database -Document $Document -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential
}

function Restart-CouchDBServer () {
    <#
    .SYNOPSIS
    Restart service.
    .DESCRIPTION
    Restart CouchDB server service.
    .PARAMETER Force
    No confirmation prompt.
    .EXAMPLE
    Restart-CouchDBServer
    The example restart CouchDB server. 
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/server.html
    #>
    [CmdletBinding()]
    param(
        [switch] $Force
    )
    # Windows?
    try {
        $Windows = ([bool](Get-CimInstance -ClassName Win32_OperatingSystem -ErrorAction SilentlyContinue))
    } catch [System.Management.Automation.CommandNotFoundException] {
        $Windows = $false
    }
    if ($Windows) {
        $Service = "Apache CouchDB"
        if ($Force -or $PSCmdlet.ShouldContinue("Do you wish to restart CouchDB server ?", "Restart server")) {
            try {
                Restart-Service -Name $Service -Force -ErrorAction Stop
            } catch [Microsoft.PowerShell.Commands.ServiceCommandException] {
                throw "Cannot open $Service service on computer. To run restart must have admnistrative privileges."
            }
            Write-Host
            Write-Host -ForegroundColor Green "Apache CouchDB restarted successfully."
        }
    } else {
        if ($Force -or $PSCmdlet.ShouldContinue("Do you wish to restart CouchDB server ?", "Restart server")) {
            & service couchdb restart
            if ($(& service couchdb status)[2] -notmatch "(running)") { throw "Cannot open $Service service on computer" }
            Write-Host
            Write-Host -ForegroundColor Green "Apache CouchDB restarted successfully."
        }
    }
}

function New-CouchDBUuids () {
    <#
    .SYNOPSIS
    Create a new uuids.
    .DESCRIPTION
    Requests one or more Universally Unique Identifiers (UUIDs) from the CouchDB instance.
    .NOTES
    CouchDB API:
        GET /_uuids
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER Count
    Return uuid number equal to count.
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
    New-CouchDBUuids -Count 3
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/server.html
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(ValueFromPipeline = $true)]
        [int] $Count,
        $Authorization,
        [switch] $Ssl,
        [string] $ProxyServer,
        [pscredential] $ProxyCredential
    )
    $parameters = @()
    $Database = '_uuids'
    # Check count
    if ($Count) {
        $parameters += "count=$Count"
    }
    Send-CouchDBRequest -Server $Server -Port $Port -Method "GET" -Database $Database -Params $parameters -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential
}

function Search-CouchDBAnalyze () {
    <#
    .SYNOPSIS
    Tests the results of Lucene analyzer tokenization on sample text.
    .DESCRIPTION
    Tests the results of Lucene analyzer tokenization on sample text.
    Search endpoints require a running search plugin connected to each cluster node.
    .NOTES
    CouchDB API:
        POST /_search_analyze
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER Field
    The CouchDB type of analyzer.
    .PARAMETER Text
    The CouchDB analyzer token you want to test.
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
    Search-CouchDBAnalyze -Field "english" -Text "running" -Authorization "admin:password"
    Search type of analyzer "english" with text status "running".
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/server.html
    #>
    [CmdletBinding()]
    param(
        [Parameter(ValueFromPipeline = $true)]
        [string] $Server,
        [int] $Port,
        [Parameter(Mandatory = $true)]
        [string] $Field,
        [Parameter(Mandatory = $true)]
        [string] $Text,
        $Authorization,
        [switch] $Ssl,
        [string] $ProxyServer,
        [pscredential] $ProxyCredential
    )
    $Data = @{}
    $Database = '_search_analyze'
    $Data['analyzer'] = $Field
    $Data['text'] = $Text
    $Data = $Data | ConvertTo-Json
    Send-CouchDBRequest -Server $Server -Port $Port -Method "POST" -Database $Database -Data $Data -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential
}

function Get-CouchDBReshards () {
    <#
    .SYNOPSIS
    State of resharding on the cluster.
    .DESCRIPTION
    Returns a count of completed, failed, running, stopped, and total jobs along with the state of resharding on the cluster.
    .NOTES
    CouchDB API:
        GET /_reshard
        GET /_reshard/state
        GET /_reshard/jobs
        GET /_reshard/jobs/{jobid}
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER State
    Returns the resharding state and optional information about the state.
    .PARAMETER Jobs
    Get information about the resharding for all jobs.
    .PARAMETER JobId
    Get information about the resharding job identified by jobid.
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
    Get-CouchDBReshards -Jobs -Authorization "admin:password"
    Get all resharding jobs on all database.
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/server.html
    #>
    [CmdletBinding(DefaultParameterSetName = "AllJob")]
    param(
        [Parameter(ValueFromPipeline = $true)]
        [Parameter(ParameterSetName = "AllJob")]
        [Parameter(ParameterSetName = "Job")]
        [string] $Server,
        [Parameter(ParameterSetName = "AllJob")]
        [Parameter(ParameterSetName = "Job")]
        [int] $Port,
        [Parameter(ParameterSetName = "Job")]
        [switch] $State,
        [Parameter(ParameterSetName = "AllJob")]
        [switch] $Jobs,
        [Parameter(ParameterSetName = "Job")]
        [string] $JobId,
        [Parameter(ParameterSetName = "AllJob")]
        [Parameter(ParameterSetName = "Job")]
        $Authorization,
        [Parameter(ParameterSetName = "AllJob")]
        [Parameter(ParameterSetName = "Job")]
        [switch] $Ssl,
        [Parameter(ParameterSetName = "AllJob")]
        [Parameter(ParameterSetName = "Job")]
        [string] $ProxyServer,
        [Parameter(ParameterSetName = "AllJob")]
        [Parameter(ParameterSetName = "Job")]
        [pscredential] $ProxyCredential
    )
    # Check state and jobid
    if ($State.IsPresent -and (-not($JobId))) { 
        $Database = '_reshard/state'
    } elseif ($State.IsPresent -and $JobId) {
        $Database = "_reshard/jobs/$JobId/state"
    } elseif ($JobId) {
        $Database = "_reshard/jobs/$JobId"
    } else { 
        $Database = '_reshard'
    }
    # Check jobs
    if ($Jobs.IsPresent) { $Database = '_reshard/jobs' }
    Send-CouchDBRequest -Server $Server -Port $Port -Method "GET" -Database $Database -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential
}

function Read-CouchDBLog () {
    <#
    .SYNOPSIS
    Read or tail log.
    .DESCRIPTION
    Read, tail and follow CouchDB log (couch.log).
    .PARAMETER Path
    The path of log file. Default, is C:\CouchDB\couch.log on Windows and /var/log/couchdb/couch.log on Unix.
    .PARAMETER Level
    Select level of log. Default is "info".
    Available levels:
        debug: Detailed debug logging.
        info: Informative logging. Includes HTTP requests headlines, startup of an external processes etc.
        notice
        warning: Warning messages are alerts about edge situations that may lead to errors.
        error: Error level includes only things that go wrong, like crash reports and HTTP error responses (5xx codes).
        critical
        alert
        emergency
    .PARAMETER Follow
    Output appended data as the file grows.
    .PARAMETER Tail
    The last n lines of log. Default is 10.
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
    Read-CouchDBLog -Level warning -Follow
    Append and wait new warning entry on default log.
    .EXAMPLE
    Read-CouchDBLog -Path /custom/couchdb/log/couch.log -Level error | Out-File error_couchdb.log
    Read only error,critical,alert,emergency log in a custom path and redirect to a new file.
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/server.html#read-the-log
    #>
    [CmdletBinding()]
    param(
        [string] $Path,
        [ValidateSet("debug", "info", "notice", "warning", "error", "critical", "alert", "emergency")]
        [Parameter(ValueFromPipeline = $true)]
        [string] $Level = "info",
        [switch] $Follow,
        [int] $Tail,
        $Authorization,
        [switch] $Ssl,
        [string] $ProxyServer,
        [pscredential] $ProxyCredential
    )
    # Check if $Path is empty
    if (-not($Path)) {
        if ((Get-CouchDBConfiguration -Session log -Key file -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential -ErrorAction SilentlyContinue).results) {
            $Path = (Get-CouchDBConfiguration -Session log -Key file -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential -ErrorAction SilentlyContinue).results -replace '"', ''
        }
    }
    if (-not(Test-Path -Path $Path -ErrorAction SilentlyContinue)) { throw "Log file not found! See 'Get-CouchDBConfiguration -Session log -Key file'" }
    # Set level
    $Levels = [PSCustomObject]@{
        debug     = @{
            color = "DarkYellow"
            level = "debug", "info", "notice", "warning", "error", "critical", "alert", "emergency"
        }
        info      = @{
            color = "DarkGray"
            level = "info", "notice", "warning", "error", "critical", "alert", "emergency"
        }
        notice    = @{
            color = "Gray"
            level = "notice", "warning", "error", "critical", "alert", "emergency"
        }
        warning   = @{
            color = "Yellow"
            level = "warning", "error", "critical", "alert", "emergency"
        }
        error     = @{
            color = "Red"
            level = "error", "critical", "alert", "emergency"
        }
        critical  = @{
            color = "DarkRed"
            level = "critical", "alert", "emergency"
        }
        alert     = @{
            color = "DarkMagenta"
            level = "alert", "emergency"
        }
        emergency = @{
            color = "Magenta"
            level = "emergency"
        }
    }
    # Set option of Get-Content cmdlet
    $Parameters = @{
        Path = $Path
    }
    if ($Follow.IsPresent) {
        if (-not($Tail)) { $Parameters.Add("Tail", 10) }
        $Parameters.Add("Wait", $true)
    }
    if ($Tail) {
        $Parameters.Add("Tail", $Tail)
    }
    # Run Get-Content
    Get-Content @Parameters | ForEach-Object {
        foreach ($lev in $Levels.$level.level) {
            if ($_ -match "\[$lev\]") { Write-Host -ForegroundColor $Levels.$lev.color $_ }
        }
    }
}

function Clear-CouchDBLog () {
    <#
    .SYNOPSIS
    Clear log.
    .DESCRIPTION
    Clear and rotate CouchDB log (couch.log).
    .PARAMETER Path
    The path of log file. Default, is C:\CouchDB\couch.log on Windows and /var/log/couchdb/couch.log on Unix.
    .PARAMETER Rotate
    Rotate an existing log. Copy before delete in this format couch.log.t-i-m-e_s_t_a_m_p
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
    Clear-CouchDBLog -Rotate
    Clear default couch.log and save a copy before delete it.
    .EXAMPLE
    Clear-CouchDBLog -Path /custom/couchdb/log/couch.log
    Clear custom log /custom/couchdb/log/couch.log.
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/server.html#clear-the-log
    #>
    [CmdletBinding()]
    param(
        [Parameter(ValueFromPipeline = $true)]
        [string] $Path,
        [switch] $Rotate,
        $Authorization,
        [switch] $Ssl,
        [string] $ProxyServer,
        [pscredential] $ProxyCredential
    )
    # Check if $Path is empty
    if (-not($Path)) {
        if ((Get-CouchDBConfiguration -Session log -Key file -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential -ErrorAction SilentlyContinue).results) {
            $Path = (Get-CouchDBConfiguration -Session log -Key file -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential -ErrorAction SilentlyContinue).results -replace '"', ''
        }
    }
    if (-not(Test-Path -Path $Path -ErrorAction SilentlyContinue)) { throw "Log file not found! See 'Get-CouchDBConfiguration -Session log -Key file'" }
    # Clear log
    if ($Rotate.IsPresent) {
        Copy-Item -Path $Path -Destination "$Path.$(Get-Date -Format 'MM-dd-yyyy_HH_mm_ss')" -Force
        Clear-Content -Path $Path -Force
    } else {
        Clear-Content -Path $Path -Force
    }
}

function Get-CouchDBDatabaseUpdates () {
    <#
    .SYNOPSIS
    Get database events.
    .DESCRIPTION
    Returns a list of all database events in the CouchDB instance.
    .NOTES
    CouchDB API:
        GET /_db_updates
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER Feed
    normal: Returns all historical DB changes, then closes the connection. Default.
    longpoll: Closes the connection after the first event.
    continuous: Send a line of JSON per event. Keeps the socket open until timeout.
    eventsource: Like, continuous, but sends the events in EventSource format.
    .PARAMETER Timeout
    Number of seconds until CouchDB closes the connection. Default is 60.
    .PARAMETER Heartbeat
    Period in milliseconds after which an empty line is sent in the results. 
    Only applicable for longpoll, continuous, and eventsource feeds. 
    Overrides any timeout to keep the feed alive indefinitely. Default is 60000.
    .PARAMETER Since
    Return only updates since the specified sequence ID. May be the string "now" to begin showing only new updates.
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
    Get-CouchDBDatabaseUpdates -Authorization admin:password
    This example get list of all database events in the CouchDB instance.
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/server.html#server-operation
    #>
    [CmdletBinding()]
    param(
        [Parameter(ValueFromPipeline = $true)]
        [string] $Server,
        [int] $Port,
        [ValidateSet("normal", "longpoll", "continuous", "eventsource")]
        [string] $Feed,
        [int] $Timeout,
        [int] $Heartbeat,
        [string] $Since,
        $Authorization,
        [switch] $Ssl,
        [string] $ProxyServer,
        [pscredential] $ProxyCredential
    )
    $parameters = @()
    # Check if _global_changes exists
    if (-not(Get-CouchDBDatabase -Server $Server -Port $Port -Database "_global_changes" -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential -ErrorAction SilentlyContinue)) {
        throw "Database _global_changes doesn't exists."
    }
    $Database = '_db_updates'
    # Check Feed parameter
    if ($Feed) {
        $parameters += "feed=$Feed"
    }
    # Check Timeout parameter
    if ($Timeout) {
        $parameters += "timeout=$Timeout"
    }
    # Check Heartbeat parameter
    if ($Heartbeat) {
        $parameters += "heartbeat=$Heartbeat"
    }
    # Check Since parameter
    if ($Since) {
        $parameters += if ($Since -eq "now") { "since=now" } else { "since=$Since" }
    }
    Send-CouchDBRequest -Server $Server -Port $Port -Method "GET" -Database $Database -Params $parameters -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential
}

function Set-CouchDBProxy () {
    <#
    .SYNOPSIS
    Set proxy server and credential.
    .DESCRIPTION
    Set proxy server and credential for all calls.
    .PARAMETER Server
    Proxy server through which all non-local calls pass.
    Ex. ... -ProxyServer 'http://myproxy.local:8080' ...
    .PARAMETER Credential
    Proxy server credential. It must be specified with a PSCredential object.
    .EXAMPLE
    Set-CouchDBProxy -Server 'http://myproxy.local:8080' -Credential (Get-Credential)
    Set proxy server for all calls.
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/server.html#server-operation
    #>
    [CmdletBinding()]
    param(
        [Parameter(mandatory = $true)]
        [string] $Server,
        [pscredential] $Credential
    )
    # Check credential
    if ($Credential) {
        # Default parameter set variable for ProxyCredential
        $Global:PSDefaultParameterValues["*CouchDB*:ProxyCredential"] = $Credential
    }
    # Default parameter set variable for ProxyServer
    $Global:PSDefaultParameterValues["*CouchDB*:ProxyServer"] = $Server
}

function Remove-CouchDBProxy () {
    <#
    .SYNOPSIS
    Remove proxy server and credential.
    .DESCRIPTION
    Remove proxy server and credential for all calls.
    .EXAMPLE
    Remove-CouchDBProxy
    Set proxy server for all calls.
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/server.html#server-operation
    #>
    $Global:PSDefaultParameterValues["*CouchDB*:ProxyCredential"] = $null
    $Global:PSDefaultParameterValues["*CouchDB*:ProxyServer"] = $null
}
