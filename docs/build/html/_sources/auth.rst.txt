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

Authentication
==============

CouchDB generates a token that the client can use for the next few requests to CouchDB. 
Tokens are valid until a timeout. When CouchDB sees a valid token in a subsequent request, it will authenticate the user by this token without requesting the password again. 
By default, cookies are valid for 10 minutes.

Set a cookie:

.. code-block:: powershell

    $password = "password" | ConvertTo-SecureString -AsPlainText -Force
    Set-CouchDBSession -UserId admin -Password $password

Get a session:

.. code-block:: powershell

    Get-CouchDBSession

Now let verify a protected read database without ``Authorization`` param:

.. code-block:: powershell

    Get-CouchDBDatabase -Database test

And remove a session:

.. code-block:: powershell

    Remove-CouchDBSession -Authorization "admin:password"