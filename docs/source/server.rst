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

Most of the cmdlets in this module are based on the ``Send-CouchDBRequest`` cmdlet.

.. code-block:: powershell

    Send-CouchDBRequest # alias creq
    Get-Help Send-CouchDBRequest -Full

Below are all the cmdlets needed to get all the information on the CouchDB server.

To get the version and other info on the server, run:

.. code-block:: powershell

    Get-CouchDBServer

To get list of running tasks, including the task type, name, status and process ID:

.. code-block:: powershell

    Get-CouchDBActiveTask -Authorization "admin:password"

To get list of all the databases in the CouchDB instance:

.. code-block:: powershell

    Get-CouchDBDatabase -Authorization "admin:password"

To get information of a list of the specified databases in the CouchDB instance:

.. code-block:: powershell

    Get-CouchDBDatabaseInfo -Keys test,test1,test2 -Authorization "admin:password"

To get the status of the node or cluster, run this:

.. code-block:: powershell

    Get-CouchDBClusterSetup -Authorization "admin:password"

To get a list of all database events in the CouchDB instance:

.. code-block:: powershell

    Get-CouchDBDatabaseUpdates -Authorization "admin:password"

For other parameter see the table below:

================    ===========
PARAMETER           DESCRIPTION
================    ===========
Feed				Option:	            	
					**normal**: Returns all historical DB changes, then closes the connection. Default.
					
					**longpoll**: Closes the connection after the first event.
					
					**continuous**: Send a line of JSON per event. Keeps the socket open until timeout.
					
					**eventsource**: Like, continuous, but sends the events in EventSource format.
Timeout             Number of seconds until CouchDB closes the connection. Default is 60.
Heartbeat           Period in milliseconds after which an empty line is sent in the results. Only applicable for longpoll, continuous, and eventsource feeds. Overrides any timeout to keep the feed alive indefinitely. Default is 60000.
Since             	Return only updates since the specified sequence ID. May be the string "now" to begin showing only new updates.
================    ===========

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

To set proxy server for all calls:

.. code-block:: powershell

    Set-CouchDBProxy -Server 'http://myproxy.local:8080' -Credential (Get-Credential)

And remove it

.. code-block:: powershell

    Remove-CouchDBProxy

Tests the results of Lucene analyzer tokenization on sample text:

.. code-block:: powershell

    Search-CouchDBAnalyze -Field "english" -Text "running" -Authorization "admin:password"

Read the log
____________

To read entire log.

.. code-block:: powershell

    Read-CouchDBLog -Authorization "admin:password"

.. note::
    The default path is specified in the server configuration. Run `` Get-CouchDBConfiguration -Session log -Key file -Authorization admin:password``.
    Otherwise, specify the path using the ``-Path`` parameter.

This example is used to read only the last 15 lines of log.

.. code-block:: powershell

    Read-CouchDBLog -Tail 15 -Authorization "admin:password"

Instead this to stay in append on the log for the level of warning.

.. code-block:: powershell

    Read-CouchDBLog -Level warning -Follow -Authorization "admin:password"

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

    Clear-CouchDBLog -Rotate -Authorization "admin:password"


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

    using module PSCouchDB
    $rep = New-Object PSCouchDBReplication -ArgumentList 'test','test_dump'
    $rep.SetContinuous()
    New-CouchDBReplication -Data $rep -Authorization "admin:password"

Now that we have a replicated document, let's take a look at the change.

.. code-block:: powershell

    Get-CouchDBDatabaseChanges -Database test_dump -Authorization "admin:password"

Modify replica
______________

To change the replication agent settings (continuous: true | false).

.. code-block:: powershell

    using module PSCouchDB
    $rep = New-Object PSCouchDBReplication -ArgumentList 'test','test_dump'
    $rep.SetRevision("4-c2cefa18494e47182a125b11eccecd13")
    Set-CouchDBReplication -Data $rep -Authorization "admin:password"

Remove replica
______________

To remove the replication agent.

.. code-block:: powershell

    Remove-CouchDBReplication -Document test_test_dump -Authorization "admin:password"

Replication request
____________________

Request, configure, or stop, a replication operation.

.. code-block:: powershell

    using module PSCouchDB
    $rep = New-Object PSCouchDBReplication -ArgumentList 'test','test_dump'
    $rep.AddDocIds(@("Hitchhikers","Hitchhikers_Guide"))
    Request-CouchDBReplication -Data $rep -Authorization "admin:password"