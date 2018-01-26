# PSCouchDB
[Powershell](https://github.com/PowerShell/PowerShell "Powershell source") meet [CouchDB](http://couchdb.apache.org/ "CouchDB site")

## Installation and simple usage
1. Download and install couchdb following the [docs](http://docs.couchdb.org/en/latest)
2. Download and install the powershell module by copying it under `%Windir%\System32\WindowsPowerShell\v1.0\Modules` for all users or under `%UserProfile%\Documents\WindowsPowerShell\Modules` for the current user
3. Now let's start by creating an admin user by connecting to [Fauxton](http://localhost:5984/_utils)
4. Now, open powershell and create a first database: 
```powershell
New-CouchDBDatabase -Database test -Authorization "adminuser:password"
``` 
where adminuser is a newly created user and your password
5. Create a sample document for `test` database:
```powershell
$Data = '{
	"color": "red",
	"value": "#f00"
}'
New-CouchDBDocument -Database test -Document "red" -Data $Data -Authorization "adminuser:password"
```
6. Add attachment file in our docuemnt:
```powershell
$rev = (Get-CouchDBDocument -Database test -Document "red")._rev
"Red is blood" | Out-File C:\file.txt
New-CouchDBAttachment -Database test -Document "red" -revision $rev -Attachment C:\file.txt -Authorization "adminuser:password"
```
7. Finally, get a document:
```powershell
Get-CouchDBAttachment -Database test -Document "red" -Attachment file.txt
```