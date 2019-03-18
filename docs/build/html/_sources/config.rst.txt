:toctree:

    intro
    config
    permission
    server
    auth
    databases
    documents
    ddoc
    cmdlets
    classes
    uses
    support

Setup
=====

CouchDB 2.x can be deployed in either a single-node or a clustered setup. 
This section covers the first-time setup steps required for each of these configuration.

.. warning::
    Before configuring one of the two modes, it is advisable to create an administrative user. Without it, the two cluster modes will not be complete.
    For more details, see `Permission <permission.html>`_ section.


Single Node
___________

A single node cluster is nothing more than a cluster extended to a single node, ie the local one.
To configure it, run:

.. code-block:: powershell

    Enable-CouchDBCluster -SingleNode -Authorization "admin:password"

Cluster
_______

Same thing of the single node, but with two or more nodes. By default the nodes are 3.

.. code-block:: powershell

    Enable-CouchDBCluster -Authorization "admin:password"


Nodes
=====

Nodes are the songoli elements of a cluster. by element we mean a server, local or remote. To verify the active cluster nodes, run:

.. code-block:: powershell

    Get-CouchDBNode -Authorization "admin:password"

Add a node
__________

To manually add a node to the cluster, simply run:

.. code-block:: powershell

    Add-CouchDBNode -BindAddress 127.0.1.1 -Authorization "admin:password"

Remove a node
_____________

To manually add a node to the cluster, simply run:

.. code-block:: powershell

    Get-CouchDBNode -Authorization "admin:password"

    Remove-CouchDBNode -BindAddress couchdb@127.0.1.1 -Authorization "admin:password"


Configuration
=============

The CouchDB Server Configuration API provide an interface to query and update the various configuration values within a running CouchDB instance.

Get configuration
_________________

To get the entire CouchDB server configuration. The structure is organized by different configuration sections, with individual values.

.. code-block:: powershell

    Get-CouchDBConfiguration -Authorization "admin:password"

Modify configuration
____________________

To modify configuration, see help of this cmdlet:

.. code-block:: powershell

    Set-CouchDBConfiguration -?
    help Set-CouchDBConfiguration
    Get-Help Set-CouchDBConfiguration

Modify an element
*****************

For example, to change SSL port 6984 with 443:

.. code-block:: powershell

    Set-CouchDBConfiguration -Element ssl -Key port -Value 443 -Authorization "admin:password"

.. note::
    This cmdlet return the old value. To verify the changed value, run:
    ``Get-CouchDBConfiguration -Authorization "admin:password" | Select-Object ssl | Format-List``
