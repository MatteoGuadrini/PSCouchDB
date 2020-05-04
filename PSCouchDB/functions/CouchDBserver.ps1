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
        [string] $Authorization,
        [switch] $Status,
        [switch] $Ssl
    )
    if ($Status.IsPresent) {
        $Database = "_up"
    }
    Send-CouchDBRequest -Server $Server -Port $Port -Method "GET" -Database $Database -Authorization $Authorization -Ssl:$Ssl
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
        [string] $Authorization,
        [switch] $Ssl
    )
    $Database = "_users"
    $Document = "org.couchdb.user:$Userid"
    Send-CouchDBRequest -Server $Server -Port $Port -Method "GET" -Database $Database -Document $Document -Authorization $Authorization -Ssl:$Ssl
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
        [string] $Node = $(if ((Get-CouchDBNode -Server $Server -Port $Port -Authorization $Authorization -Ssl:$Ssl).all_nodes -contains "couchdb@localhost") { "couchdb@localhost" } else { "couchdb@127.0.0.1" }),
        [string] $Authorization,
        [switch] $Ssl
    )
    $Database = "_node"
    $Document = "$Node/_config/admins"
    Send-CouchDBRequest -Server $Server -Port $Port -Method "GET" -Database $Database -Document $Document -Authorization $Authorization -Ssl:$Ssl
}

function Get-CouchDBConfiguration () {
    <#
    .SYNOPSIS
    Get configuration.
    .DESCRIPTION
    Get configuration of CouchDB server.
    .NOTES
    CouchDB API:
        GET /_node/{node-name}/_config
        GET /_node/{node-name}/_config/{section}
        GET /_node/{node-name}/_config/{section}/{key}
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER Node
    The CouchDB node of cluster. Default is couchdb@localhost.
    .PARAMETER Session
    The CouchDB configuration section name.
    .PARAMETER Key
    The CouchDB configuration option name.
    .PARAMETER Authorization
    The CouchDB authorization form; user and password.
    Authorization format like this: user:password
    ATTENTION: if the password is not specified, it will be prompted.
    .PARAMETER Ssl
    Set ssl connection on CouchDB server.
    This modify protocol to https and port to 6984.
    .EXAMPLE
    Get-CouchDBConfiguration
    This example get the localhost configuration of CouchDB server.
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/config.html#get-configuration
    #>
    [CmdletBinding()]
    param(
        [Parameter(ValueFromPipeline = $true)]
        [string] $Server,
        [int] $Port,
        [string] $Node = $(if ((Get-CouchDBNode -Server $Server -Port $Port -Authorization $Authorization -Ssl:$Ssl).name -contains "couchdb@localhost") { "couchdb@localhost" } else { "couchdb@127.0.0.1" }),
        [string] $Session,
        [string] $Key,
        [string] $Authorization,
        [switch] $Ssl
    )
    $Database = "_node"
    $Document = "$Node/_config"
    # Check Session parameter
    if ($Session) {
        $Document += "/$Session"
    }
    # Check Key parameter
    if ($Session -and $Key) {
        $Document += "/$Key"
    }
    Send-CouchDBRequest -Server $Server -Port $Port -Method "GET" -Database $Database -Document $Document -Authorization $Authorization -Ssl:$Ssl
}

function Get-CouchDBNode () {
    <#
    .SYNOPSIS
    Get server nodes.
    .DESCRIPTION
    Displays the nodes that are part of the cluster as cluster_nodes.
    .NOTES
    CouchDB API:
        GET /_membership
        GET /_node/{node-name}
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
    .EXAMPLE
    Get-CouchDBNode -Authorization "admin:password"
    This example get all node in a cluster.
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/config.html#nodes
    #>
    [CmdletBinding()]
    param(
        [Parameter(ValueFromPipeline = $true)]
        [string] $Server,
        [int] $Port,
        [string] $Authorization,
        [switch] $Ssl
    )
    if ((Get-CouchDBServer).version -match '3.*') { $Database = "_node/_local" } elseif ((Get-CouchDBServer).version -match '2.*') { $Database = "_membership" }
    Send-CouchDBRequest -Server $Server -Port $Port -Method "GET" -Database $Database -Document $Document -Authorization $Authorization -Ssl:$Ssl
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
        [string] $Authorization,
        [switch] $Ssl
    )
    $Database = "_active_tasks"
    Send-CouchDBRequest -Server $Server -Port $Port -Method "GET" -Database $Database -Authorization $Authorization -Ssl:$Ssl
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
        [string] $Authorization,
        [switch] $Ssl
    )
    $Database = "_cluster_setup"
    # Check EnsureDatabaseExist parameter
    if ($PSBoundParameters.ContainsKey('EnsureDatabaseExist')) {
        if ($EnsureDatabaseExist) {
            if ($Database -match "\?") {
                $Database += "&ensure_dbs_exist=$(
                    if ($EnsureDatabaseExist.Count -eq 1) {
                        "[$($EnsureDatabaseExist | ConvertTo-Json -Compress)]"
                    } else {
                        $EnsureDatabaseExist | ConvertTo-Json -Compress
                    }
                )"
            } else {
                $Database += "?ensure_dbs_exist=$(
                    if ($EnsureDatabaseExist.Count -eq 1) {
                        "[$($EnsureDatabaseExist | ConvertTo-Json -Compress)]"
                    } else {
                        $EnsureDatabaseExist | ConvertTo-Json -Compress
                    }
                )"
            }
        } else {
            if ($Database -match "\?") {
                $Database += '&ensure_dbs_exist=["_users","_replicator","_global_changes"]'
            } else {
                $Database += '?ensure_dbs_exist=["_users","_replicator","_global_changes"]'
            }
        }
    }
    Send-CouchDBRequest -Server $Server -Port $Port -Method "GET" -Database $Database -Authorization $Authorization -Ssl:$Ssl
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
        [string] $Authorization,
        [switch] $Ssl
    )
    if ($System.IsPresent) {
        $Database = "_node/couchdb@$Server/_system"
    } else {
        $Database = "_node/couchdb@$Server/_stats"
    }
    Send-CouchDBRequest -Server $Server -Port $Port -Method "GET" -Database $Database -Document $Document -Authorization $Authorization -Ssl:$Ssl
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
    [CmdletBinding(SupportsShouldProcess = $true)]
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
                throw "Cannot open $Service service on computer"
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
        [int] $Count = 10,
        [string] $Authorization,
        [switch] $Ssl
    )
    $Database = '_uuids'
    # Check count
    if ($Count) {
        $Database += "?count=$Count"
    }
    Send-CouchDBRequest -Server $Server -Port $Port -Method "GET" -Database $Database -Authorization $Authorization -Ssl:$Ssl
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
        [int] $Tail
    )
    # Check if $Path is empty
    if (-not($Path)) {
        # Windows?
        try {
            $Windows = ([bool](Get-CimInstance -ClassName Win32_OperatingSystem -ErrorAction SilentlyContinue))
        } catch [System.Management.Automation.CommandNotFoundException] {
            $Windows = $false
        }
        # Set default path...
        # Windows platform
        if ($Windows) {
            if ((Get-CouchDBServer).version -match '3.*') { 
                $Path = "C:\Program Files\Apache CouchDB\var\log\couchdb.log"
                $root = "C:\Program Files\Apache CouchDB"
            } elseif ((Get-CouchDBServer).version -match '2.*') { 
                $Path = "C:\CouchDB\couch.log"
                $root = "C:\CouchDB"
            }
            # Unix platform
        } else {
            $Path = "/var/log/couchdb/couch.log"
            $root = "/var/log"
        }
        # ...and if not exists, search it
        if (-not(Test-Path -Path $Path -ErrorAction SilentlyContinue)) {
            Write-Warning -Message "Default log path $Path not exists!"
            Write-Host "Search couch.log in the $root path..."
            $Path = (Get-ChildItem -Path $root -Recurse | Where-Object { $_.Name -like "couch.log" } | Select-Object FullName).FullName
            if (-not(Test-Path -Path $Path)) {
                throw "couch.log not found! Specify the `$Path parameter or check configuration!"
            }
            Write-Host
        }
    }
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
        [switch] $Rotate
    )
    # Check if $Path is empty
    if (-not($Path)) {
        # Windows?
        try {
            $Windows = ([bool](Get-CimInstance -ClassName Win32_OperatingSystem -ErrorAction SilentlyContinue))
        } catch [System.Management.Automation.CommandNotFoundException] {
            $Windows = $false
        }
        # Set default path...
        # Windows platform
        if ($Windows) {
            $Path = "C:\CouchDB\couch.log"
            $root = "C:\CouchDB"
            # Unix platform
        } else {
            $Path = "/var/log/couchdb/couch.log"
            $root = "/var/log"
        }
    }
    # ...and if not exists, search it
    if (-not(Test-Path -Path $Path -ErrorAction SilentlyContinue)) {
        Write-Warning -Message "Default log path $Path not exists!"
        Write-Host "Search couch.log in the $root path..."
        $Path = (Get-ChildItem -Path $root -Recurse | Where-Object { $_.Name -like "couch.log" } | Select-Object FullName).FullName
        if (-not(Test-Path -Path $Path)) {
            throw "couch.log not found! Specify the `$Path parameter or check configuration!"
        }
        Write-Host
    }
    # Clear log
    if ($Rotate.IsPresent) {
        Copy-Item -Path $Path -Destination "$Path.$(Get-Date -Format 'MM-dd-yyyy_HH_mm_ss')" -Force
        Clear-Content -Path $Path -Force
    } else {
        Clear-Content -Path $Path -Force
    }
}