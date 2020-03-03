# The complete and powerful powershell module for CouchDB v2.X and v3.X
[Powershell](https://github.com/PowerShell/PowerShell "Powershell source") meet [CouchDB](http://couchdb.apache.org/ "CouchDB site")

<img src="https://pscouchdb.readthedocs.io/en/latest/_images/pscouchdb-logo.png" alt="PSCouchDB" title="PSCouchDB" width="320" height="224" />

## Installation and simple usage
1. Download and install CouchDB following the [docs](http://docs.couchdb.org/en/latest/install/index.html).
2. Download and install latest PSCouchDB module by copying it under `%Windir%\System32\WindowsPowerShell\v1.0\Modules` for all users or under `%UserProfile%\Documents\WindowsPowerShell\Modules` for the current user or install through [PowershellGallery](https://www.powershellgallery.com/packages/PSCouchDB).
> ATTENTION: This module is not signed. Before import or execute cmdlet on this module, see [about_signing](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_signing) session. To skip this part and continue, run ```Set-ExecutionPolicy -ExecutionPolicy Unrestricted```
3. Now let's start by creating an admin user, run this cmdlet:
```powershell
$password = "password" | ConvertTo-SecureString -AsPlainText -Force
New-CouchDBAdmin -Userid admin -Password $password
```
> ATTENTION: Authentication for read and write no required by default, but required if you create custom user, like session "Grant permission" on this document. For more information see permission on [docs permission page](permission.html#admin-party)
4. Now, configure database mode, in single node (cluster of one single node) or cluster, run this cmdlet:
```powershell
# Single node cluster
Enable-CouchDBCluster -SingleNode -Authorization "admin:password"
# Cluster (with three node)
Enable-CouchDBCluster -Authorization "admin:password"
```
For more details, see the [docs](https://pscouchdb.readthedocs.io/en/latest/config.html).

5. Now, open powershell and create a first personal database:
```powershell
New-CouchDBDatabase -Database test -Authorization "admin:password"
```
where admin is a newly created user and your password.

6. Create a sample document for `test` database:
```powershell
$Data = '{
	"name": "Arthur",
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

## Grant permission
First, check all the available databases:
```powershell
Get-CouchDBDatabase
```
Create a new user in *\_users* database:
```powershell
$password = "password" | ConvertTo-SecureString -AsPlainText -Force
New-CouchDBUser -Userid admin_test -Password $password -Roles admin -Authorization "admin:password"
```
Apply the correct permissions to the database:
```powershell
Grant-CouchDBDatabasePermission -Database test -AdminUser admin_test -AdminRoles admin -Authorization "admin:password"
```
Test the new permissions by creating a new document:
```powershell
$Data = '{
	"color": "blue",
	"value": "#0000FF"
}'
New-CouchDBDocument -Database test -Document "blue" -Data $Data -Authorization "admin_test:passw0rd"
```
For more details, see the [docs](https://pscouchdb.readthedocs.io/en/latest/permission.html#limit-write-access).

## Revoke permission
To revoke all permissions on a database, use this cmdlet:
```powershell
Revoke-CouchDBDatabasePermission -Database test -Authorization "admin:password"
```
For more details, see the [docs](https://pscouchdb.readthedocs.io/en/latest/permission.html#revoke-database-permissions).

## Find data on database
To search for data in a specific database, use this cmdlet:
```powershell
Find-CouchDBDocuments -Database test -Selector "name" -Value "Arthur" -Fields _id,name,planet -Operator eq
```
`Selector` is the search field; `Value` is the value of the selector; `Fields` they are the fields that return from the research and `Operator` it is the comparison operator used to compare the selector.
For more details, see the [docs](https://pscouchdb.readthedocs.io/en/latest/documents.html#find-a-document).

## Logical Operators
For logical operators, use native class **PSCouchDBQuery**. So, run this:
```powershell
using module PSCouchDB
$myquery = New-Object PSCouchDBQuery
$myquery.AddSelector("answer", 42)
$myquery.AddSelector("name", 'Arthur')
```
### AND
Find if "answer" is 42 **and** "name" is Arthur
```powershell
$myquery.AddLogicalOperator('$and')
Find-CouchDBDocuments -Database test -Find $myquery.GetNativeQuery()
```
### OR
Find if "answer" is 42 **or** "name" is Arthur
```powershell
$myquery.AddLogicalOperator('$or')
Find-CouchDBDocuments -Database test -Find $myquery.GetNativeQuery()
```
### NOT
Find if "answer" is **not** 42 and "name" is **not** Arthur
```powershell
$myquery.AddLogicalOperator('$not')
Find-CouchDBDocuments -Database test -Find $myquery.GetNativeQuery()
```
### NOR
Find if "answer" is **not** 42 or "name" is **not** Arthur
```powershell
$myquery.AddLogicalOperator('$nor')
Find-CouchDBDocuments -Database test -Find $myquery.GetNativeQuery()
```

For more details, see the [docs](https://pscouchdb.readthedocs.io/en/latest/documents.html#logical-operators).

### Complete documentation
For other operation, for more details and for learning all cmdlets and possibilities, see the [docs](https://pscouchdb.readthedocs.io/en/latest/).

### Kanban board
If you are curious, if you want to contribute or simply see the features, look at the project's kanban board here: [KANBAN](https://tree.taiga.io/project/matteoguadrini-pscouchdb/kanban).

### Cmdlet help
If you want to have an overview of the module, do this:
```powershell
help about_pscouchdb
```
Search for the cmdlets using a keyword pattern and then view the help:
```powershell
Search-CouchDBHelp -Pattern Database | foreach {Get-Help $_.Name}
```
To get examples of all the cmdlets of this module, use this command:
```powershell
Get-Command -Module *PSCouchDB* | foreach {Get-Help $_.Name -Example}
```
or see [docs](https://pscouchdb.readthedocs.io/en/latest).
For a little demonstration, see [here](https://asciinema.org/a/232696)

## [Donation and Support](https://pscouchdb.readthedocs.io/en/latest/support.html).