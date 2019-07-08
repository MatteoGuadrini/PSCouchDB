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

Read the log
____________

To read entire log.

.. code-block:: powershell

    Read-CouchDBLog

.. note::
    The default path on Windows is ``C:\CouchDB\couch.log``, while on Unix it is ``/var/log/couchdb/couch.log``.
    Otherwise, if the log is in a custom path, specify the path using the ``-Path`` parameter.

This example is used to read only the last 15 lines of log.

.. code-block:: powershell

    Read-CouchDBLog -Tail 15

Instead this to stay in append on the log for the level of warning.

.. code-block:: powershell

    Read-CouchDBLog -Level warning -Follow

Level
*****

Each entry in the log has its own color, so as to identify the line of interest "at a glance".

.. role:: goldenrod 
.. role:: dimgray
.. role:: gray
.. role:: yellow
.. role:: red
.. role:: darkred
.. role:: darkmagenta
.. role:: magenta

.. raw:: html

  <style type="text/css"><!--
   .goldenrod {color: goldenrod;}
   .dimgray {color: dimgray;}
   .gray {color: gray;}
   .yellow {color: yellow;}
   .red {color: red;}
   .darkred {color: darkred;}
   .darkmagenta {color: darkmagenta;}
   .magenta {color: magenta;}
   --></style>

:goldenrod:`debug` : Detailed debug logging.

:dimgray:`info` : Informative logging. Includes HTTP requests headlines, startup of an external processes etc.

:gray:`notice`

:yellow:`warning` : Warning messages are alerts about edge situations that may lead to errors.

:red:`error` : Error level includes only things that go wrong, like crash reports and HTTP error responses (5xx codes).

:darkred:`critical`

:darkmagenta:`alert`

:magenta:`emergency`

Clear the log
_____________

Clear entire and rotate (save a copy in the same folder) log.

.. code-block:: powershell

    Clear-CouchDBLog -Rotate


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