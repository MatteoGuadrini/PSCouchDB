# Release notes

## 2.6.0
Jul 20, 2023

- Add _Index_ parameter on **Get-CouchDBDesignDocument** cmdlet.
- Add **Find-CouchDBDesignDocument** cmdlet.
- Add _debug_ to **Send-CouchDBRequest** cmdlet.
- Add _WinningRevisionOnly_ parameter on **Request-CouchDBReplication** cmdlet.
- Fix the generation of guid

## 2.5.0
Jun 09, 2022

- Fix *GetHeader* method on **PSCouchDBRequest** class.
- Fix **ConvertTo-CouchDBPassword** cmdlet.
- Fix position of **PSCouchDBRequestException** class.
- Fix check permission on **Revoke-CouchDBDatabasePermission** cmdlet.
- Fix **Copy-CouchDBDatabase** cmdlet.
- Fix check document info in all cmdlet.
- Add *Node* parameter on **Get-CouchDBNode** cmdlet.
- Add all parameters on **Get-CouchDBDatabaseChanges** cmdlet.
- Add *tests* folder for [**Pester**](https://pester-docs.netlify.app/) testing.

## 2.4.0
May 28, 2021

- Fix **PSCouchDBRequest** constructor.
- Fix *SetServer* method on **PSCouchDBRequest** class.
- Fix *AddAuthorization* method on **PSCouchDBRequest** class.
- Fix *SetDatabase/Document/Attachment* method on **PSCouchDBRequest** class.
- Add positional parameters value for some cmdlets.
- Remove *Username* and *Password* in *ToString* method on **PSCouchDBRequest** for security reason.

## 2.3.0
May 28, 2021

- Fix **PSCouchDBDocument** guid.
- Add *Partition* parameter on **Set-CouchDBDocument**.
- Add **Set-CouchDBMaintenanceMode** cmdlet.

## 2.2.0
Sep 19, 2020

- Rewrite **Import-CouchDBDatabase** cmdlet.
- Fix _RequestAsJob_ method for Linux machine.
- Add _SetDocumentId_ method on **PSCouchDBDocument** class.
- Add _SetSelector_ override method on **PSCouchDBReplication** class.
- Add **Search-CouchDBAnalyze**, **Get-CouchDBReshards**, **Set-CouchDBReshards**, **Remove-CouchDBReshards** cmdlet.
- Add CouchDB response to **PSCouchDBRequestException** class.

## 2.1.0
Sep 12, 2020

- Merge **New-CouchDBDatabasePartition** in **New-CouchDBDatabase** cmdlet. 
- Fix **Send-CouchDBRequest** cmdlet.
- Add *ProxyServer*, *ProxyCredential* parameter on **Send-CouchDBRequest** cmdlet.
- Add parameter support on various cmdlet.
- Add **Set-CouchDBProxy** and **Remove-CouchDBProxy** cmdlet.
- Add *ProxyServer* and *ProxyCredential* params on all cmdlet.

## 2.0.0
Aug 03, 2020

With this release, support for CouchDB 2.X is abandoned to support CouchDB 3.X and (in the future) 4.X. Below are the various changes made:

- Split function cmdlet in a nested module
- Add _-AsJob_ parameter on various cmdlet (background job)
- Public and rewrite **Send-CouchDBRequest** cmdlet (now based on - specific CouchDB request build on System.Net.WebRequest .NET class)
- Supports partitioned databases
- Add PSCouchDBDocument class
- Add PSCouchDBAttachment class
- Add PSCouchDBView class
- Add new PSCouchDBDesignDoc class
- Add PSCouchDBBulkDocument class
- Add PSCouchDBRequest class
- Rewrite Get/Set/Remove-CouchDBSession cmdlet
- Enable Preferences variable: CouchDBSaveCredentialPreference, - CouchDBCachePreference
- Add Connect/Disconnect-CouchDBDatabase cmdlet
- Fix some cmdlet and bugs
- New homepage: [https://matteoguadrini.github.io/PSCouchDB/](https://matteoguadrini.github.io/PSCouchDB/)

## 1.14.0
Mar 03, 2020

- Fix *Value* param on **Find-CouchDBDocuments**
- Fix *Key* param on **Get-CouchDBDocument**
- Fix **Clear-CouchDBDocuments**
- Add issue template cmdlet bug
- Add issue template cmdlet enhancement
- Add issue template **PSCouchDBQuery** class bug
- Add issue template **PSCouchDBQuery** class enhancement
- Add issue template **PSCouchDBDesignDoc** class bug
- Add issue template **PSCouchDBDesignDoc** class enhancement
- Improved **Grant-CouchDBDatabasePermission** cmdlet
- Re-adaptation of the **Revoke-CouchDBDatabasePermission** cmdlet
- Add pull request template
- Fix **Search-CouchDBFullText** *UseQueries* param
- Add *ReadOnly* validation function to **PSCouchDBDesignDoc**
- Added remote possibilities for database copying
- Fix **Get-CouchDBDatabaseInfo**
- Fix **Restart-CouchDBServer** on Unix based os
- Fix **Copy-CouchDBDatabase** cmdlet
- Fix issue #1523,#2092,#2336,#2475 for default port
- Add deprecation shows and list in design documents class


## 1.13.0
Sep 18, 2019

- Add param -Document on **Get-CouchDBDatabaseShards**.
- Add some param **Get-CouchDBDatabaseDesignDocument**:
    - *Descending*
    - *EndKey*
    - *EndKeyDocument*
    - *IncludeDocument*
    - *InclusiveEnd*
    - *Key*
    - *Keys*
    - *Conflict*
    - *Limit*
    - *Skip*
    - *StartKey*
    - *StartKeyDocument*
    - *UpdateSequence*
- Add some param to **Get-CouchDBDatabaseUpdates**: 
    - *Feed*
    - *Timeout*
    - *Heartbeat*
    - *Since*
- Complete **_all_docs** query parameter.
- Add full param to **Get-CouchDBDatabase**.
- Add *EnsureDatabaseExist* to **Get-CouchDBClusterSetup**.
- Add some param to **Enable-CouchDBCluster**:
    - *BindPort*
    - *BindAddress*
    - *RemoteNode*
    - *RemoteUser*
    - *RemotePassword*
- Add *Limit* and *Skip* param to **Get-CouchDBReplicationScheduler**.
- Add some parameter to **Get-CouchDBReplicationDocument**.
- Add *Session* and *Key* param to **Get-CouchDBConfiguration**.

## 1.12.0
Aug 8, 2019
* **New-CouchDBDesignDocumentAttachment**
* **Set-CouchDBDesignDocumentAttachment**
* **Remove-CouchDBDesignDocumentAttachment**
* **Get-CouchDBDesignDocumentAttachment**

**Other features**:
Add intuitive alias.
Add Info parameter to **Get-CouchDBDesignDocument**.
Add Info parameter to **Get-CouchDBDocument**.
Add CouchDB API help infos.
Prompt password if authorization is composed only of user, in *secure string*.

## 1.11.0
Jul 10, 2019
* **Export-CouchDBDatabase**
* **Import-CouchDBDatabase**
* **Read-CouchDBLog**
* **Clear-CouchDBLog**
* **Copy-CouchDBDatabase**

## 1.10.0
Jun 4, 2019
* **Search-CouchDBFullText**

**Improvements**
* Now, some cmdlet accept pipeline value.
* Add headers info in **Send-CouchDBRequest** cmdlet.
* Add Info param to **Get-CouchDBAttachment** cmdlet.
* Add batch mode to **New/Set-CouchDBDocument**
* Add UseQueries parameter in **Search-CouchDBFullText**
* Add Filter parameter on **Get-CouchDBDatabaseChanges**
* Add Continuous param on **Get-CouchDBDatabaseChanges**
* Add parameters on **Get-CouchDBDocument** cmdlet:
PARAMETER: *Attachments,AttachmentsInfo,AttachmentsSince,Conflicts,DeletedConflicts,Latest,LocalSequence,Metadata,OpenRevisions*
* Refactoring of all powershell language
* Add *NoConflict* param on **Set-CouchDBDocument** cmdlet.


## 1.9.0
Mar 18, 2019
* **Test-CouchDBDatabase**
* **Get-CouchDBDatabasePurgedLimit**
* **Get-CouchDBDatabasePurgedLimit**
* **Get-CouchDBClusterSetup**
* **Get-CouchDBSession**
* **Sync-CouchDBDatabaseShards**
* **Set-CouchDBDatabasePurgedLimit**
* **Set-CouchDBSession**
* **Remove-CouchDBSession**

**New documentation**
New documentation site write with Sphinx
[docs](https://pscouchdb.readthedocs.io/en/latest/)

**New help**
I improvement the help system for each cmdlet. Try: ```help about_pscouchdb```

**Unix support**
Completed improvements for unix systems

## 1.8.0
Nov 14, 2018
* **Get-CouchDBDatabaseSecurity**
* **Grant-CouchDBDatabaseSecurity**
* **Get-CouchDBBulkDocument**
* **Get-CouchDBDatabaseDesignDocument**
* **Get-CouchDBMissingRevision**
* **Compress-CouchDBDesignDocument**
* **Set-CouchDBBulkDocument**
* **Get-CouchDBServer**
* **Get-CouchDBDatabaseInfo**
* **Get-CouchDBDatabaseUpdates**
* **Get-CouchDBReplicationDocument**
* **Get-CouchDBRevisionDifference**
* **Get-CouchDBRevisionLimit**
* **Copy-CouchDBDocument**
* **Search-CouchDBHelp**
* **Set-CouchDBRevisionLimit**
* **Request-CouchDBReplication**

**Cover all APIs**
Now all command line operation are available.
This mean that work with Server, Databases, Documents, Permissions on server or on databases,
DesignDoc, Filter, Limit, Find data (with Mango engine), Shows, Server replication and Database replication,
Configuratation of server and replication, Work with node of cluster and more...

**New description**
For some cmdlet re-write help description, compliant to the official CouchDB documentation

**New help system**
Now to find the right cmdlet for the right operation, just one word:
```powershell
Search-CouchDBHelp -Pattern Database
Search-CouchDBHelp -Pattern Document | Get-Help $_.Name -Example
Search-CouchDBHelp -Pattern Replica | Get-Help $_.Name -Full
```

**Code of conduct**
For those wishing to contribute to this project, I have released the code of conduct.

## 1.7.0
Sep 17, 2018
- Add class **PSCouchDBDesignDoc** for design document
- Add cmdlet for design document (Get/New/Set/Remove-CouchDBDesignDocument)

## 1.6.0
Jul 24, 2018
- Rewrite a **Find-CouchDBDocuments**: now accept two type of arguments; see help or wiki.
- Add alias for all cmdlets; discover with this: 
```powershell
Get-Command -Module PSCouchDB | foreach { Get-Alias -Definition $_.name -ea 0 }
```
- Add PSCouchDBQuery class; with this you can build any type query and parse to Find-CouchDBDocuments; see help of cmdlet: 
```powershell
help Find-CouchDBDocuments -Example
```

## 1.5.0
Jun 7, 2018
- **Measure-CouchDBStatistics**: Measure CouchDB server statistics.
- **New-CouchDBUuids**: Create a new CouchDB uuids.
- **Restart-CouchDBServer**: Restart CouchDB server.
- **Get-CouchDBIndex**: Get indexes of CouchDB database.
- **New-CouchDBIndex**: Create a new index of CouchDB database.
- **Remove-CouchDBIndex**: Remove a index of CouchDB database.

## 1.4.0
Apr 23, 2018
- **Get-CouchDBActiveTask**: Get a CouchDB active task. 
- **Enable-CouchDBCluster**: Create a new cluster CouchDB server.
- **Compress-CouchDBDatabase**: Compress database of CouchDB.
- **Clear-CouchDBView**: Clean up all outdated view indexes.

## 1.3.0
Apr 16, 2018
- **Get-CouchDBDatabaseChanges**: Get database changelogs of CouchDB. 
- **Get-CouchDBReplication**: Get database replication documents of CouchDB.
- **Get-CouchDBReplicationScheduler**: Get more details of database replication documents of CouchDB.
- **Set-CouchDBReplication**: Set replication documents of CouchDB. 
- **New-CouchDBReplication**: Create a new replication job for a specidfic database. 
- **Remove-CouchDBReplication**: Remove replication documents of CouchDB.

## 1.2.0
Mar 19, 2018
- **Get-CouchDBAdmin**: Get a CouchDB admin user. 
- **Get-CouchDBConfiguration**: Get configuration of CouchDB.
- **Set-CouchDBAdmin**: Reset password of CouchDB admin user.
- **Set-CouchDBConfiguration**: Set element configuration of CouchDB. 
- **New-CouchDBAdmin**: Create a new CouchDB admin user. 
- **Remove-CouchDBAdmin**: Remove a CouchDB admin user.
- **Get-CouchDBNode**: Get server nodes of CouchDB. 
- **Add-CouchDBNode**: Add server nodes of CouchDB.
- **Remove-CouchDBNode**: Remove server nodes of CouchDB.

## 1.1.0
Mar 8, 2018
* Add UTF8 support on all json data
* Add -Force parameter on all cmdlet with verbs Revoke or Remove
* Add casting on all parameters of all cmdlet
* Add -OutFile parameter on cmdlet Get-CouchDBAttachment for to save file

## 1.0.0
Feb 21, 2018
- **Get-CouchDBDatabase**: Get a CouchDB database informations. 
- **Get-CouchDBDocument**: Get a CouchDB document json data. 
- **Get-CouchDBAttachment**: Get attachment from CouchDB document. 
- **Get-CouchDBUser**: Get a CouchDB user. 
- **Set-CouchDBDocument**: Modify a CouchDB document json data. 
- **Set-CouchDBAttachment**: Modify attachment from CouchDB document.
- **Set-CouchDBUser**: Set a CouchDB user properties with roles. Reset password user.
- **Grant-CouchDBDatabasePermission**: Grant permission on database. Specify Admins and/or Readers. 
- **Revoke-CouchDBDatabasePermission**: Revoke permission on database. Specify Admins and/or Readers. 
- **New-CouchDBDatabase**: Create a new CouchDB database. 
- **New-CouchDBDocument**: Create a new CouchDB document with json data. 
- **New-CouchDBAttachment**: Create a new CouchDB attachment document. 
- **New-CouchDBUser**:  Create a new CouchDB user with roles. 
- **Remove-CouchDBDatabase**: Remove a CouchDB database. 
- **Remove-CouchDBDocument**: Remove a CouchDB document with json data.
- **Remove-CouchDBAttachment**: Remove a CouchDB attachment document.
- **Remove-CouchDBUser**: Remove a CouchDB user with roles. 
- **Find-CouchDBDocument**: Find document data in a CouchDB database.