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
where adminuser is a newly created user and your password.

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
"Blood is red" | Out-File C:\file.txt
New-CouchDBAttachment -Database test -Document "red" -revision $rev -Attachment C:\file.txt -Authorization "adminuser:password"
```
7. Finally, get a document:
```powershell
Get-CouchDBAttachment -Database test -Document "red" -Attachment file.txt
```

## Grant permission
First, check all the available databases:
```powershell
Get-CouchDBDatabase
```
Create a new user in _users database:
```powershell
New-CouchDBUser -Userid admin_test -Password "passw0rd" -Roles admin -Authorization "adminuser:password"
```
Apply the correct permissions to the database:
```powershell
Grant-CouchDBDatabasePermission -Database test -AdminUser admin_test -AdminRoles admin -Authorization "adminuser:password"
```
Test the new permissions by creating a new document:
```powershell
$Data = '{
	"color": "blue",
	"value": "#0000FF"
}'
New-CouchDBDocument -Database test -Document "blue" -Data $Data -Authorization "admin_test:passw0rd"
```

## Revoke permission
To revoke all permissions on a database, use this cmdlet:
```powershell
Revoke-CouchDBDocument -Database test
```

## Find data on database
To search for data in a specific database, use this cmdlet:
```powershell
Find-CouchDBDocuments -Database test -Selector "color" -Value "red" -Fields _id,color -Operator eq
```
`Selector` is the search field; `Value` is the value of the selector; `Fields` they are the fields that come back from the research and `Operator` it is the logical operator used to compare the selector.
The operators available, for now, are the following:
- 'lt'  	The field is less than the argument.  
- 'lte'   	The field is less than or equal to the argument.
- 'eq'    	The field is equal to the argument.
- 'ne'    	The field is not equal to the argument.
- 'gte'   	The field is greater than or equal to the argument.
- 'gt'    	The field is greater than the to the argument.
- 'exists'	Check whether the field exists or not, regardless of its value.
- 'type'  	Check the document field’s type. Valid values are "null", "boolean", "number", "string", "array", and "object".
- 'in'    	The document field must exist in the list provided.
- 'nin'   	The document field not must exist in the list provided.
- 'size'   	Special condition to match the length of an array field in a document. Non-array fields cannot match this condition.
- 'regex'   A regular expression pattern to match against the document field. Only matches when the field is a string value and matches the supplied regular expression. The matching algorithms are based on the Perl Compatible Regular Expression (PCRE) library. For more information about what is implemented, see the see the [Erlang Regular Expression](http://erlang.org/doc/man/re.html "Perl-like regular expressions for Erlang")
`Sort` indicates the field you want to sort ascending data. 


### Cmdlet example
To get examples of all the cmdlets of this module, use this command:
```powershell
Get-Command -Module *PSCouchDB* | foreach {Get-Help $_.Name -Example}
```