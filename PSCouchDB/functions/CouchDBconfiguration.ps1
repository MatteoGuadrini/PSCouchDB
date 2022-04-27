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
    .PARAMETER ProxyServer
    Proxy server through which all non-local calls pass.
    Ex. ... -ProxyServer 'http://myproxy.local:8080' ...
    .PARAMETER ProxyCredential
    Proxy server credential. It must be specified with a PSCredential object.
    .EXAMPLE
    Enable-CouchDBCluster -SingleNode -Authorization "admin:password"
    This example get a cluster setup.
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/config.html#setup
    #>
    [CmdletBinding(DefaultParameterSetName = 'Single')]
    param(
        [Parameter(ValueFromPipeline = $true)]
        [Parameter(ParameterSetName = "Single")]
        [Parameter(ParameterSetName = "Cluster")]
        [string] $Server,
        [Parameter(ParameterSetName = "Single")]
        [Parameter(ParameterSetName = "Cluster")]
        [int] $Port,
        [Parameter(ParameterSetName = "Cluster")]
        [ValidateRange(1, 3)]
        [int] $NodeCount = 3,
        [Parameter(ParameterSetName = "Single")]
        [switch] $SingleNode,
        [Parameter(ParameterSetName = "Single")]
        [Parameter(ParameterSetName = "Cluster")]
        [string] $BindAddress = '0.0.0.0',
        [Parameter(ParameterSetName = "Single")]
        [Parameter(ParameterSetName = "Cluster")]
        [int] $BindPort = 5984,
        [Parameter(ParameterSetName = "Cluster")]
        [string] $RemoteNode,
        [Parameter(ParameterSetName = "Cluster")]
        [string] $RemoteUser,
        [Parameter(ParameterSetName = "Cluster")]
        [SecureString] $RemotePassword,
        [Parameter(ParameterSetName = "Single")]
        [Parameter(ParameterSetName = "Cluster")]
        $Authorization,
        [Parameter(ParameterSetName = "Single")]
        [Parameter(ParameterSetName = "Cluster")]
        [switch] $Ssl,
        [string] $ProxyServer,
        [pscredential] $ProxyCredential
    )
    $Database = "_cluster_setup"
    # Initialize data
    $Data = [PSCustomObject]@{
        action = ''
        bind_address = ''
        port = 5984
        username = ''
        password = ''
    }
    # Get a user and password
    if ($Authorization -is [pscredential]) {
        $username, $password = $Authorization.UserName, $Authorization.GetNetworkCredential().Password
    } else {
        $username, $password = $Authorization -split ':'
    }
    if ($PSCmdlet.ParameterSetName -eq "Single") {
        $Data.action = 'enable_single_node'
        $Data.bind_address = $BindAddress
        $Data.port = $BindPort
        $Data.username = $username
        $Data.password = $password
        Add-Member -InputObject $Data NoteProperty 'node_count' 1
        Write-Host "Enabling single cluster"
        $Data = $Data | ConvertTo-Json
        Send-CouchDBRequest -Server $Server -Port $Port -Method "POST" -Database $Database -Data $Data -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential
    } else {
        $Data.action = 'enable_cluster'
        $Data.bind_address = $BindAddress
        $Data.port = $BindPort
        $Data.username = $username
        $Data.password = $password
        Add-Member -InputObject $Data NoteProperty 'remote_node' $RemoteNode
        Add-Member -InputObject $Data NoteProperty 'remote_current_user' $RemoteUser
        Add-Member -InputObject $Data NoteProperty 'remote_current_password' $RemotePassword
        Add-Member -InputObject $Data NoteProperty 'node_count' $NodeCount
        Write-Host "Enabling cluster"
        $Data = $Data | ConvertTo-Json
        Send-CouchDBRequest -Server $Server -Port $Port -Method "POST" -Database $Database -Data $Data -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential
        Write-Host "Finishing cluster"
        Send-CouchDBRequest -Server $Server -Port $Port -Method "POST" -Database $Database -Data '{"action": "finish_cluster"}' -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential
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
    .PARAMETER Node
    Erlang node name of the server that processes the request. Default is _local.
    .PARAMETER Membership
    Displays the nodes that are part of the cluster as cluster_nodes.
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
        [string] $Node = '_local',
        [switch] $Membership,
        $Authorization,
        [switch] $Ssl,
        [string] $ProxyServer,
        [pscredential] $ProxyCredential
    )
    if ($Membership.IsPresent) {
        $Database = "_membership"
    } else {
        $Database = "_node/$Node"
    }
    Send-CouchDBRequest -Server $Server -Port $Port -Method "GET" -Database $Database -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential
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
    .PARAMETER ProxyServer
    Proxy server through which all non-local calls pass.
    Ex. ... -ProxyServer 'http://myproxy.local:8080' ...
    .PARAMETER ProxyCredential
    Proxy server credential. It must be specified with a PSCredential object.
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
        $Authorization,
        [switch] $Ssl,
        [string] $ProxyServer,
        [pscredential] $ProxyCredential
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
    Send-CouchDBRequest -Server $Server -Port $Port -Method "POST" -Database $Database -Data $Data -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential
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
    .PARAMETER ProxyServer
    Proxy server through which all non-local calls pass.
    Ex. ... -ProxyServer 'http://myproxy.local:8080' ...
    .PARAMETER ProxyCredential
    Proxy server credential. It must be specified with a PSCredential object.
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
        $Authorization,
        [switch]$Force,
        [switch] $Ssl,
        [string] $ProxyServer,
        [pscredential] $ProxyCredential
    )
    $Database = "_nodes/_local"
    # Check node
    if ((Get-CouchDBClusterSetup -Authorization $Authorization -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential).state -eq 'single_node_enabled') {
        $clu_property = 'name'
    } else {
        $clu_property = 'all_nodes'
    }
    if ((Get-CouchDBNode -Authorization "admin:password" -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential -ErrorAction SilentlyContinue).$clu_property -contains $Node) {
        $Revision = (Get-CouchDBDocument -Server $Server -Port $Port -Database $Database -Document $Node -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential)._rev
    } else {
        throw "Node $Node not exist."
    }
    $Document = $Node
    if ($Force -or $PSCmdlet.ShouldContinue("Do you wish remove node $Node ?", "Remove $Node")) {
        Send-CouchDBRequest -Server $Server -Port $Port -Method "DELETE" -Database $Database -Document $Document -Revision $Revision -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential
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
    .PARAMETER ProxyServer
    Proxy server through which all non-local calls pass.
    Ex. ... -ProxyServer 'http://myproxy.local:8080' ...
    .PARAMETER ProxyCredential
    Proxy server credential. It must be specified with a PSCredential object.
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
        [string] $Node = (Get-CouchDBNode -Server $Server -Port $Port -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential).name,
        [Parameter(Position = 0)]
        [string] $Session,
        [Parameter(Position = 1)]
        [string] $Key,
        $Authorization,
        [switch] $Ssl,
        [string] $ProxyServer,
        [pscredential] $ProxyCredential
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
    Send-CouchDBRequest -Server $Server -Port $Port -Method "GET" -Database $Database -Document $Document -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential
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
    .PARAMETER ProxyServer
    Proxy server through which all non-local calls pass.
    Ex. ... -ProxyServer 'http://myproxy.local:8080' ...
    .PARAMETER ProxyCredential
    Proxy server credential. It must be specified with a PSCredential object.
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
        [string] $Node = $(if ((Get-CouchDBNode -Server $Server -Port $Port -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential).name -contains "couchdb@localhost") { "couchdb@localhost" } else { "couchdb@127.0.0.1" }),
        [Parameter(mandatory = $true, Position = 0)]
        [string] $Element,
        [Parameter(mandatory = $true, Position = 1)]
        [string] $Key,
        [Parameter(mandatory = $true, Position = 2)]
        [string] $Value,
        $Authorization,
        [switch] $Ssl,
        [string] $ProxyServer,
        [pscredential] $ProxyCredential
    )
    $Database = "_node"
    $Document = "$Node/_config"
    if ((Get-CouchDBConfiguration -Server $Server -Port $Port -Node $Node -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential).$Element) {
        $Document += "/$Element/$Key"
    } else {
        throw "Element $Element not exist!"
    }
    $Data = $Value | ConvertTo-Json
    Send-CouchDBRequest -Server $Server -Port $Port -Method "PUT" -Database $Database -Document $Document -Data $Data -Authorization $Authorization -Ssl:$Ssl -ProxyServer $ProxyServer -ProxyCredential $ProxyCredential
}