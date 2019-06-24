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

Configuration
*************

**Enable-CouchDBCluster**

.. code-block:: powershell

    Enable-CouchDBCluster [[-Server] <String>] [[-Port] <Int32>] [[-NodeCount] <Int32>] [-SingleNode] [[-Authorization] <String>] [-Ssl] [<CommonParameters>]

**Get-CouchDBNode**

.. code-block:: powershell

    Get-CouchDBNode [[-Server] <String>] [[-Port] <Int32>] [[-Database] <String>] [[-Authorization] <String>] [-Ssl] [<CommonParameters>]

**Add-CouchDBNode**

.. code-block:: powershell

    Add-CouchDBNode [[-Server] <String>] [[-Port] <Int32>] [[-BindPort] <Int32>] [-BindAddress] <String> [[-Authorization] <String>] [-Ssl] [<CommonParameters>]

**Remove-CouchDBNode**

.. code-block:: powershell

    Remove-CouchDBNode [[-Server] <String>] [[-Port] <Int32>] [[-Database] <String>] [-Node] <String> [[-Authorization] <String>] [-Force] [-Ssl] [-WhatIf] [-Confirm] [<CommonParameters>]

**Get-CouchDBConfiguration**

.. code-block:: powershell

    Get-CouchDBConfiguration [[-Server] <String>] [[-Port] <Int32>] [[-Database] <String>] [[-Node] <String>] [[-Authorization] <String>] [-Ssl] [<CommonParameters>]

**Set-CouchDBConfiguration**

.. code-block:: powershell

    Set-CouchDBConfiguration [[-Server] <String>] [[-Port] <Int32>] [[-Database] <String>] [[-Node] <String>] [-Element] <String> [-Key] <String> [-Value] <String> [[-Authorization] <String>] [-Ssl] [<CommonParameters>]

Permission
**********

**New-CouchDBAdmin**

.. code-block:: powershell

    New-CouchDBAdmin [[-Server] <String>] [[-Port] <Int32>] [[-Database] <String>] [[-Node] <String>] [-Userid] <String> [-Password] <SecureString> [[-Authorization] <String>] [-Ssl] [<CommonParameters>] 

**New-CouchDBUser**

.. code-block:: powershell

    New-CouchDBUser [[-Server] <String>] [[-Port] <Int32>] [[-Database] <String>] [-Userid] <String> [-Password] <SecureString> [[-Roles] <Array>] [[-Authorization] <String>] [-Ssl] [<CommonParameters>]

**Grant-CouchDBDatabasePermission**

.. code-block:: powershell

    Grant-CouchDBDatabasePermission [[-Server] <String>] [[-Port] <Int32>] [-Database] <String> [[-AdminUser] <Array>] [[-AdminRoles] <Array>] [[-ReaderUser] <Array>] [[-UserRoles] <Array>] [[-Authorization] <String>] [-Ssl] [<CommonParameters>]

**Get-CouchDBDatabaseSecurity**

.. code-block:: powershell

    Get-CouchDBDatabaseSecurity [[-Server] <String>] [[-Port] <Int32>] [-Database] <String> [[-Authorization] <String>] [-Ssl] [<CommonParameters>]

**Revoke-CouchDBDatabasePermission**

.. code-block:: powershell

    Revoke-CouchDBDatabasePermission [[-Server] <String>] [[-Port] <Int32>] [-Database] <String> [[-Authorization] <String>] [-Force] [-Ssl] [-WhatIf] [-Confirm] [<CommonParameters>]

**Remove-CouchDBAdmin**

.. code-block:: powershell

    Remove-CouchDBAdmin [[-Server] <String>] [[-Port] <Int32>] [[-Database] <String>] [[-Node] <String>] [-Userid] <String> [[-Authorization] <String>] [-Force] [-Ssl] [-WhatIf] [-Confirm] [<CommonParameters>]

**Remove-CouchDBUser**

.. code-block:: powershell

    Remove-CouchDBUser [[-Server] <String>] [[-Port] <Int32>] [[-Database] <String>] [-Userid] <String> [-Revision] <String> [[-Authorization] <String>] [-Force] [-Ssl] [-WhatIf] [-Confirm] [<CommonParameters>]

**Set-CouchDBUser**

.. code-block:: powershell

    Set-CouchDBUser [[-Server] <String>] [[-Port] <Int32>] [[-Database] <String>] [-Userid] <String> [-Password] <SecureString> [[-Roles] <Array>] [-Revision] <String> [[-Authorization] <String>] [-Ssl] [<CommonParameters>]

**Set-CouchDBAdmin**

.. code-block:: powershell

    Set-CouchDBAdmin [[-Server] <String>] [[-Port] <Int32>] [[-Database] <String>] [[-Node] <String>] [-Userid] <String> [-Password] <SecureString> [[-Authorization] <String>] [-Ssl] [<CommonParameters>]

Server
******

**Get-CouchDBServer**

.. code-block:: powershell

    Get-CouchDBServer [[-Server] <String>] [[-Port] <Int32>] [[-Authorization] <String>] [-Status] [-Ssl] [<CommonParameters>]

**Get-CouchDBActiveTask**

.. code-block:: powershell

    Get-CouchDBActiveTask [[-Server] <String>] [[-Port] <Int32>] [[-Authorization] <String>] [-Ssl] [<CommonParameters>]

**Get-CouchDBClusterSetup**

.. code-block:: powershell

    Get-CouchDBClusterSetup [[-Server] <String>] [[-Port] <Int32>] [[-Authorization] <String>] [-Ssl] [<CommonParameters>]

**Get-CouchDBDatabaseUpdates**

.. code-block:: powershell

    Get-CouchDBDatabaseUpdates [[-Server] <String>] [[-Port] <Int32>] [[-Authorization] <String>] [-Ssl] [<CommonParameters>]

**Measure-CouchDBStatistics**

.. code-block:: powershell

    Measure-CouchDBStatistics [[-Server] <String>] [[-Port] <Int32>] [-System] [[-Authorization] <String>] [-Ssl] [<CommonParameters>]

**Restart-CouchDBServer**

.. code-block:: powershell

    Restart-CouchDBServer [-Force] [-WhatIf] [-Confirm] [<CommonParameters>]

**New-CouchDBUuids**

.. code-block:: powershell

    New-CouchDBUuids [[-Server] <String>] [[-Port] <Int32>] [[-Count] <Int32>] [[-Authorization] <String>] [-Ssl] [<CommonParameters>]

Replication
***********

**Get-CouchDBReplication**

.. code-block:: powershell

    Get-CouchDBReplication [[-Server] <String>] [[-Port] <Int32>] [[-Database] <String>] [[-Document] <String>] [[-Authorization] <String>] [-Ssl] [<CommonParameters>]

**Get-CouchDBReplicationScheduler**

.. code-block:: powershell

    Get-CouchDBReplicationScheduler [[-Server] <String>] [[-Port] <Int32>] [[-Authorization] <String>] [-Ssl] [<CommonParameters>]

**Get-CouchDBReplicationDocument**

.. code-block:: powershell

    Get-CouchDBReplicationDocument [[-Server] <String>] [[-Port] <Int32>] [-Replicator] [[-Authorization] <String>] [-Ssl] [<CommonParameters>]

**New-CouchDBReplication**

.. code-block:: powershell

    New-CouchDBReplication [[-SourceServer] <String>] [[-TargetServer] <String>] [[-SourcePort] <Int32>] [[-TargetPort] <Int32>] [[-Database] <String>] [[-SourceDatabase] <String>] [[-TargetDatabase] <String>] [-Continuous] [[-Authorization] <String>] [-Ssl] [<CommonParameters>]

**Get-CouchDBDatabaseChanges**

.. code-block:: powershell

    Get-CouchDBDatabaseChanges [[-Server] <String>] [[-Port] <Int32>] [-Database] <String> [[-Filter] <Array>] [-Continuous] [[-Authorization] <String>] [-Ssl] [<CommonParameters>]

**Set-CouchDBReplication**

.. code-block:: powershell

    Set-CouchDBReplication [[-Server] <String>] [[-Port] <Int32>] [[-Database] <String>] [-Document] <String> [-Revision] <String> [-Continuous] [[-Authorization] <String>] [-Ssl] [<CommonParameters>]

**Remove-CouchDBReplication**

.. code-block:: powershell

    Remove-CouchDBReplication [[-Server] <String>] [[-Port] <Int32>] [[-Database] <String>] [-Document] <String> [-Revision] <String> [[-Authorization] <String>] [-Force] [-Ssl] [-WhatIf] [-Confirm] [<CommonParameters>]

**Request-CouchDBReplication**

.. code-block:: powershell

    Request-CouchDBReplication [[-SourceServer] <String>] [[-TargetServer] <String>] [[-SourcePort] <Int32>] [[-TargetPort] <Int32>] [-SourceDatabase] <String> [-TargetDatabase] <String> [[-Proxy] <String>] [[-Documents] <Array>] [[-Filter] <String>] [-Continuous] [-Cancel] [-CreateTargetDatabase] [[-Authorization] <String>] [-Ssl] [<CommonParameters>]

Authentication
**************

**Set-CouchDBSession**

.. code-block:: powershell

    Set-CouchDBSession [[-Server] <String>] [[-Port] <Int32>] [-UserId] <String> [-Password] <SecureString> [-Ssl] [<CommonParameters>]

**Get-CouchDBSession**

.. code-block:: powershell

    Get-CouchDBSession [[-Server] <String>] [[-Port] <Int32>] [[-Authorization] <String>] [-Ssl] [<CommonParameters>]

**Remove-CouchDBSession**

.. code-block:: powershell

    Remove-CouchDBSession [[-Server] <String>] [[-Port] <Int32>] [[-Authorization] <String>] [-Ssl] [<CommonParameters>]

Databases
*********

**Test-CouchDBDatabase**

.. code-block:: powershell

    Test-CouchDBDatabase [[-Server] <String>] [[-Port] <Int32>] [-Database] <String> [[-Authorization] <String>] [-Ssl] [<CommonParameters>]

**Get-CouchDBDatabase**

.. code-block:: powershell

    Get-CouchDBDatabase [[-Server] <String>] [[-Port] <Int32>] [[-Database] <String>] [[-Authorization] <String>] [-Ssl] [<CommonParameters>]

**New-CouchDBDatabase**

.. code-block:: powershell

    New-CouchDBDatabase [[-Server] <String>] [[-Port] <Int32>] [-Database] <String> [[-Authorization] <String>] [-Ssl] [<CommonParameters>]

**Remove-CouchDBDatabase**

.. code-block:: powershell

    Remove-CouchDBDatabase [[-Server] <String>] [[-Port] <Int32>] [-Database] <String> [[-Authorization] <String>] [-Force] [-Ssl] [-WhatIf] [-Confirm] [<CommonParameters>]

**Get-CouchDBIndex**

.. code-block:: powershell

    Get-CouchDBIndex [[-Server] <String>] [[-Port] <Int32>] [-Database] <String> [[-Authorization] <String>] [-Ssl] [<CommonParameters>]

**New-CouchDBIndex**

.. code-block:: powershell

    New-CouchDBIndex [[-Server] <String>] [[-Port] <Int32>] [-Database] <String> [-Name] <String> [-Fields] <Array> [[-Authorization] <String>] [-Ssl] [<CommonParameters>]

**Remove-CouchDBIndex**

.. code-block:: powershell

    Remove-CouchDBIndex [[-Server] <String>] [[-Port] <Int32>] [-Database] <String> [-DesignDoc] <String> [-Name] <String> [[-Authorization] <String>] [-Force] [-Ssl] [-WhatIf] [-Confirm] [<CommonParameters>]

**Get-CouchDBDatabaseInfo**

.. code-block:: powershell

    Get-CouchDBDatabaseInfo [[-Server] <String>] [[-Port] <Int32>] [[-Keys] <Array>] [[-Authorization] <String>] [-Ssl] [<CommonParameters>]

**Get-CouchDBDatabaseShards**

.. code-block:: powershell

    Get-CouchDBDatabaseShards [[-Server] <String>] [[-Port] <Int32>] [-Database] <String> [[-Authorization] <String>] [-Ssl] [<CommonParameters>]

**Sync-CouchDBDatabaseShards**

.. code-block:: powershell

    Sync-CouchDBDatabaseShards [[-Server] <String>] [[-Port] <Int32>] [-Database] <String> [[-Authorization] <String>] [-Ssl] [<CommonParameters>]

**Compress-CouchDBDatabase**

.. code-block:: powershell

    Compress-CouchDBDatabase [[-Server] <String>] [[-Port] <Int32>] [-Database] <String> [[-Authorization] <String>] [-Ssl] [<CommonParameters>]

**Write-CouchDBFullCommit**

.. code-block:: powershell

    Write-CouchDBFullCommit [[-Server] <String>] [[-Port] <Int32>] [-Database] <String> [[-Authorization] <String>] [-Force] [-Ssl] [-WhatIf] [-Confirm] [<CommonParameters>]

**Clear-CouchDBView**

.. code-block:: powershell

    Clear-CouchDBView [[-Server] <String>] [[-Port] <Int32>] [-Database] <String> [[-Authorization] <String>] [-Ssl] [<CommonParameters>]

**Get-CouchDBDatabasePurgedLimit**

.. code-block:: powershell

    Get-CouchDBDatabasePurgedLimit [[-Server] <String>] [[-Port] <Int32>] [-Database] <String> [[-Authorization] <String>] [-Ssl] [<CommonParameters>]

**Set-CouchDBDatabasePurgedLimit**

.. code-block:: powershell

    Set-CouchDBDatabasePurgedLimit [[-Server] <String>] [[-Port] <Int32>] [-Database] <String> [-Limit] <Int32> [[-Authorization] <String>] [-Ssl] [<CommonParameters>]

**Get-CouchDBMissingRevision**

.. code-block:: powershell

    Get-CouchDBMissingRevision [[-Server] <String>] [[-Port] <Int32>] [-Database] <String> [-Document] <String> [-Revision] <Array> [[-Authorization] <String>] [-Ssl] [<CommonParameters>]

**Get-CouchDBRevisionDifference**

.. code-block:: powershell

    Get-CouchDBRevisionDifference [[-Server] <String>] [[-Port] <Int32>] [-Database] <String> [-Document] <String> [-Revision] <Array> [[-Authorization] <String>] [-Ssl] [<CommonParameters>]

**Get-CouchDBRevisionLimit**

.. code-block:: powershell

    Get-CouchDBRevisionLimit [[-Server] <String>] [[-Port] <Int32>] [-Database] <String> [[-Authorization] <String>] [-Ssl] [<CommonParameters>]

**Set-CouchDBRevisionLimit**

.. code-block:: powershell

    Set-CouchDBRevisionLimit [[-Server] <String>] [[-Port] <Int32>] [-Database] <String> [[-Limit] <Int32>] [[-Authorization] <String>] [-Ssl] [<CommonParameters>]

**Export-CouchDBDatabase**

.. code-block:: powershell

    Export-CouchDBDatabase [[-Server] <String>] [[-Port] <Int32>] [-Database] <String> [[-Path] <String>] [[-Authorization] <String>] [-Ssl] [<CommonParameters>]

Documents
*********

**Get-CouchDBDocument**

.. code-block:: powershell

    Get-CouchDBDocument [[-Server] <String>] [[-Port] <Int32>] [-Database] <String> [[-Document] <String>] [[-Revision] <String>] [-Local] [-Revisions] [-History] [-Attachments] [-AttachmentsInfo] [[-AttachmentsSince] <Array>] [-Conflicts] [-DeletedConflicts] [-Latest] [-LocalSequence] [-Metadata] [[-OpenRevisions] <Array>] [[-Authorization] <String>] [-Ssl] [<CommonParameters>]

**New-CouchDBDocument**

.. code-block:: powershell

    New-CouchDBDocument [[-Server] <String>] [[-Port] <Int32>] [-Database] <String> [-Document] <String> [-Data] <Object> [-BatchMode] [[-Authorization] <String>] [-Ssl] [<CommonParameters>]

**Set-CouchDBDocument**

.. code-block:: powershell

    Set-CouchDBDocument [[-Server] <String>] [[-Port] <Int32>] [-Database] <String> [-Document] <String> [-Revision] <String> [[-Data] <Object>] [-Replace] [-BatchMode] [-NoConflict] [[-Authorization] <String>] [-Ssl] [<CommonParameters>]

**Remove-CouchDBDocument**

.. code-block:: powershell

    Remove-CouchDBDocument [[-Server] <String>] [[-Port] <Int32>] [-Database] <String> [-Document] <String> [-Revision] <String> [[-Authorization] <String>] [-Force] [-Ssl] [-WhatIf] [-Confirm] [<CommonParameters>]

**Copy-CouchDBDocument**

.. code-block:: powershell

    Copy-CouchDBDocument [[-Server] <String>] [[-Port] <Int32>] [-Database] <String> [-Document] <String> [-Destination] <String> [[-Revision] <String>] [[-Authorization] <String>] [-Ssl] [<CommonParameters>]

**Get-CouchDBBulkDocument**

.. code-block:: powershell

    Get-CouchDBBulkDocument [[-Server] <String>] [[-Port] <Int32>] [-Database] <String> [-Document] <Array> [[-Authorization] <String>] [-Ssl] [<CommonParameters>]
    
**Set-CouchDBBulkDocument**

.. code-block:: powershell

    Set-CouchDBBulkDocument [[-Server] <String>] [[-Port] <Int32>] [-Database] <String> [-Document] <Array> [[-Revision] <Array>] [-IsDeleted] [[-Authorization] <String>] [-Ssl] [<CommonParameters>]

**Get-CouchDBAttachment**

.. code-block:: powershell

    Get-CouchDBAttachment [-Server <String>] [-Port <Int32>] [-Database <String>] [-Document <String>] [-Revision<String>] [-Attachment <String>] [-OutFile <String>] [-Authorization <String>] [-Ssl] [<CommonParameters>]

    Get-CouchDBAttachment [-Server <String>] [-Port <Int32>] [-Database <String>] [-Document <String>] [-Revision<String>] [-Info] [-Attachment <String>] [-OutFile <String>] [-Authorization <String>] [-Ssl] [<CommonParameters>]

**New-CouchDBAttachment**

.. code-block:: powershell

    New-CouchDBAttachment [[-Server] <String>] [[-Port] <Int32>] [-Database] <String> [-Document] <String> [-Attachment] <String> [-Revision] <String> [[-Authorization] <String>] [-Ssl] [<CommonParameters>]

**Set-CouchDBAttachment**

.. code-block:: powershell

    Set-CouchDBAttachment [[-Server] <String>] [[-Port] <Int32>] [-Database] <String> [-Document] <String> [-Revision] <String> [[-Attachment] <String>] [[-Authorization] <String>] [-Ssl] [<CommonParameters>]

**Remove-CouchDBAttachment**

.. code-block:: powershell

    Remove-CouchDBAttachment [[-Server] <String>] [[-Port] <Int32>] [-Database] <String> [-Document] <String> [-Attachment] <String> [-Revision] <String> [[-Authorization] <String>] [-Ssl] [-WhatIf] [-Confirm] [<CommonParameters>]

**Clear-CouchDBDocuments**

.. code-block:: powershell

    Clear-CouchDBDocuments [[-Server] <String>] [[-Port] <Int32>] [-Database] <String> [-Document] <String> [[-Authorization] <String>] [-Force] [-Ssl] [-WhatIf] [-Confirm] [<CommonParameters>]

**Search-CouchDBFullText**

.. code-block:: powershell

    Search-CouchDBFullText [[-Server] <String>] [[-Port] <Int32>] [-Database] <String> [-Patterns] <Array> [-UseQueries] [[-Authorization] <String>] [-Ssl] [<CommonParameters>]
    
**Find-CouchDBDocuments**

.. code-block:: powershell

    Find-CouchDBDocuments [-Server <String>] [-Port <Int32>] [-Database <String>] [-Explain] [-Selector <String>] [-Value <String>] [-Limit <Int32>] [-Skip <Int32>] [-Fields <Array>] [-Sort <Array>] [-UseIndex <Array>] [-ReadQuorum <Int32>] [-Bookmark <String>] [-NoUpdate] [-Stable] [-Stale <String>] [-ExecutionStats] [-Operator <String>] [-Authorization <String>] [-Ssl] [<CommonParameters>]

    Find-CouchDBDocuments [-Server <String>] [-Port <Int32>] [-Database <String>] [-Find <String>] [-Authorization <String>] [-Ssl] [<CommonParameters>]

Design documents
****************

**Get-CouchDBDesignDocument**

.. code-block:: powershell

    Get-CouchDBDesignDocument [[-Server] <String>] [[-Port] <Int32>] [-Database] <String> [-Document] <String> [[-Authorization] <String>] [-Ssl] [<CommonParameters>]

**New-CouchDBDesignDocument**

.. code-block:: powershell

    New-CouchDBDesignDocument [-Server <String>] [-Port <Int32>] [-Database <String>] [-Document <String>] [-ViewName <String>] [-ViewKey <String>] [-ViewValue <String>] [-GetDoc] [-Authorization <String>] [-Ssl] [<CommonParameters>]

    New-CouchDBDesignDocument [-Server <String>] [-Port <Int32>] [-Database <String>] [-Document <String>] [-Data <Object>] [-Authorization <String>] [-Ssl] [<CommonParameters>]

    New-CouchDBDesignDocument [-Server <String>] [-Port <Int32>] [-Database <String>] [-Document <String>] [-ValidationRequirements <Array>] [-ValidationAuthor] [-Authorization <String>] [-Ssl] [<CommonParameters>]

    New-CouchDBDesignDocument [-Server <String>] [-Port <Int32>] [-Database <String>] [-Document <String>] [-ShowName <String>] [-ShowKey <String>] [-ShowValue <String>] [-Authorization <String>] [-Ssl] [<CommonParameters>]

    New-CouchDBDesignDocument [-Server <String>] [-Port <Int32>] [-Database <String>] [-Document <String>] [-ViewName <String>] [-ViewKey <String>] [-ViewValue <String>] [-GetDoc] [-ListName <String>] [-Authorization <String>] [-Ssl] [<CommonParameters>]

**Set-CouchDBDesignDocument**

.. code-block:: powershell

    Set-CouchDBDesignDocument [-Server <String>] [-Port <Int32>] [-Database <String>] [-Document <String>] [-ViewName <String>] [-ViewKey <String>] [-ViewValue <String>] [-GetDoc] [-Replace] [-Authorization <String>] [-Ssl] [<CommonParameters>]

    Set-CouchDBDesignDocument [-Server <String>] [-Port <Int32>] [-Database <String>] [-Document <String>] [-Data <Object>] [-Replace] [-Authorization <String>] [-Ssl] [<CommonParameters>]

    Set-CouchDBDesignDocument [-Server <String>] [-Port <Int32>] [-Database <String>] [-Document <String>] [-ValidationRequirements <Array>] [-ValidationAuthor] [-Replace] [-Authorization <String>] [-Ssl] [<CommonParameters>]

    Set-CouchDBDesignDocument [-Server <String>] [-Port <Int32>] [-Database <String>] [-Document <String>] [-ShowName <String>] [-ShowKey <String>] [-ShowValue <String>] [-Replace] [-Authorization <String>] [-Ssl] [<CommonParameters>]

    Set-CouchDBDesignDocument [-Server <String>] [-Port <Int32>] [-Database <String>] [-Document <String>] [-ViewName <String>] [-ViewKey <String>] [-ViewValue <String>] [-GetDoc] [-ListName <String>] [-Replace] [-Authorization <String>] [-Ssl] [<CommonParameters>]

**Compress-CouchDBDesignDocument**

.. code-block:: powershell

    Compress-CouchDBDesignDocument [[-Server] <String>] [[-Port] <Int32>] [-Database] <String> [-DesignDoc] <String> [[-Authorization] <String>] [-Ssl] [<CommonParameters>]

**Remove-CouchDBDesignDocument**

.. code-block:: powershell

    Remove-CouchDBDesignDocument [[-Server] <String>] [[-Port] <Int32>] [-Database] <String> [-Document] <String> [-Revision] <String> [[-Authorization] <String>] [-Force] [-Ssl] [-WhatIf] [-Confirm] [<CommonParameters>]

Aliases
_______

.. code-block:: powershell

    acnode -> Add-CouchDBNode                      
    ccdb -> Compress-CouchDBDatabase               
    ccdd -> Compress-CouchDBDesignDocument         
    ccdoc -> Clear-CouchDBDocuments                
    ccview -> Clear-CouchDBView                    
    cpdoc -> Copy-CouchDBDocument                  
    eccl -> Enable-CouchDBCluster                  
    fcdoc -> Find-CouchDBDocuments                 
    finddoc -> Find-CouchDBDocuments               
    gcadm -> Get-CouchDBAdmin                      
    gcatt -> Get-CouchDBAttachment                 
    gcbdoc -> Get-CouchDBBulkDocument              
    gcbpl -> Get-CouchDBDatabasePurgedLimit        
    gcconf -> Get-CouchDBConfiguration             
    gccs -> Get-CouchDBClusterSetup                
    gcdb -> Get-CouchDBDatabase                    
    gcdbc -> Get-CouchDBDatabaseChanges            
    gcdbp -> Grant-CouchDBDatabasePermission       
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
    gctsk -> Get-CouchDBActiveTask                 
    gcusr -> Get-CouchDBUser                       
    helpc -> Search-CouchDBHelp                    
    mcsts -> Measure-CouchDBStatistics             
    ncadm -> New-CouchDBAdmin                      
    ncatt -> New-CouchDBAttachment                 
    ncdb -> New-CouchDBDatabase                    
    ncddoc -> New-CouchDBDesignDocument            
    ncdoc -> New-CouchDBDocument                   
    ncidx -> New-CouchDBIndex                      
    ncrpl -> New-CouchDBReplication                
    ncusr -> New-CouchDBUser                       
    ncuuid -> New-CouchDBUuids                     
    rcadm -> Remove-CouchDBAdmin                   
    rcatt -> Remove-CouchDBAttachment              
    rcdb -> Remove-CouchDBDatabase                 
    rcdbp -> Revoke-CouchDBDatabasePermission      
    rcdbr -> Request-CouchDBReplication            
    rcddoc -> Remove-CouchDBDesignDocument         
    rcdoc -> Remove-CouchDBDocument                
    rcidx -> Remove-CouchDBIndex                   
    rcnode -> Remove-CouchDBNode                   
    rcrpl -> Remove-CouchDBReplication             
    rcs -> Remove-CouchDBSession                   
    rcsrv -> Restart-CouchDBServer                 
    rcusr -> Remove-CouchDBUser                    
    scadm -> Set-CouchDBAdmin                      
    scatt -> Set-CouchDBAttachment                 
    scbd -> Set-CouchDBBulkDocument                
    scconf -> Set-CouchDBConfiguration             
    scdbpl -> Set-CouchDBDatabasePurgedLimit       
    scddoc -> Set-CouchDBDesignDocument            
    scdoc -> Set-CouchDBDocument                   
    scds -> Sync-CouchDBDatabaseShards
    scft -> Search-CouchDBFullText             
    scrl -> Set-CouchDBRevisionLimit               
    scrpl -> Set-CouchDBReplication                
    scs -> Set-CouchDBSession                      
    scusr -> Set-CouchDBUser                       
    src -> Search-CouchDBHelp                      
    tcdb -> Test-CouchDBDatabase                   
    wcfc -> Write-CouchDBFullCommit
    ecdb -> Export-CouchDBDatabase
    exportdb -> Export-CouchDBDatabase  