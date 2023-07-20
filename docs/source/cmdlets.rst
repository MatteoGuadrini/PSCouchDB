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

Preferences
===========

Below a list of variable preferences of module

.. code-block:: powershell

    $CouchDBCachePreference             # default value: $false
    $CouchDBSaveCredentialPreference    # default value: $true

Cmdlets and aliases
===================

Below is a list of cmdlets and aliases

Cmdlets
_______

Help
****

**Search-CouchDBHelp**

.. code-block:: powershell

    Search-CouchDBHelp [-Pattern] <Object> [<CommonParameters>]

**New-CouchDBObject**

.. code-block:: powershell

    New-CouchDBObject [[-TypeName] <String>] [[-ArgumentList] <Array>] [<CommonParameters>]

Configuration
*************

**Enable-CouchDBCluster**

.. code-block:: powershell

    Enable-CouchDBCluster [[-Server] <String>] [[-Port] <Int32>] [[-NodeCount] <Int32>] [-SingleNode] [[-BindAddress] <String>] [[-BindPort] <Int32>] [[-RemoteNode] <String>] [[-RemoteUser] <String>] [[-RemotePassword] <SecureString>] [[-Authorization] <String>] [-Ssl] [[-ProxyServer] <String>] [[-ProxyCredential] <Object>] [<CommonParameters>]

**Get-CouchDBNode**

.. code-block:: powershell

    Get-CouchDBNode [[-Server] <String>] [[-Port] <Int32>] [[-Node] <String>] [-Membership] [-Versions] [-Prometheus] [[-Authorization] <Object>] [-Ssl] [[-ProxyServer] <String>] [[-ProxyCredential] <PSCredential>] [<CommonParameters>]

**Add-CouchDBNode**

.. code-block:: powershell

    Add-CouchDBNode [[-Server] <String>] [[-Port] <Int32>] [[-BindPort] <Int32>] [-BindAddress] <String> [[-Authorization] <String>] [-Ssl] [[-ProxyServer] <String>] [[-ProxyCredential] <Object>] [<CommonParameters>]

**Remove-CouchDBNode**

.. code-block:: powershell

    Remove-CouchDBNode [[-Server] <String>] [[-Port] <Int32>] [[-Database] <String>] [-Node] <String> [[-Authorization] <String>] [-Force] [-Ssl] [[-ProxyServer] <String>] [[-ProxyCredential] <Object>] [-WhatIf] [-Confirm] [<CommonParameters>]

**Get-CouchDBConfiguration**

.. code-block:: powershell

    Get-CouchDBConfiguration [[-Server] <String>] [[-Port] <Int32>] [[-Node] <String>] [[-Session] <String>] [[-Key] <String>] [[-Authorization] <String>] [-Ssl] [[-ProxyServer] <String>] [[-ProxyCredential] <Object>] [<CommonParameters>]

**Set-CouchDBConfiguration**

.. code-block:: powershell

    Set-CouchDBConfiguration [[-Server] <String>] [[-Port] <Int32>] [[-Database] <String>] [[-Node] <String>] [-Element] <String> [-Key] <String> [-Value] <String> [[-Authorization] <String>] [-Ssl] [[-ProxyServer] <String>] [[-ProxyCredential] <Object>] [<CommonParameters>]

Permission
**********

**New-CouchDBAdmin**

.. code-block:: powershell

    New-CouchDBAdmin [[-Server] <String>] [[-Port] <Int32>] [[-Database] <String>] [[-Node] <String>] [-Userid] <String> [-Password] <SecureString> [[-Authorization] <String>] [-Ssl] [[-ProxyServer] <String>] [[-ProxyCredential] <Object>] [<CommonParameters>] 

**New-CouchDBUser**

.. code-block:: powershell

    New-CouchDBUser [[-Server] <String>] [[-Port] <Int32>] [[-Database] <String>] [-Userid] <String> [-Password] <SecureString> [[-Roles] <Array>] [[-Authorization] <String>] [-Ssl] [[-ProxyServer] <String>] [[-ProxyCredential] <Object>] [<CommonParameters>]

**Grant-CouchDBDatabasePermission**

.. code-block:: powershell

    Grant-CouchDBDatabasePermission [[-Server] <String>] [[-Port] <Int32>] [-Database] <String> [[-Data] <Object>] [[-Authorization] <String>] [-Ssl] [[-ProxyServer] <String>] [[-ProxyCredential] <Object>] [<CommonParameters>]

**Get-CouchDBDatabaseSecurity**

.. code-block:: powershell

    Get-CouchDBDatabaseSecurity [[-Server] <String>] [[-Port] <Int32>] [-Database] <String> [[-Variable] <String>] [[-Authorization] <String>] [-Ssl] [[-ProxyServer] <String>] [[-ProxyCredential] <Object>] [<CommonParameters>]

**Revoke-CouchDBDatabasePermission**

.. code-block:: powershell

    Revoke-CouchDBDatabasePermission [[-Server] <String>] [[-Port] <Int32>] [-Database] <String> [[-Authorization] <String>] [-Force] [-Ssl] [[-ProxyServer] <String>] [[-ProxyCredential] <Object>] [-WhatIf] [-Confirm] [<CommonParameters>]

**Remove-CouchDBAdmin**

.. code-block:: powershell

    Remove-CouchDBAdmin [[-Server] <String>] [[-Port] <Int32>] [[-Database] <String>] [[-Node] <String>] [-Userid] <String> [[-Authorization] <String>] [-Force] [-Ssl] [[-ProxyServer] <String>] [[-ProxyCredential] <Object>] [-WhatIf] [-Confirm] [<CommonParameters>]

**Remove-CouchDBUser**

.. code-block:: powershell

    Remove-CouchDBUser [[-Server] <String>] [[-Port] <Int32>] [[-Database] <String>] [-Userid] <String> [-Revision] <String> [[-Authorization] <String>] [-Force] [-Ssl] [[-ProxyServer] <String>] [[-ProxyCredential] <Object>] [-WhatIf] [-Confirm] [<CommonParameters>]

**Set-CouchDBUser**

.. code-block:: powershell

    Set-CouchDBUser [[-Server] <String>] [[-Port] <Int32>] [[-Database] <String>] [-Userid] <String> [-Password] <SecureString> [[-Roles] <Array>] [-Revision] <String> [[-Authorization] <String>] [-Ssl] [[-ProxyServer] <String>] [[-ProxyCredential] <Object>] [<CommonParameters>]

**Set-CouchDBAdmin**

.. code-block:: powershell

    Set-CouchDBAdmin [[-Server] <String>] [[-Port] <Int32>] [[-Database] <String>] [[-Node] <String>] [-Userid] <String> [-Password] <SecureString> [[-Authorization] <String>] [-Ssl] [[-ProxyServer] <String>] [[-ProxyCredential] <Object>] [<CommonParameters>]

Server
******

**Send-CouchDBRequest**

.. code-block:: powershell

    Send-CouchDBRequest [[-Method] <String>] [[-Server] <String>] [[-Port] <Int32>] [[-Database] <String>] [[-Document] <String>] [[-Authorization] <Object>] [[-Revision] <String>] [[-Attachment] <String>] [[-Data] <String>] [[-Params] <Array>] [-Ssl] [[-JobName] <String>] [[-ProxyServer] <String>] [[-ProxyCredential] <Object>] [<CommonParameters>]

**Set-CouchDBProxy**

.. code-block:: powershell

    Set-CouchDBProxy [-Server] <String> [[-Credential] <PSCredential>] [<CommonParameters>]

**Remove-CouchDBProxy**

.. code-block:: powershell

    Remove-CouchDBProxy [<CommonParameters>]

**Get-CouchDBServer**

.. code-block:: powershell

    Get-CouchDBServer [[-Server] <String>] [[-Port] <Int32>] [[-Authorization] <String>] [-Status] [-Ssl] [[-ProxyServer] <String>] [[-ProxyCredential] <Object>] [<CommonParameters>]

**Get-CouchDBActiveTask**

.. code-block:: powershell

    Get-CouchDBActiveTask [[-Server] <String>] [[-Port] <Int32>] [[-Authorization] <String>] [-Ssl] [[-ProxyServer] <String>] [[-ProxyCredential] <Object>] [<CommonParameters>]

**Get-CouchDBClusterSetup**

.. code-block:: powershell

    Get-CouchDBClusterSetup [[-Server] <String>] [[-Port] <Int32>] [[-EnsureDatabaseExist] <Array>] [[-Authorization] <String>] [-Ssl] [[-ProxyServer] <String>] [[-ProxyCredential] <Object>] [<CommonParameters>]

**Get-CouchDBDatabaseUpdates**

.. code-block:: powershell

    Get-CouchDBDatabaseUpdates [[-Server] <String>] [[-Port] <Int32>] [[-Feed] <String>] [[-Timeout] <Int32>] [[-Heartbeat] <Int32>] [[-Since] <String>] [[-Authorization] <String>] [-Ssl] [[-ProxyServer] <String>] [[-ProxyCredential] <Object>] [<CommonParameters>]

**Measure-CouchDBStatistics**

.. code-block:: powershell

    Measure-CouchDBStatistics [[-Server] <String>] [[-Port] <Int32>] [-System] [[-Authorization] <String>] [-Ssl] [[-ProxyServer] <String>] [[-ProxyCredential] <Object>] [<CommonParameters>]

**Restart-CouchDBServer**

.. code-block:: powershell

    Restart-CouchDBServer [-Force] [-WhatIf] [-Confirm] [<CommonParameters>]

**New-CouchDBUuids**

.. code-block:: powershell

    New-CouchDBUuids [[-Server] <String>] [[-Port] <Int32>] [[-Count] <Int32>] [[-Authorization] <String>] [-Ssl] [[-ProxyServer] <String>] [[-ProxyCredential] <Object>] [<CommonParameters>]

**Read-CouchDBLog**

.. code-block:: powershell

    Read-CouchDBLog [[-Path] <String>] [[-Level] <String>] [-Follow] [[-Tail] <Int32>] [[-Authorization] [-Ssl] [[-ProxyServer] <String>] [[-ProxyCredential] <Object>] <Object>] [<CommonParameters>]

**Clear-CouchDBLog**

.. code-block:: powershell

    Clear-CouchDBLog [[-Path] <String>] [-Rotate] [[-Authorization] <Object>] [-Ssl] [[-ProxyServer] <String>] [[-ProxyCredential] <Object>] [<CommonParameters>]

**Search-CouchDBAnalyze**

.. code-block:: powershell

    Search-CouchDBAnalyze [[-Server] <String>] [[-Port] <Int32>] [-Field] <String> [-Text] <String> [[-Authorization] <Object>] [-Ssl] [[-ProxyServer] <String>] [[-ProxyCredential] <PSCredential>] [<CommonParameters>]

**Get-CouchDBReshards**

.. code-block:: powershell

    Get-CouchDBReshards [-Server <String>] [-Port <Int32>] [-Jobs] [-Authorization <Object>] [-Ssl] [-ProxyServer <String>] [-ProxyCredential <PSCredential>] [<CommonParameters>]  
    
    Get-CouchDBReshards [-Server <String>] [-Port <Int32>] [-State] [-JobId <String>] [-Authorization <Object>] [-Ssl] [-ProxyServer <String>] [-ProxyCredential <PSCredential>] [<CommonParameters>]

**Set-CouchDBReshards**

.. code-block:: powershell

    Set-CouchDBReshards [-Server <String>] [-Port <Int32>] [-Type <String>] [-Database <String>] [-Node <String>] [-Range <String>] [-Shard <String>] [-Err <String>] [-Authorization <Object>] [-Ssl] [-ProxyServer <String>] [-ProxyCredential <PSCredential>] [<CommonParameters>]
    
    Set-CouchDBReshards [-Server <String>] [-Port <Int32>] [-State <String>] [-StateReason <String>] [-JobId <String>] [-Authorization <Object>] [-Ssl] [-ProxyServer <String>] [-ProxyCredential <PSCredential>] [<CommonParameters>]

**Remove-CouchDBReshards**

.. code-block:: powershell

    Remove-CouchDBReshards [[-Server] <String>] [[-Port] <Int32>] [-JobId] <String> [[-Authorization] <Object>] [-Ssl] [[-ProxyServer] <String>] [[-ProxyCredential] <PSCredential>] [<CommonParameters>]

**Set-CouchDBMaintenanceMode**

.. code-block:: powershell

    Set-CouchDBMaintenanceMode [[-Server] <String>] [[-Port] <Int32>] [[-Node] <String>] [[-Maintenance] <Boolean>] [[-Authorization] <Object>] [-Ssl] [[-ProxyServer] <String>] [[-ProxyCredential] <PSCredential>] [<CommonParameters>]

Replication
***********

**Get-CouchDBReplication**

.. code-block:: powershell

    Get-CouchDBReplication [[-Server] <String>] [[-Port] <Int32>] [[-Database] <String>] [[-Document] <String>] [[-Authorization] <String>] [-Ssl] [[-ProxyServer] <String>] [[-ProxyCredential] <Object>] [<CommonParameters>]

**Get-CouchDBReplicationScheduler**

.. code-block:: powershell

    Get-CouchDBReplicationScheduler [[-Server] <String>] [[-Port] <Int32>] [[-Limit] <Int32>] [[-Skip] <Int32>] [[-Authorization] <String>] [-Ssl] [[-ProxyServer] <String>] [[-ProxyCredential] <Object>] [<CommonParameters>]

**Get-CouchDBReplicationDocument**

.. code-block:: powershell

    Get-CouchDBReplicationDocument [[-Server] <String>] [[-Port] <Int32>] [[-Limit] <Int32>] [[-Skip] <Int32>] [[-ReplicatorDatabase] <String>] [[-ReplicatorDocuments] <String>] [[-Authorization] <String>] [-Ssl] [[-ProxyServer] <String>] [[-ProxyCredential] <Object>] [<CommonParameters>]

**New-CouchDBReplication**

.. code-block:: powershell

    New-CouchDBReplication [[-Server] <String>] [[-Port] <Int32>] [[-Data] <Object>] [[-Authorization] <String>] [-Ssl] [[-ProxyServer] <String>] [[-ProxyCredential] <Object>] [<CommonParameters>]

**Get-CouchDBDatabaseChanges**

.. code-block:: powershell

    Get-CouchDBDatabaseChanges [-Server <String>] [-Port <Int32>] [-Database] <String> [-DocIds <Array>] [-Filter <String>] [-Continuous] [-IncludeDocs] [-Conflicts] [-Descending] [-Feed <String>] [-Heartbeat <Int32>] [-Attachments] [-AttachmentsEncoding] [-LastEventId <Int32>] [-Limit <Int32>] [-Since <Object>] [-Style <String>] [-Timeout <Int32>] [-View <String>] [-SeqInterval <Int32>] [-Authorization <Object>] [-Ssl] [-ProxyServer <String>] [-ProxyCredential <PSCredential>] [<CommonParameters>]

**Set-CouchDBReplication**

.. code-block:: powershell

    Set-CouchDBReplication [[-Server] <String>] [[-Port] <Int32>] [-Data] <Object> [[-Authorization] <String>] [-Ssl] [[-ProxyServer] <String>] [[-ProxyCredential] <Object>] [<CommonParameters>]

**Remove-CouchDBReplication**

.. code-block:: powershell

    Remove-CouchDBReplication [[-Server] <String>] [[-Port] <Int32>] [[-Database] <String>] [-Document] <String> [-Revision] <String> [[-Authorization] <String>] [-Force] [-Ssl] [[-ProxyServer] <String>] [[-ProxyCredential] <Object>] [-WhatIf] [-Confirm] [<CommonParameters>]

**Request-CouchDBReplication**

.. code-block:: powershell

    Request-CouchDBReplication [[-Server] <String>] [[-Port] <Int32>] [[-Data] <Object>] [-WinningRevisionOnly] [[-Authorization] <Object>] [-Ssl] [[-ProxyServer] <String>] [[-ProxyCredential] <PSCredential>] [<CommonParameters>]

Authentication
**************

**Set-CouchDBSession**

.. code-block:: powershell

    Set-CouchDBSession [[-Server] <String>] [[-Port] <Int32>] [-UserId] <String> [-Password] <SecureString> [-Ssl] [[-ProxyServer] <String>] [[-ProxyCredential] <Object>] [<CommonParameters>]

**Get-CouchDBSession**

.. code-block:: powershell

    Get-CouchDBSession [[-Server] <String>] [[-Port] <Int32>] [[-Authorization] <String>] [-Ssl] [[-ProxyServer] <String>] [[-ProxyCredential] <Object>] [<CommonParameters>]

**Remove-CouchDBSession**

.. code-block:: powershell

    Remove-CouchDBSession [[-Server] <String>] [[-Port] <Int32>] [[-Authorization] <String>] [-Ssl] [[-ProxyServer] <String>] [[-ProxyCredential] <Object>] [<CommonParameters>]

Databases
*********

**Connect-CouchDBDatabase**

.. code-block:: powershell

    Connect-CouchDBDatabase [[-Server] <String>] [[-Port] <Int32>] [-Database] <String> [[-Authorization] <Object>] [<CommonParameters>]

**Disconnect-CouchDBDatabase**

.. code-block:: powershell

    Disconnect-CouchDBDatabase

**Test-CouchDBDatabase**

.. code-block:: powershell

    Test-CouchDBDatabase [[-Server] <String>] [[-Port] <Int32>] [-Database] <String> [[-Authorization] <String>] [-Ssl] [[-ProxyServer] <String>] [[-ProxyCredential] <Object>] [<CommonParameters>]

**Copy-CouchDBDatabase**

.. code-block:: powershell

    Copy-CouchDBDatabase [[-Server] <String>] [[-RemoteServer] <String>] [[-Port] <Int32>] [[-RemotePort] <Int32>] [-Database] <String> [[-Destination] <String>] [[-ExcludeIds] <Array>] [[-Authorization] <String>] [[-RemoteAuthorization] <String>] [-Ssl] [[-ProxyServer] <String>] [[-ProxyCredential] <Object>] [-AsJob] [<CommonParameters>]

**Get-CouchDBDatabase**

.. code-block:: powershell

    Get-CouchDBDatabase [-Server <String>] [-Port <Int32>] [-Database <String>] [-Authorization <Object>] [-Ssl] [<CommonParameters>]
    
    Get-CouchDBDatabase [-Server <String>] [-Port <Int32>] [-Database <String>] [-AllDatabase] [-Descending] [-EndKey <String>] [-Limit <Int32>] [-Skip <Int32>] [-StartKey <String>] [-Authorization <Object>] [-Ssl] [[-ProxyServer] <String>] [[-ProxyCredential] <Object>] [<CommonParameters>]

**New-CouchDBDatabase**

.. code-block:: powershell

    New-CouchDBDatabase [[-Server] <String>] [[-Port] <Int32>] [-Database] <String> [[-Authorization] <String>] [-Ssl] [[-ProxyServer] <String>] [[-ProxyCredential] <Object>] [<CommonParameters>]

**Remove-CouchDBDatabase**

.. code-block:: powershell

    Remove-CouchDBDatabase [[-Server] <String>] [[-Port] <Int32>] [-Database] <String> [[-Authorization] <String>] [-Force] [-Ssl] [[-ProxyServer] <String>] [[-ProxyCredential] <Object>] [-WhatIf] [-Confirm] [<CommonParameters>]

**Get-CouchDBIndex**

.. code-block:: powershell

    Get-CouchDBIndex [[-Server] <String>] [[-Port] <Int32>] [-Database] <String> [[-Authorization] <String>] [-Ssl] [[-ProxyServer] <String>] [[-ProxyCredential] <Object>] [<CommonParameters>]

**New-CouchDBIndex**

.. code-block:: powershell

    New-CouchDBIndex [[-Server] <String>] [[-Port] <Int32>] [-Database] <String> [-Name] <String> [-Fields] <Array> [[-Authorization] <String>] [-Ssl] [[-ProxyServer] <String>] [[-ProxyCredential] <Object>] [<CommonParameters>]

**Remove-CouchDBIndex**

.. code-block:: powershell

    Remove-CouchDBIndex [[-Server] <String>] [[-Port] <Int32>] [-Database] <String> [-DesignDoc] <String> [-Name] <String> [[-Authorization] <String>] [-Force] [-Ssl] [[-ProxyServer] <String>] [[-ProxyCredential] <Object>] [-WhatIf] [-Confirm] [<CommonParameters>]

**Get-CouchDBDatabaseInfo**

.. code-block:: powershell

    Get-CouchDBDatabaseInfo [[-Server] <String>] [[-Port] <Int32>] [[-Keys] <Array>] [[-Authorization] <String>] [-Ssl] [[-ProxyServer] <String>] [[-ProxyCredential] <Object>] [<CommonParameters>]

**Get-CouchDBDatabaseShards**

.. code-block:: powershell

    Get-CouchDBDatabaseShards [[-Server] <String>] [[-Port] <Int32>] [-Database] <String> [[-Document] <String>] [[-Authorization] <String>] [-Ssl] [[-ProxyServer] <String>] [[-ProxyCredential] <Object>] [<CommonParameters>]

**Sync-CouchDBDatabaseShards**

.. code-block:: powershell

    Sync-CouchDBDatabaseShards [[-Server] <String>] [[-Port] <Int32>] [-Database] <String> [[-Authorization] <String>] [-Ssl] [[-ProxyServer] <String>] [[-ProxyCredential] <Object>] [<CommonParameters>]

**Compress-CouchDBDatabase**

.. code-block:: powershell

    Compress-CouchDBDatabase [[-Server] <String>] [[-Port] <Int32>] [-Database] <String> [[-Authorization] <String>] [-Ssl] [[-ProxyServer] <String>] [[-ProxyCredential] <Object>] [<CommonParameters>]

**Write-CouchDBFullCommit**

.. code-block:: powershell

    Write-CouchDBFullCommit [[-Server] <String>] [[-Port] <Int32>] [-Database] <String> [[-Authorization] <String>] [-Force] [-Ssl] [[-ProxyServer] <String>] [[-ProxyCredential] <Object>] [-WhatIf] [-Confirm] [<CommonParameters>]

**Clear-CouchDBView**

.. code-block:: powershell

    Clear-CouchDBView [[-Server] <String>] [[-Port] <Int32>] [-Database] <String> [[-Authorization] <String>] [-Ssl] [[-ProxyServer] <String>] [[-ProxyCredential] <Object>] [<CommonParameters>]

**Get-CouchDBDatabasePurgedLimit**

.. code-block:: powershell

    Get-CouchDBDatabasePurgedLimit [[-Server] <String>] [[-Port] <Int32>] [-Database] <String> [[-Authorization] <String>] [-Ssl] [[-ProxyServer] <String>] [[-ProxyCredential] <Object>] [<CommonParameters>]

**Set-CouchDBDatabasePurgedLimit**

.. code-block:: powershell

    Set-CouchDBDatabasePurgedLimit [[-Server] <String>] [[-Port] <Int32>] [-Database] <String> [-Limit] <Int32> [[-Authorization] <String>] [-Ssl] [[-ProxyServer] <String>] [[-ProxyCredential] <Object>] [<CommonParameters>]

**Get-CouchDBMissingRevision**

.. code-block:: powershell

    Get-CouchDBMissingRevision [[-Server] <String>] [[-Port] <Int32>] [-Database] <String> [-Document] <String> [-Revision] <Array> [[-Authorization] <String>] [-Ssl] [[-ProxyServer] <String>] [[-ProxyCredential] <Object>] [<CommonParameters>]

**Get-CouchDBRevisionDifference**

.. code-block:: powershell

    Get-CouchDBRevisionDifference [[-Server] <String>] [[-Port] <Int32>] [-Database] <String> [-Document] <String> [-Revision] <Array> [[-Authorization] <String>] [-Ssl] [[-ProxyServer] <String>] [[-ProxyCredential] <Object>] [<CommonParameters>]

**Get-CouchDBRevisionLimit**

.. code-block:: powershell

    Get-CouchDBRevisionLimit [[-Server] <String>] [[-Port] <Int32>] [-Database] <String> [[-Authorization] <String>] [-Ssl] [[-ProxyServer] <String>] [[-ProxyCredential] <Object>] [<CommonParameters>]

**Set-CouchDBRevisionLimit**

.. code-block:: powershell

    Set-CouchDBRevisionLimit [[-Server] <String>] [[-Port] <Int32>] [-Database] <String> [[-Limit] <Int32>] [[-Authorization] <String>] [-Ssl] [[-ProxyServer] <String>] [[-ProxyCredential] <Object>] [<CommonParameters>]

**Export-CouchDBDatabase**

.. code-block:: powershell

    Export-CouchDBDatabase [[-Server] <String>] [[-Port] <Int32>] [-Database] <String> [[-Path] <String>] [[-Authorization] <String>] [-Ssl] [[-ProxyServer] <String>] [[-ProxyCredential] <Object>] [-AsJob] [<CommonParameters>]

**Import-CouchDBDatabase**

.. code-block:: powershell

    Import-CouchDBDatabase [[-Server] <String>] [[-Port] <Int32>] [-Database] <String> [-Path] <String> [-RemoveRevision] [[-Authorization] <String>] [-Ssl] [[-ProxyServer] <String>] [[-ProxyCredential] <Object>] [-AsJob] [<CommonParameters>]

Documents
*********

**Get-CouchDBDocument**

.. code-block:: powershell

    Get-CouchDBDocument [-Server <String>] [-Port <Int32>] [-Database <String>] [-Document <String>] [-Partition <String>] [-Revision <String>] [-Local] [-Revisions] [-History] [-Attachments] [-AttachmentsInfo] [-AttachmentsSince <Array>] [-Conflicts] [-DeletedConflicts] [-Latest] [-LocalSequence] [-Metadata] [-OpenRevisions <Array>] [-Authorization <String>] [-Ssl] [[-ProxyServer] <String>] [[-ProxyCredential] <Object>] [-AsJob] [-Variable] [<CommonParameters>]

    Get-CouchDBDocument [-Server <String>] [-Port <Int32>] [-Database <String>] [-Document <String>] [-Partition <String>] [-Revision <String>] [-Info] [-Local] [-Authorization <String>] [-Ssl] [[-ProxyServer] <String>] [[-ProxyCredential] <Object>] [<CommonParameters>]

    Get-CouchDBDocument [-Server <String>] [-Port <Int32>] [-Database <String>] [-AllDocuments] [-Partition <String>] [-Local] [-Descending] [-EndKey <String>] [-EndKeyDocument <String>] [-Group] [-GroupLevel <Int32>] [-IncludeDocuments] [-InclusiveEnd <Boolean>] [-Key <Object>] [-Keys <Array>] [-Limit <Int32>] [-Reduce <Boolean>] [-Skip <Int32>] [-Sorted <Boolean>] [-Stable] [-Stale <String>] [-StartKey <String>] [-StartKeyDocument <String>] [-Update <String>] [-UpdateSequence] [-Authorization <String>] [-Ssl] [[-ProxyServer] <String>] [[-ProxyCredential] <Object>] [-AsJob] [<CommonParameters>]

**New-CouchDBDocument**

.. code-block:: powershell

    New-CouchDBDocument [[-Server] <String>] [[-Port] <Int32>] [-Database] <String> [-Document] <String> [[-Partition] <String>] [-Data] <Object> [[-Attachment] <String>] [-BatchMode] [[-Authorization] <String>] [-Ssl] [[-ProxyServer] <String>] [[-ProxyCredential] <Object>] [<CommonParameters>]

**Set-CouchDBDocument**

.. code-block:: powershell

    Set-CouchDBDocument [[-Server] <String>] [[-Port] <Int32>] [-Database] <String> [-Document] <String> [-Revision] <String> [[-Data] <Object>] [[-Partition] <String>] [-Replace] [[-Attachment] <String>] [-BatchMode] [-NoConflict] [[-Authorization] <Object>] [-Ssl] [[-ProxyServer] <String>] [[-ProxyCredential] <PSCredential>] [<CommonParameters>]

**Remove-CouchDBDocument**

.. code-block:: powershell

    Remove-CouchDBDocument [[-Server] <String>] [[-Port] <Int32>] [-Database] <String> [-Document] <String> [-Revision] <String> [[-Authorization] <String>] [-Force] [-Ssl] [[-ProxyServer] <String>] [[-ProxyCredential] <Object>] [-WhatIf] [-Confirm] [<CommonParameters>]

**Copy-CouchDBDocument**

.. code-block:: powershell

    Copy-CouchDBDocument [[-Server] <String>] [[-Port] <Int32>] [-Database] <String> [-Document] <String> [-Destination] <String> [[-Revision] <String>] [[-Authorization] <String>] [-Ssl] [[-ProxyServer] <String>] [[-ProxyCredential] <Object>] [<CommonParameters>]

**Get-CouchDBBulkDocument**

.. code-block:: powershell

    Get-CouchDBBulkDocument [[-Server] <String>] [[-Port] <Int32>] [-Database] <String> [[-Data] <Object>] [[-Authorization] <String>] [-Ssl] [[-ProxyServer] <String>] [[-ProxyCredential] <Object>] [-AsJob] [<CommonParameters>]
    
**New-CouchDBBulkDocument**

.. code-block:: powershell

    New-CouchDBBulkDocument [[-Server] <String>] [[-Port] <Int32>] [-Database] <String> [[-Data] <Object>] [[-Authorization] <String>] [-Ssl] [[-ProxyServer] <String>] [[-ProxyCredential] <Object>] [-AsJob] [<CommonParameters>]

**Get-CouchDBAttachment**

.. code-block:: powershell

    Get-CouchDBAttachment [-Server <String>] [-Port <Int32>] [-Database <String>] [-Document <String>] [-Revision <String>] [-Attachment <String>] [-OutFile <String>] [-Variable <String>] [-Authorization <String>] [-Ssl] [[-ProxyServer] <String>] [[-ProxyCredential] <Object>] [<CommonParameters>]

    Get-CouchDBAttachment [-Server <String>] [-Port <Int32>] [-Database <String>] [-Document <String>] [-Revision <String>] [-Info] [-Attachment <String>] [-Authorization <String>] [-Ssl] [[-ProxyServer] <String>] [[-ProxyCredential] <Object>] [<CommonParameters>]

**Add-CouchDBAttachment**

.. code-block:: powershell

    Add-CouchDBAttachment [[-Server] <String>] [[-Port] <Int32>] [-Database] <String> [-Document] <String> [-Attachment] <Object> [-Revision] <String> [[-Authorization] <String>] [-Ssl] [[-ProxyServer] <String>] [[-ProxyCredential] <Object>] [<CommonParameters>]

**Remove-CouchDBAttachment**

.. code-block:: powershell

    Remove-CouchDBAttachment [[-Server] <String>] [[-Port] <Int32>] [-Database] <String> [-Document] <String> [-Attachment] <String> [-Revision] <String> [[-Authorization] <String>] [-Ssl] [[-ProxyServer] <String>] [[-ProxyCredential] <Object>] [-WhatIf] [-Confirm] [<CommonParameters>]

**Clear-CouchDBDocuments**

.. code-block:: powershell

    Clear-CouchDBDocuments [[-Server] <String>] [[-Port] <Int32>] [-Database] <String> [-Document] <Array> [[-Authorization] <String>] [-Force] [-Ssl] [[-ProxyServer] <String>] [[-ProxyCredential] <Object>] [-WhatIf] [-Confirm] [<CommonParameters>]

**Search-CouchDBFullText**

.. code-block:: powershell

    Search-CouchDBFullText [[-Server] <String>] [[-Port] <Int32>] [-Database] <String> [-Patterns] <Array> [-UseQueries] [[-Authorization] <String>] [-Ssl] [[-ProxyServer] <String>] [[-ProxyCredential] <Object>] [-AsJob] [<CommonParameters>]
    
**Find-CouchDBDocuments**

.. code-block:: powershell

    Find-CouchDBDocuments [-Server <String>] [-Port <Int32>] [-Database <String>] [-Partition <String>] [-Explain] [-Selector <String>] [-Value <Object>] [-Limit <Int32>] [-Skip <Int32>] [-Fields <Array>] [-Sort <Array>] [-UseIndex <Array>] [-ReadQuorum <Int32>] [-Bookmark <String>] [-NoUpdate] [-Stable] [-Stale <String>] [-ExecutionStats] [-Operator <String>] [-Authorization <String>] [-Ssl] [[-ProxyServer] <String>] [[-ProxyCredential] <Object>] [-AsJob] [<CommonParameters>]

    Find-CouchDBDocuments [-Server <String>] [-Port <Int32>] [-Database <String>] [-Partition <String>] [-Explain] [-Find <String>] [-Authorization <String>] [-Ssl] [[-ProxyServer] <String>] [[-ProxyCredential] <Object>] [-AsJob] [<CommonParameters>]

Design documents
****************

**Get-CouchDBDatabaseDesignDocument**

.. code-block:: powershell

    Get-CouchDBDatabaseDesignDocument [[-Server] <String>] [[-Port] <Int32>] [-Database] <String> [-Descending] [[-EndKey] <String>] [[-EndKeyDocument] <String>] [-IncludeDocument] [[-InclusiveEnd] <Boolean>] [[-Key] <String>] [[-Keys] <Array>] [-Conflict] [[-Limit] <Int32>] [[-Skip] <Int32>] [[-StartKey] <String>] [[-StartKeyDocument] <String>] [-UpdateSequence] [[-Authorization] <String>] [-Ssl] [[-ProxyServer] <String>] [[-ProxyCredential] <Object>] [<CommonParameters>]

**Get-CouchDBDesignDocument**

.. code-block:: powershell

    Get-CouchDBDesignDocument [[-Server] <String>] [[-Port] <Int32>] [-Database] <String> [-Document] <String> [-Info] [[-Authorization] <String>] [-Ssl] [[-ProxyServer] <String>] [[-ProxyCredential] <Object>] [[-Variable] <String>] [<CommonParameters>]

**Get-CouchDBDesignDocumentAttachment**

.. code-block:: powershell

    Get-CouchDBDesignDocumentAttachment [-Server <String>] [-Port <Int32>] [-Database <String>] [-Document <String>] [-Revision <String>] [-Attachment <String>] [-OutFile <String>] [-Authorization <String>] [-Ssl] [[-ProxyServer] <String>] [[-ProxyCredential] <Object>] [-Variable <String>] [<CommonParameters>]

    Get-CouchDBDesignDocumentAttachment [-Server <String>] [-Port <Int32>] [-Database <String>] [-Document <String>] [-Revision <String>] [-Info] [-Attachment <String>] [-Authorization <String>] [-Ssl] [[-ProxyServer] <String>] [[-ProxyCredential] <Object>] [<CommonParameters>]

**Add-CouchDBDesignDocumentAttachment**

.. code-block:: powershell

    Add-CouchDBDesignDocumentAttachment [[-Server] <String>] [[-Port] <Int32>] [-Database] <String> [-Document] <String> [-Attachment] <Object> [-Revision] <String> [[-Authorization] <String>] [-Ssl] [[-ProxyServer] <String>] [[-ProxyCredential] <Object>] [<CommonParameters>]

**New-CouchDBDesignDocument**

.. code-block:: powershell

    New-CouchDBDesignDocument [-Server <String>] [-Port <Int32>] [-Database <String>] [-Document <String>] [-ViewName <String>] [-ViewMapFunction <String>] [-ViewReduceFunction <String>] [-ValidationFunction <String>] [-Authorization <String>] [-Ssl] [[-ProxyServer] <String>] [[-ProxyCredential] <Object>] [<CommonParameters>]

    New-CouchDBDesignDocument [-Server <String>] [-Port <Int32>] [-Database <String>] [-Document <String>] [-Data <Object>] [-Authorization <String>] [-Ssl] [[-ProxyServer] <String>] [[-ProxyCredential] <Object>] [<CommonParameters>]

**Set-CouchDBDesignDocument**

.. code-block:: powershell

    Set-CouchDBDesignDocument [-Server <String>] [-Port <Int32>] [-Database <String>] [-Document <String>] [-Revision <String>] [-ViewName <String>] [-ViewMapFunction <String>] [-ViewReduceFunction <String>] [-ValidationFunction <String>] [-Authorization <String>] [-Ssl] [[-ProxyServer] <String>] [[-ProxyCredential] <Object>] [<CommonParameters>]

    Set-CouchDBDesignDocument [-Server <String>] [-Port <Int32>] [-Database <String>] [-Document <String>] [-Revision <String>] [-Data <Object>] [-Authorization <String>] [-Ssl] [[-ProxyServer] <String>] [[-ProxyCredential] <Object>] [<CommonParameters>]

**Compress-CouchDBDesignDocument**

.. code-block:: powershell

    Compress-CouchDBDesignDocument [[-Server] <String>] [[-Port] <Int32>] [-Database] <String> [-DesignDoc] <String> [[-Authorization] <String>] [-Ssl] [[-ProxyServer] <String>] [[-ProxyCredential] <Object>] [<CommonParameters>]

**Remove-CouchDBDesignDocument**

.. code-block:: powershell

    Remove-CouchDBDesignDocument [[-Server] <String>] [[-Port] <Int32>] [-Database] <String> [-Document] <String> [-Revision] <String> [[-Authorization] <String>] [-Force] [-Ssl] [[-ProxyServer] <String>] [[-ProxyCredential] <Object>] [-WhatIf] [-Confirm] [<CommonParameters>]

**Remove-CouchDBDesignDocumentAttachment**

.. code-block:: powershell

    Remove-CouchDBDesignDocumentAttachment [[-Server] <String>] [[-Port] <Int32>] [-Database] <String> [-Document] <String> [-Attachment] <String> [-Revision] <String> [[-Authorization] <String>] [-Ssl] [[-ProxyServer] <String>] [[-ProxyCredential] <Object>] [-WhatIf] [-Confirm] [<CommonParameters>]

**Find-CouchDBDesignDocument**

.. code-block:: powershell

    Find-CouchDBDesignDocument [-Server <String>] [-Port <Int32>] [-Database] <String> [-Document] <String> [-Index] <String> [-Bookmark <String>] [-Counts <Array>] [-GroupField <Hashtable>] [-GroupSort <Hashtable>] [-IncludeDocs] [-IncludeFields] [-Limit <Int32>] [-Sort <String>] [-Authorization <Object>] [-Ssl] [-Variable <String>] [-ProxyServer <String>] [-ProxyCredential <PSCredential>] [<CommonParameters>]


Aliases
_______

.. code-block:: powershell

acatt -> Add-CouchDBAttachment                 
acnode -> Add-CouchDBNode                      
adatt -> Add-CouchDBDesignDocumentAttachment   
ccdb -> Compress-CouchDBDatabase               
ccdd -> Compress-CouchDBDesignDocument         
ccdoc -> Clear-CouchDBDocuments                
ccview -> Clear-CouchDBView                    
cdblog -> Clear-CouchDBLog                     
cdbmaint -> Set-CouchDBMaintenanceMode         
cdsa -> Search-CouchDBAnalyze                  
condb -> Connect-CouchDBDatabase               
cpdb -> Copy-CouchDBDatabase                   
cpdoc -> Copy-CouchDBDocument                  
creq -> Send-CouchDBRequest                    
disdb -> Disconnect-CouchDBDatabase            
eccl -> Enable-CouchDBCluster                  
ecdb -> Export-CouchDBDatabase                 
exportdb -> Export-CouchDBDatabase             
fcdoc -> Find-CouchDBDocuments                 
finddoc -> Find-CouchDBDocuments               
gcadm -> Get-CouchDBAdmin                      
gcatt -> Get-CouchDBAttachment                 
gcbdoc -> Get-CouchDBBulkDocument              
gcbpl -> Get-CouchDBDatabasePurgedLimit        
gcconf -> Get-CouchDBConfiguration             
gccs -> Get-CouchDBClusterSetup                
gcdatt -> Get-CouchDBDesignDocumentAttachment  
gcdb -> Get-CouchDBDatabase                    
gcdbc -> Get-CouchDBDatabaseChanges            
gcdbp -> Grant-CouchDBDatabasePermission       
gcdbrs -> Get-CouchDBReshards                  
gcdbs -> Get-CouchDBDatabaseSecurity           
gcdbsh -> Get-CouchDBDatabaseShards            
gcdbu -> Get-CouchDBDatabaseUpdates            
gcddd -> Get-CouchDBDatabaseDesignDocument     
gcddoc -> Get-CouchDBDesignDocument            
gcdoc -> Get-CouchDBDocument                   
gcidx -> Get-CouchDBIndex                      
gcmr -> Get-CouchDBMissingRevision             
gcnode -> Get-CouchDBNode                      
gcrd -> Get-CouchDBRevisionDifference          
gcrl -> Get-CouchDBRevisionLimit               
gcrpdoc -> Get-CouchDBReplicationDocument      
gcrpl -> Get-CouchDBReplication                
gcrpls -> Get-CouchDBReplicationScheduler      
gcsi -> Get-CouchDBServer                      
gcss -> Get-CouchDBSession                     
gctsk -> Get-CouchDBActiveTask                 
gcusr -> Get-CouchDBUser                       
helpc -> Search-CouchDBHelp                    
icdb -> Import-CouchDBDatabase                 
importdb -> Import-CouchDBDatabase             
mcsts -> Measure-CouchDBStatistics             
mkadmin -> New-CouchDBAdmin                    
mkdb -> New-CouchDBDatabase                    
mkdoc -> New-CouchDBDocument                   
mkuser -> New-CouchDBUser                      
ncadm -> New-CouchDBAdmin                      
ncbd -> New-CouchDBBulkDocument                
ncdb -> New-CouchDBDatabase                    
ncddoc -> New-CouchDBDesignDocument            
ncdoc -> New-CouchDBDocument                   
ncidx -> New-CouchDBIndex                      
ncrpl -> New-CouchDBReplication                
ncusr -> New-CouchDBUser                       
ncuuid -> New-CouchDBUuids                     
newcdb -> New-CouchDBObject                    
rcadm -> Remove-CouchDBAdmin                   
rcatt -> Remove-CouchDBAttachment              
rcdb -> Remove-CouchDBDatabase                 
rcdbp -> Revoke-CouchDBDatabasePermission      
rcdbr -> Request-CouchDBReplication            
rcdbrs -> Remove-CouchDBReshards               
rcddoc -> Remove-CouchDBDesignDocument         
rcdoc -> Remove-CouchDBDocument                
rcidx -> Remove-CouchDBIndex                   
rcnode -> Remove-CouchDBNode                   
rcrpl -> Remove-CouchDBReplication             
rcs -> Remove-CouchDBSession                   
rcsrv -> Restart-CouchDBServer                 
rcusr -> Remove-CouchDBUser                    
rdatt -> Remove-CouchDBDesignDocumentAttachment
rdblog -> Read-CouchDBLog                      
rmadmin -> Remove-CouchDBAdmin                 
rmdb -> Remove-CouchDBDatabase                 
rmdoc -> Remove-CouchDBDocument                
rmuser -> Remove-CouchDBUser                   
rps -> Remove-CouchDBProxy                     
scadm -> Set-CouchDBAdmin                      
scconf -> Set-CouchDBConfiguration             
scdbpl -> Set-CouchDBDatabasePurgedLimit       
scdbrs -> Set-CouchDBReshards                  
scddoc -> Set-CouchDBDesignDocument            
scdoc -> Set-CouchDBDocument                   
scds -> Sync-CouchDBDatabaseShards             
scft -> Search-CouchDBFullText                 
scrl -> Set-CouchDBRevisionLimit               
scrpl -> Set-CouchDBReplication                
scs -> Set-CouchDBSession                      
scusr -> Set-CouchDBUser                       
sps -> Set-CouchDBProxy                        
src -> Search-CouchDBHelp                      
subconf -> Submit-CouchDBConfiguration         
tcdb -> Test-CouchDBDatabase                   
wcfc -> Write-CouchDBFullCommit   
             