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

Permission
==========

Admin Party
___________

When you start out fresh, CouchDB allows any request to be made by anyone. Create a database and delete some documents? Same deal. CouchDB calls this the Admin Party. Everybody has privileges to do anything.

This is very nice for testing enviroment, but anyone could delete documents or the whole database. By default, CouchDB, will listen only on your loopback network interface (127.0.0.1 or localhost) and thus only you will be able to make requests to CouchDB, nobody else. But when it is necessary to expose the service on public ip, you will want to think about restricting access.

CouchDB has the idea of an admin user (for example, an administrator, a super user, or root) that is allowed to do anything to a CouchDB installation. By default, everybody is an admin.

To restrict permissions, one or more administrators must be created.


Create Admin user
_________________

Admin Party allows any user to perform any database operation.
This could be perfect for application development or on a test machine, but for production it would create many problems.
To solve this problem, just create an admin user. At this point the admin user can create/modify/delete documents from the database.

.. important::  
    If the password is not specified, it will be prompted. For example, ``-Authorization admin`` will ask you to write the password at the prompt.
    The password has the format *****.

.. code-block:: powershell

    $password = "password" | ConvertTo-SecureString -AsPlainText -Force
    New-CouchDBAdmin -Userid admin -Password $password

Naturally, all reading requests can be made without user and password.


Members access
______________

To protect a database from unauthorized requests, you must first create a user used for this purpose.

.. code-block:: powershell

    $password = "password" | ConvertTo-SecureString -AsPlainText -Force
    New-CouchDBUser -Userid member_user -Password $password -Authorization "admin:password"

And then enable it to the server.

.. code-block:: powershell

    Grant-CouchDBDatabasePermission -Database test -ReaderUser member_user -Authorization "admin:password"

Let's check the permissions now.

.. code-block:: powershell

    Get-CouchDBDatabaseSecurity -Database test -Authorization "member_user:password"
    Get-CouchDBDatabase -Database test -Authorization "member_user:password"


Limit write access
__________________

If you want to limit a single database with different admin user for reading and writing, use this cmdlet:

.. code-block:: powershell

    $password = "password" | ConvertTo-SecureString -AsPlainText -Force
    New-CouchDBUser -Userid other_admin -Password $password -Authorization "admin:password"
    Grant-CouchDBDatabasePermission -Database test -AdminUser other_admin -Authorization "admin:password"
    Get-CouchDBDatabase -Database test -Authorization "other_admin:password"

Revoke database permissions
___________________________

To remove permissions from one database, run this cmdlet:

.. code-block:: powershell

    Revoke-CouchDBDatabasePermission -Database test -Authorization "admin:password"


Remove an admin
_______________

To remove an administrative user, run:

.. code-block:: powershell

    Remove-CouchDBAdmin -Userid admin -Authorization "admin:password"

Remove a user
_____________

To remove a simple user, run:

.. code-block:: powershell

    $user = Get-CouchDBUser -Userid member_user | Select-Object _id,_rev
    Remove-CouchDBUser -Userid $user._id -Revision $user._rev -Authorization "admin:password"

Reset user password
___________________

To modify o reset password of a user.

.. code-block:: powershell

    $password = "new_password" | ConvertTo-SecureString -AsPlainText -Force
    Set-CouchDBUser -Userid member_user -Password $password -Revision "2-4705a219cdcca7c72aac4f623f5c46a8" -Authorization "admin:password"

Reset admin password
____________________

To modify o reset password of an admin.

.. code-block:: powershell

    $password = "new_password" | ConvertTo-SecureString -AsPlainText -Force
    Set-CouchDBAdmin -Userid test_user -Password $password -Authorization "admin:password"