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
    
Introduction
============

PSCouchDB is a powershell module to semplify your work on couchdb database. 

.. warning::
    Before continuing, install the latest version of CouchDB, following the `documentation <https://docs.couchdb.org/en/latest>`_.
 
Installation
____________

Download and install latest `PSCouchDB module <https://github.com/MatteoGuadrini/PSCouchDB/zipball/master>`_ by copying it under ``%Windir%\System32\WindowsPowerShell\v1.0\Modules`` for all users or under ``%UserProfile%\Documents\WindowsPowerShell\Modules`` for the current user or install through `PowershellGallery <https://www.powershellgallery.com/packages/PSCouchDB/>`_.

.. note::
    For unix users the powershell module path is ``/usr/local/share/powershell/Modules`` for all users and ``~/.local/share/powershell/Modules`` for current user.

Install with git
****************

Installation by git from Github.

.. code-block:: bash

    git clone https://github.com/MatteoGuadrini/PSCouchDB.git
    cd PSCouchDB
    # for Windows
    copy /Y PSCouchDB %Windir%\System32\WindowsPowerShell\v1.0\Modules\PSCouchDB
    # for Unix
    cp -var PSCouchDB /usr/local/share/powershell/Modules

Signing
_______

.. important::  
    This module is not signed. Before import or execute cmdlet on this module, see `about_signing <https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_signing>`_ session. 
    Verify execution of scripts is allowed with ``Get-ExecutionPolicy`` (should be RemoteSigned or Unrestricted). 
    If scripts are not enabled, run PowerShell as Administrator and call ``Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Confirm``.

Start
_____

To get started, let's look at all the cmdlets in the module through this command: 

.. code-block:: powershell

    Search-CouchDBHelp -Pattern . | Format-Table name -AutoSize

If we wanted to get only the cmdlets for a given task, use:

.. code-block:: powershell

    Search-CouchDBHelp -Pattern replication

and display the help of one the cmdlet found:

.. code-block:: powershell

    Search-CouchDBHelp -Pattern New-CouchDBReplication | Get-Help -Full

or search CouchDB API name:

.. code-block:: powershell

    Search-CouchDBHelp -Pattern _cluster_setup

or help about a module.

.. code-block:: powershell

    Get-Help about_pscouchdb