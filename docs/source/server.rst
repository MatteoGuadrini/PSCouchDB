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

Server operation
================

Below are all the cmdlets needed to get all the information on the CouchDB server.

To get the version and other info on the server, run:

.. code-block:: powershell

    Get-CouchDBServer

To get list of running tasks, including the task type, name, status and process ID:

.. code-block:: powershell

    Get-CouchDBActiveTask -Authorization "admin:password"

To get list of all the databases in the CouchDB instance:

.. code-block:: powershell

    Get-CouchDBDatabase

To get information of a list of the specified databases in the CouchDB instance:

.. code-block:: powershell

    Get-CouchDBDatabaseInfo -Keys test,test1,test2

To get the status of the node or cluster, run this:

.. code-block:: powershell

    Get-CouchDBClusterSetup -Authorization "admin:password"

To get a list of all database events in the CouchDB instance:

.. code-block:: powershell

    Get-CouchDBDatabaseUpdates -Authorization "admin:password"

To displays the nodes that are part of the cluster:

.. code-block:: powershell

    Get-CouchDBNode -Authorization "admin:password"

To get the statistics for the running server:

.. code-block:: powershell

    Measure-CouchDBStatistics -Authorization "admin:password"
    Measure-CouchDBStatistics -System -Authorization "admin:password"

To restart server:

.. note::
    This task required privileged access on operating system


.. code-block:: powershell

    Restart-CouchDBServer

And check health:

.. code-block:: powershell

    Get-CouchDBServer -Status

To get one or more Universally Unique Identifiers (UUIDs) from the CouchDB instance:

.. code-block:: powershell

    New-CouchDBUuids

Replication
===========

The replication is an incremental one way process involving two databases (a source and a destination).

Get replica
___________

To get a replication document.

.. code-block:: powershell

    Get-CouchDBReplication -Authorization "admin:password"

To get a list of replication jobs.

.. code-block:: powershell

    Get-CouchDBReplicationScheduler -Authorization "admin:password"

And to get a list of replication document states.

.. code-block:: powershell

    Get-CouchDBReplicationDocument -Authorization "admin:password"

Create replica
______________

Creation of the replicator database and replication agent is automatically in the same time.

.. code-block:: powershell

    New-CouchDBReplication -SourceDatabase test -TargetDatabase test_dump -Continuous -Authorization "admin:password"

.. note::
    The ``Authorization`` parameter refers to source database. 
    It is preferable that the destination database is not password protected, otherwise an inaccessibility error will return.

Now that we have a replicated document, let's take a look at the change.

.. code-block:: powershell

    Get-CouchDBDatabaseChanges -Database test_dump

Modify replica
______________

To change the replication agent settings (continuous: true | false).

.. code-block:: powershell

    $replica = Get-CouchDBReplication -Authorization "admin:password"
    Write-Output $replica.rows.id[1] $replica.rows.value[1].rev
    # continuous: false
    Set-CouchDBReplication -Document $replica.rows.id[1] -Revision $replica.rows.value[1].rev -Authorization "admin:password"
    # continuous: true
    Set-CouchDBReplication -Document $replica.rows.id[1] -Revision $replica.rows.value[1].rev -Continuous -Authorization "admin:password"

Remove replica
______________

To remove the replication agent.

.. code-block:: powershell

    Remove-CouchDBReplication -Document localhost-test_localhost-test_dump -Authorization -Authorization "admin:password"

Replication request
____________________

Request, configure, or stop, a replication operation.

.. code-block:: powershell

    Request-CouchDBReplication -SourceDatabase test -TargetDatabase test_dump -Documents "Hitchhikers","Hitchhikers_Guide" -Authorization "admin:password"