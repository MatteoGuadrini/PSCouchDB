# The complete and powerfull powershell module for CouchDB v2.0
[Powershell](https://github.com/PowerShell/PowerShell "Powershell source") meet [CouchDB](http://couchdb.apache.org/ "CouchDB site")

## Installation and simple usage
1. Download and install CouchDB following the [docs](http://docs.couchdb.org/en/latest/install/index.html).
2. Download and install latest PSCouchDB module by copying it under `%Windir%\System32\WindowsPowerShell\v1.0\Modules` for all users or under `%UserProfile%\Documents\WindowsPowerShell\Modules` for the current user or install through [PowershellGallery](https://www.powershellgallery.com/packages/PSCouchDB).
> ATTENTION: This module is not signed. Before import or execute cmdlet on this module, see [about_signing](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_signing) session. To skip this part and continue, run ```Set-ExecutionPolicy -ExecutionPolicy Unrestricted```
3. Now let's start by creating an admin user by connecting to [Fauxton](http://localhost:5984/_utils) and going to session "Admin Party!" on left of the menu or run this cmdlet:
```powershell
$password = "password" | ConvertTo-SecureString -AsPlainText -Force
New-CouchDBAdmin -Userid adminuser -Password $password
```
> ATTENTION: Authentication for read and write no required by default, but required if you create custom user, like session "Grant permission" on this document. For more information see permission on [wiki permission page](https://github.com/MatteoGuadrini/PSCouchDB/wiki/Permission)
4. Before configure database mode, create this system document whit this cmdlet:
```powershell
New-CouchDBDatabase -Database _users -Authorization "adminuser:password"
New-CouchDBDatabase -Database _replicator -Authorization "adminuser:password"
New-CouchDBDatabase -Database _global_changes -Authorization "adminuser:password"
```
Now, configure database mode, in single node (cluster of one single node) or cluster, clicking on "Setup" on left of the menu; follow the wizard and complete this procedure or run this cmdlet:
```powershell
Enable-CouchDBCluster -Authorization "adminuser:password"
```
5. Now, open powershell and create a first personal database: 
```powershell
New-CouchDBDatabase -Database test -Authorization "adminuser:password"
``` 
where adminuser is a newly created user and your password.

6. Create a sample document for `test` database:
```powershell
$Data = '{
	"color": "red",
	"value": "#f00"
}'
New-CouchDBDocument -Database test -Document "red" -Data $Data -Authorization "adminuser:password"
```
7. Add attachment file in our docuemnt:
```powershell
$rev = (Get-CouchDBDocument -Database test -Document "red")._rev
"Blood is red" | Out-File C:\file.txt
New-CouchDBAttachment -Database test -Document "red" -revision $rev -Attachment C:\file.txt -Authorization "adminuser:password"
```
8. Finally, get a document:
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
`Selector` is the search field; `Value` is the value of the selector; `Fields` they are the fields that return from the research and `Operator` it is the comparison operator used to compare the selector.
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

### Find data with other operator
Search data with other comparison operator:
```powershell
Find-CouchDBDocuments -Database test -Selector "answer" -Value 42 -Fields _id,answer -Operator lt
Find-CouchDBDocuments -Database test -Selector "answer" -Value 42 -Fields _id,answer -Operator gt
Find-CouchDBDocuments -Database test -Selector "color" -Value "blue" -Fields _id,color -Operator ne
Find-CouchDBDocuments -Database test -Selector "color" -Value true -Fields _id,color -Operator exists
Find-CouchDBDocuments -Database test -Selector "color" -Value string -Fields _id,color -Operator type
Find-CouchDBDocuments -Database test -Selector "answer" -Value number -Fields _id,answer -Operator type
Find-CouchDBDocuments -Database test -Selector "array" -Value "value1" -Fields _id,array -Operator in
Find-CouchDBDocuments -Database test -Selector "array" -Value "value 2" -Fields _id,array -Operator nin
Find-CouchDBDocuments -Database test -Selector "array" -Value 1 -Fields _id,array -Operator size
Find-CouchDBDocuments -Database test -Selector "color" -Value "^[rR].[dD]" -Fields _id,color -Operator regex
```

## Logical Operators
For now, I've used the native powershell logical operators.
### AND
```powershell
((Find-CouchDBDocuments -Database test -Selector "color" -Value "red" -Fields _id,color -Operator eq).docs -and (Find-CouchDBDocuments -Database test -Selector "color" -Value "blue" -Fields _id,color -Operator eq).docs)
```
### OR
```powershell
((Find-CouchDBDocuments -Database test -Selector "color" -Value "red" -Fields _id,color -Operator eq).docs -or (Find-CouchDBDocuments -Database test -Selector "color" -Value "blue" -Fields _id,color -Operator eq).docs)
```
### NOT
```powershell
(-not(Find-CouchDBDocuments -Database test -Selector "color" -Value "red" -Fields _id,color -Operator eq).docs)
```
### NOR
```powershell
(-not((Find-CouchDBDocuments -Database test -Selector "color" -Value "red" -Fields _id,color -Operator eq).docs -or (Find-CouchDBDocuments -Database test -Selector "color" -Value "blue" -Fields _id,color -Operator eq).docs))
```

### Other operation
For other operation see the [wiki](https://github.com/MatteoGuadrini/PSCouchDB/wiki).

### Cmdlet example
To get examples of all the cmdlets of this module, use this command:
```powershell
Get-Command -Module *PSCouchDB* | foreach {Get-Help $_.Name -Example}
```
or see [wiki page](https://github.com/MatteoGuadrini/PSCouchDB/wiki)


[![paypal](https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=CYB2W93Z5JY8C)