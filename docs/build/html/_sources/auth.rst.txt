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

For security reasons, PSCouchDB does not use CouchDB token cookies. But authentication can be stored inside the current powershell session. 
By default, credential storage is allowed so that the ``Authorization`` parameter can only be specified once.

To modify the saved credential preference, set this:

.. code-block:: powershell

    $CouchDBSaveCredentialPreference = $false   # default is $true

Set a cookie:

.. code-block:: powershell

    $password = "password" | ConvertTo-SecureString -AsPlainText -Force
    Set-CouchDBSession -UserId admin -Password $password
    Set-CouchDBSession -UserId admin    # prompt password

Get a session:

.. code-block:: powershell

    Get-CouchDBSession          # PSCredential
    Get-CouchDBSession -Clear   # string format user:password

Now let verify a protected read database without ``Authorization`` param:

.. code-block:: powershell

    Get-CouchDBDatabase -Database test

And remove a session:

.. code-block:: powershell

    Remove-CouchDBSession