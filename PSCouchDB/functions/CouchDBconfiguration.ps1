# Configuration functions of CouchDB module

function Enable-CouchDBCluster () {
    <#
    .SYNOPSIS
    Create a new cluster.
    .DESCRIPTION
    Create a new cluster CouchDB server.
    .NOTES
    CouchDB API:
        POST /_cluster_setup
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER NodeCount
    Enable CouchDB cluster. Default node cluster is 3.
    .PARAMETER SingleNode
    Enable CouchDB cluster in a single node.
    .PARAMETER BindAddress
    The IP address to which to bind the current node. 
    The special value 0.0.0.0 (default) may be specified to bind to all interfaces on the host. (enable_cluster and enable_single_node only)
    .PARAMETER BindPort
    The TCP port to which to bind this node (enable_cluster and enable_single_node only).
    .PARAMETER RemoteNode
    The IP address of the remote node to setup as part of this cluster’s list of nodes. (enable_cluster only)
    .PARAMETER RemoteUser
    The username of the server-level administrator authorized on the remote node. (enable_cluster only)
    .PARAMETER RemotePassword
    The password of the server-level administrator authorized on the remote node. (enable_cluster only)
    .PARAMETER Authorization
    The CouchDB authorization form; user and password.
    Authorization format like this: user:password
    ATTENTION: if the password is not specified, it will be prompted.
    .PARAMETER Ssl
    Set ssl connection on CouchDB server.
    This modify protocol to https and port to 6984.
    .EXAMPLE
    Enable-CouchDBCluster -SingleNode -Authorization "admin:password"
    This example get a cluster setup.
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/config.html#setup
    #>
    [CmdletBinding()]
    param(
        [Parameter(ValueFromPipeline = $true)]
        [string] $Server,
        [int] $Port,
        [ValidateRange(1, 3)]
        [int] $NodeCount = 3,
        [switch] $SingleNode,
        [string] $BindAddress = '0.0.0.0',
        [int] $BindPort = 5984,
        [ValidateScript( { if (-not($SingleNode)) { $true } })]
        [string] $RemoteNode,
        [ValidateScript( { if (-not($SingleNode)) { $true } })]
        [string] $RemoteUser,
        [ValidateScript( { if (-not($SingleNode) -and ($RemoteUser)) { $true } })]
        [SecureString] $RemotePassword,
        [string] $Authorization,
        [switch] $Ssl
    )
    # Check if an admin has been created
    $name = & { if ($Authorization) { Write-Output $($Authorization -split ":")[0] } else { Write-Output "___" } }
    $admins = Get-CouchDBAdmin -Server $Server -Port $Port -Authorization $Authorization -Ssl:$Ssl -ErrorAction SilentlyContinue
    if (-not(Get-Member -Inputobject $admins -Name "$name" -ErrorAction SilentlyContinue)) {
        throw "Create an admin before configure cluster or specify a valid -Authorization parameter!" 
    }
    $Database = "_cluster_setup"
    $Credential = $Authorization -split ":"
    # Check if single node cluster mode enabled
    if ($SingleNode.IsPresent) {
        $Action = "enable_single_node"
    } else {
        $Action = "enable_cluster"
    }
    $Data = "
        {
            `"action`": `"$Action`",
            `"bind_address`": `"$BindAddress`",
            `"port`": `"$BindPort`",
            `"username`": `"$($Credential[0])`",
            `"password`": `"$($Credential[1])`"
        "
    # Check if single node cluster or not
    if ($Action -eq "enable_cluster") {
        if ($RemoteNode) { $Data += ",`"remote_node`": `"$RemoteNode`"" }
        if ($RemoteUser) { $Data += ",`"remote_current_user`": `"$RemoteUser`"" }
        if ($RemotePassword) { $Data += ",`"remote_current_password `": `"$(ConvertTo-CouchDBPassword -SecurePassword $RemotePassword)`"" }
        $Data += ",`"node_count`": `"$NodeCount`"}"
    } else {
        $Data += ",`"node_count`": `"1`"}"
    }
    Write-Host "Enabling $Action cluster"
    Send-CouchDBRequest -Server $Server -Port $Port -Method "POST" -Database $Database -Data $Data -Authorization $Authorization -Ssl:$Ssl
    if ($Action -eq "enable_cluster") { 
        $Data = '{"action": "finish_cluster"}'
        Write-Host "Finishing $Action cluster"
        Send-CouchDBRequest -Server $Server -Port $Port -Method "POST" -Database $Database -Data $Data -Authorization $Authorization -Ssl:$Ssl
    } else {
        Write-Host "Finishing $Action cluster"
    }
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

function Add-CouchDBNode () {
    <#
    .SYNOPSIS
    Add server nodes.
    .DESCRIPTION
    Add server nodes on CouchDB cluster.
    .NOTES
    CouchDB API:
        POST /_cluster_setup
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER BindPort
    The CouchDB node bind port. Default is 5984.
    .PARAMETER BindAddress
    The CouchDB node bind address, ip or hostname.
    .PARAMETER Authorization
    The CouchDB authorization form; user and password.
    Authorization format like this: user:password
    ATTENTION: if the password is not specified, it will be prompted.
    .PARAMETER Ssl
    Set ssl connection on CouchDB server.
    This modify protocol to https and port to 6984.
    .EXAMPLE
    Add-CouchDBNode -BindAddress couchdb1 -Authorization "admin:password"
    This example add node couchdb1:5984 in a cluster.
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/config.html#nodes
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [int] $BindPort = 5984,
        [Parameter(mandatory = $true, ValueFromPipeline = $true)]
        [string] $BindAddress,
        [string] $Authorization,
        [switch] $Ssl
    )
    $Database = "_cluster_setup"
    $Credential = $Authorization -split ":"
    $Data = "
    {
        `"action`": `"add_node`",
        `"host`": `"$BindAddress`",
        `"port`": `"$BindPort`",
        `"username`": `"$($Credential[0])`",
        `"password`": `"$($Credential[1])`"
    }
    "
    Send-CouchDBRequest -Server $Server -Port $Port -Method "POST" -Database $Database -Data $Data -Authorization $Authorization -Ssl:$Ssl
}

function Remove-CouchDBNode () {
    <#
    .SYNOPSIS
    Remove server nodes.
    .DESCRIPTION
    Remove server nodes on CouchDB server.
    .NOTES
    CouchDB API:
        DELETE /_node/{node-name}
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER Node
    The CouchDB node of cluster.
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
    Remove-CouchDBNode -Node "couchdb@localhost" -Authorization "admin:password"
    The example removes "test" node on cluster configuration.
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/config.html#remove-a-node
    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port,
        [Parameter(mandatory = $true, ValueFromPipeline = $true)]
        [string] $Node,
        [string] $Authorization,
        [switch]$Force,
        [switch] $Ssl
    )
    $Database = "_nodes"
    # Set protocol
    if ($Ssl.IsPresent) {
        if (-not($Port)) {
            if ((Get-CouchDBServer).version -match '3.*') { $Port = 6984 } elseif ((Get-CouchDBServer).version -match '2.*') { $Port = 6986 }
        }
    } else {
        if (-not($Port)) {
            if ((Get-CouchDBServer).version -match '3.*') { $Port = 5984 } elseif ((Get-CouchDBServer).version -match '2.*') { $Port = 5986 }
        }
    }
    if (Get-CouchDBDocument -Server $Server -Port $Port -Database $Database -Document $Node -Info -Authorization $Authorization -Ssl:$Ssl -ErrorAction SilentlyContinue) {
        $Revision = (Get-CouchDBDocument -Server $Server -Port $Port -Database $Database -Document $Node -Authorization $Authorization -Ssl:$Ssl)._rev
    } else {
        throw "Node $Node not exist."
    }
    $Document = $Node
    if ($Force -or $PSCmdlet.ShouldContinue("Do you wish remove node $Node ?", "Remove $Node")) {
        Send-CouchDBRequest -Server $Server -Port $Port -Method "DELETE" -Database $Database -Document $Document -Revision $Revision -Authorization $Authorization -Ssl:$Ssl
    }
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

function Set-CouchDBConfiguration () {
    <#
    .SYNOPSIS
    Set element configuration.
    .DESCRIPTION
    Set element configuration of CouchDB server.
    .NOTES
    CouchDB API:
        PUT /_node/{node-name}/_config/{section}/{key}
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    .PARAMETER Node
    The CouchDB node of cluster. Default is couchdb@localhost.
    .PARAMETER Element
    The element of configuration.
    .PARAMETER Key
    The key of configuration.
    .PARAMETER Value
    The value of key of configuration.
    .PARAMETER Authorization
    The CouchDB authorization form; user and password.
    Authorization format like this: user:password
    ATTENTION: if the password is not specified, it will be prompted.
    .PARAMETER Ssl
    Set ssl connection on CouchDB server.
    This modify protocol to https and port to 6984.
    .EXAMPLE
    Set-CouchDBConfiguration -Element ssl -Key port -Value 443 -Authorization "admin:password"
    This example set the localhost ssl port on 443 in configuration of CouchDB server.
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/config.html#modify-configuration
    #>
    [CmdletBinding()]
    param(
        [Parameter(ValueFromPipeline = $true)]
        [string] $Server,
        [int] $Port,
        [string] $Node = $(if ((Get-CouchDBNode -Server $Server -Port $Port -Authorization $Authorization -Ssl:$Ssl).name -contains "couchdb@localhost") { "couchdb@localhost" } else { "couchdb@127.0.0.1" }),
        [Parameter(mandatory = $true)]
        [string] $Element,
        [Parameter(mandatory = $true)]
        [string] $Key,
        [Parameter(mandatory = $true)]
        [string] $Value,
        [string] $Authorization,
        [switch] $Ssl
    )
    $Database = "_node"
    $Document = "$Node/_config"
    if ((Get-CouchDBConfiguration -Server $Server -Port $Port -Node $Node -Authorization $Authorization -Ssl:$Ssl).$Element) {
        $Document += "/$Element/$Key"
    } else {
        throw "Element $Element not exist!"
    }
    $Data = $Value | ConvertTo-Json
    Send-CouchDBRequest -Server $Server -Port $Port -Method "PUT" -Database $Database -Document $Document -Data $Data -Authorization $Authorization -Ssl:$Ssl
}