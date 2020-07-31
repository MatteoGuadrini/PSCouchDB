# PSCouchDB: Advanced CLI for CouchDB server
<img src="https://pscouchdb.readthedocs.io/en/latest/_images/pscouchdb-logo.svg" alt="PSCouchDB" title="PSCouchDB" width="320" height="224" />

## Installation and simple usage
1. Download and install CouchDB following the [docs](http://docs.couchdb.org/en/latest/install/index.html).
2. Download and install latest PSCouchDB module by copying it under `%Windir%\System32\WindowsPowerShell\v1.0\Modules` for all users or under `%UserProfile%\Documents\WindowsPowerShell\Modules` for the current user or install through [PowershellGallery](https://www.powershellgallery.com/packages/PSCouchDB).
> INFORMATION: This module is not signed. Before import or execute cmdlet on this module, see [about_signing](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_signing) session. To skip this part and continue, run ```Set-ExecutionPolicy -ExecutionPolicy Unrestricted```
> ATTENTION: If you are using CouchDB version 2, use the PSCouchDB 1.X version; if instead you are using CouchDB version 3 or 4, use the PSCouchDB version 2.X```
3. Now, configure database mode, in single node (cluster of one single node) or cluster, run this cmdlet:
```powershell
# Single node cluster
Enable-CouchDBCluster -SingleNode -Authorization "admin:password"
# Cluster (with three node)
Enable-CouchDBCluster -Authorization "admin:password"
```
For more details, see the [docs](https://pscouchdb.readthedocs.io/en/latest/config.html).
4. Now, open powershell and create a first personal database:
```powershell
New-CouchDBDatabase -Database test -Authorization "admin:password"
```
6. Create a sample document for `test` database:
```powershell
$Data = '{
	"name": "Arthur Dent",
	"planet": "Heart"
}'
New-CouchDBDocument -Database test -Document "Hitchhikers" -Data $Data -Authorization "admin:password"
```
7. Add attachment file in our docuemnt:
```powershell
$rev = (Get-CouchDBDocument -Database test -Document "Hitchhikers")._rev
"Ultimate Question of Life, the Universe and Everything" | Out-File C:\file.txt
New-CouchDBAttachment -Database test -Document "Hitchhikers" -revision $rev -Attachment C:\file.txt -Authorization "admin:password"
```
8. Finally, get a document:
```powershell
Get-CouchDBAttachment -Database test -Document "Hitchhikers" -Attachment file.txt
```

These are just some of the operations you can do with this CLI.
PSCouchDB supports all [API](https://docs.couchdb.org/en/stable/api/index.html) of CouchDB server. If you want to find out more, follow the docs.

### Complete documentation
For other operation, for more details and for learning all cmdlets and possibilities, see the [docs](https://pscouchdb.readthedocs.io/en/latest/).

### Kanban board
If you are curious, if you want to contribute or simply see the features, look at the project's kanban board here: [KANBAN](https://github.com/MatteoGuadrini/PSCouchDB/projects).

### Cmdlet help
If you want to have an overview of the module, do this:
```powershell
help about_pscouchdb
```
Search for the cmdlets using a keyword pattern and then view the help:
```powershell
Search-CouchDBHelp -Pattern Database | foreach {Get-Help $_.Name}
```
or see [docs](https://pscouchdb.readthedocs.io/en/latest).
For a little demonstration, see [here](https://asciinema.org/a/232696)

## [Donation and Support](https://pscouchdb.readthedocs.io/en/latest/support.html).