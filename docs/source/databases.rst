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

Databases
=========

The Database endpoint provides an interface to an entire database with in CouchDB. These are database-level, rather than document-level requests.

Test a database
_______________

To verify the existence of a database.

.. code-block:: powershell

    Test-CouchDBDatabase -Database test

Read a database
_______________

Gets information about the specified database.

.. code-block:: powershell

    Get-CouchDBDatabase -Database test

To get alist of all databases, run this:

.. code-block:: powershell

    Get-CouchDBDatabase

Create a database
_________________

Creates a new database.

.. code-block:: powershell

    New-CouchDBDatabase -Database test -Authorization "admin:password"

.. note::
    If we repeat the same request to CouchDB, it will response with ``412`` since the database already exists.
    If an invalid database name is supplied, CouchDB returns response with ``400``

Remove a database
_________________

Deletes the specified database, and all the documents and attachments contained within it.

.. code-block:: powershell

    Remove-CouchDBDatabase -Database test -Authorization "admin:password"

Index
_____

Mango is a declarative JSON querying language for CouchDB databases. Mango wraps several index types, starting with the Primary Index out-of-the-box.

Get a index
***********

To get list of index present on a database.

.. code-block:: powershell

    Get-CouchDBIndex -Database test

Create a new index
******************

Create a new index on a database.

.. code-block:: powershell

    New-CouchDBIndex -Database test -Name test-index -Fields name,surname -Authorization "admin:password"

Remove a index
**************

Remove an existing index.

.. code-block:: powershell

    $idx = Get-CouchDBIndex -Database test
    Remove-CouchDBIndex -Database test -DesignDoc $idx.indexes.ddoc[1] -Name $idx.indexes.name[1] -Authorization "admin:password"

Shards
______

Get a list of database shards. Each shard will have its internal database range, and the nodes on which replicas of those shards are stored.

Get shards
**********

Get a list a database shards.

.. code-block:: powershell

    Get-CouchDBDatabaseShards -Database test

Sync shards
***********

For the given database, force-starts internal shard synchronization for all replicas of all database shards.

.. code-block:: powershell

    Sync-CouchDBDatabaseShards -Database test -Authorization "admin:password"

Changes
_______

To get a sorted list of changes made to documents in the database, in time order of application, can be obtained from the database’s _changes resource.

.. code-block:: powershell

    Get-CouchDBDatabaseChanges -Database test

Compact
_______

Request compaction of the specified database. 
Compaction can only be requested on an individual database; you cannot compact all the databases for a CouchDB instance. 
The compaction process runs as a background process.

.. code-block:: powershell

    Compress-CouchDBDatabase -Database test -Authorization "admin:password"

Write a commit
______________

Commits any recent changes to the specified database to disk.

.. code-block:: powershell

    Write-CouchDBFullCommit -Database test -Authorization "admin:password"

Clear view
__________

Removes view index files that are no longer required by CouchDB as a result of changed views within design documents.

.. code-block:: powershell

    Clear-CouchDBView -Database test -Authorization "admin:password"

Get purged info limit
_____________________

Gets the current purged_infos_limit (purged documents limit) setting, the maximum number of historical purges (purged document Ids with their revisions) that can be stored in the database.

.. code-block:: powershell

    Get-CouchDBDatabasePurgedLimit -Database test

Set purged info limit
_____________________

Set the current purged_infos_limit (purged documents limit) setting.

.. code-block:: powershell

    Set-CouchDBDatabasePurgedLimit -Database test -Limit 1500 -Authorization "admin:password"

Revisions
_________

Working with database revisions.

Get missing revisions
*********************

Get a list of document revisions, returns the document revisions that do not exist in the database.

.. code-block:: powershell

    Get-CouchDBMissingRevision -Database test -Document "Hitchhikers" -Revision 2-7051cbe5c8faecd085a3fa619e6e6337,3-825cb35de44c433bfb2df415563a19de

Get revision difference
***********************

Given a set of document/revision IDs, returns the subset of those that do not correspond to revisions stored in the database.

.. code-block:: powershell

    Get-CouchDBRevisionDifference -Database test -Document "Hitchhikers" -Revision 2-7051cbe5c8faecd085a3fa619e6e6337,3-825cb35de44c433bfb2df415563a19de

Get revision limit
******************

Gets the current revs_limit (revision limit) setting.

.. code-block:: powershell

    Get-CouchDBRevisionLimit -Database test

Set revision limit
******************

Sets the maximum number of document revisions that will be tracked by CouchDB.

.. code-block:: powershell

    Set-CouchDBRevisionLimit -Database test -Limit 1500 -Authorization "admin:password"