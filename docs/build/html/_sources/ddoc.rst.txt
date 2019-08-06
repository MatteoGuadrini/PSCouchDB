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

Design documents
================

In CouchDB, design documents provide the main interface for building a CouchDB application. 
The design document defines the views used to extract information from CouchDB through one or more views. 
Design documents are created within your CouchDB instance in the same way as you create database documents, 
but the content and definition of the documents is different.

Get a design document
_____________________

Returns the contents of the design document specified with the name of the design document and from the specified database. 
Unless you request a specific revision, the latest revision of the document will always be returned.

.. code-block:: powershell

    Get-CouchDBDesignDocument -Database test -Document "space"

To get all the Design Documents in a database.

.. code-block:: powershell

    Get-CouchDBDatabaseDesignDocument -Database test

Design document attachment
**************************

To retrieve or save an attachment in a design document.

.. code-block:: powershell

    Get-CouchDBDesignDocumentAttachment -Database test2 -Document space -Attachment test.txt -OutFile

Creates a design document
_________________________

Creates a new named design document.

.. code-block:: powershell

    New-CouchDBDesignDocument -Database test -Document "space" -ViewName "planet_view" -Authorization "admin:password"

Views
*****

The definition of a view within a design document also creates an index based on the key information defined within each view. The production and use of the index significantly increases the speed of access and searching or selecting documents from the view.
However, the index is not updated when new documents are added or modified in the database.
View indexes are updated incrementally in the following situations:

* A new document has been added to the database.
* A document has been deleted from the database.
* A document in the database has been updated.

.. code-block:: powershell

    New-CouchDBDesignDocument -Database test -Document space -ViewName planet -ViewKey planet -Authorization "admin:password"
    Set-CouchDBDesignDocument -Database test -Document space -ViewName planet_heart -ViewKey planet -ViewValue "Heart" -Authorization "admin:password"
    Set-CouchDBDesignDocument -Database test -Document space -ViewName planet_heart -ViewKey planet -ViewValue "Heart2" -Authorization "admin:password"

Now, navigate with your favorite browser to ``http://localhost:5984/test/_design/space/_view/planet`` or

.. code-block:: powershell

    Get-CouchDBDocument -Database test -Document "_design/space/_view/planet"

List
****

Applies list function for the view function from the same design document.

.. code-block:: powershell

    New-CouchDBDesignDocument -Database test -Document space -ViewName planet -ListName planet_list -Authorization "admin:password"

Now, navigate with your favorite browser to ``http://localhost:5984/test/_design/space/_list/planet_list/planet`` or

.. code-block:: powershell

    $html = Get-CouchDBDocument -Database test -Document "_design/space/_list/planet_list/planet"
    $html.html.body.table.tr | fl

Show
****

Show functions are used to represent documents as HTML pages with nice formatting. 
They can also be used to run server-side functions without requiring a pre-existing document.

.. code-block:: powershell

    New-CouchDBDesignDocument -Database test -Document space -ShowName planet -Authorization "admin:password"
    Set-CouchDBDesignDocument -Database test -Document space -ShowName planet -ShowKey planet -Authorization "admin:password"
    Set-CouchDBDesignDocument -Database test -Document space -ShowName planet -ShowKey planet -ShowValue "Heart" -Authorization "admin:password"

Now, navigate with your favorite browser to ``http://localhost:5984/test/_design/space/_show/planet/Hitchhikers`` or

.. code-block:: powershell

    Get-CouchDBDocument -Database test -Document "_design/space/_show/planet/Hitchhikers"

Validation
**********

A design document may contain a function named ``validate_doc_update`` which can be used to prevent invalid or unauthorized document update requests from being stored.
Only one function is allowed at a time.

.. code-block:: powershell

    New-CouchDBDesignDocument -Database test -Document space -ValidationRequirements planet -Authorization "admin:password"
    Set-CouchDBDesignDocument -Database test -Document space -ValidationRequirements name,planet -ValidationAuthor -Replace -Authorization "admin:password"

Now try to creates a new document without validation element

.. code-block:: powershell

    $data = '{"planet":"Magrathea"}'
    New-CouchDBDocument -Database test -Document "Test_Validation" -Data $data -Authorization "admin:password"

Received an error: ``Invoke-RestMethod : {"error":"forbidden","reason":"Document must have a name"}``. Now retry with this:

.. code-block:: powershell

    $data = '{"planet":"Magrathea", "name":"Slartibartfast"}'
    New-CouchDBDocument -Database test -Document "Test_Validation" -Data $data -Authorization "admin:password"

.. note::
    Note that for this type of function, when you want to modify a design document, you need to specify the ``-Replace`` parameter, otherwise the function will not be changed.

Custom functions
****************

It is also possible to define a custom Design Document, creating a here string that defines the document itself.

.. code-block:: powershell

    $ddoc = @'
    {
        "language": "javascript",
        "views": {
            "all": {
                "map": "function(doc) { emit(doc.title, doc) }"
            },
            "by_title": {
                "map": "function(doc) { if (doc.title != null) emit(doc.title, doc) }"
            },
            "by_planet": {
                "map": "function(doc) { for(i=0;i<doc.keywords.lenghth();i++) { emit(doc.keywords[i], doc); } }"
            }
        },
        "shows": {
            "planet": "function(doc, req) { return '<h1>' + doc.title + '</h1>' }"
        }
    }
    '@
    New-CouchDBDesignDocument -Database test -Document space -Data $ddoc -Authorization "admin:password"

Create design document attachment
*********************************

To create an attachment in a design document.

.. code-block:: powershell

    New-CouchDBDesignDocumentAttachment -Database test -Document space -Attachment "C:\test.txt" -Revision 3-cfae968df80635ad15a9709e0264a988 -Authorization "admin:password"

Compress design document
________________________

The compaction operation is the way to reduce disk space usage by removing unused and old data from database or view index files. 
This operation is very similar to the vacuum (SQLite ex.) operation available for other database management systems.

.. code-block:: powershell

    Compress-CouchDBDesignDocument -Database test -DesignDoc space -Authorization "admin:password"

Remove design document
______________________

To remove a design document.

.. code-block:: powershell

    Remove-CouchDBDesignDocument -Database test -Document "mydesigndoc" -Revision "1-85a961d0d9b235b7b4f07baed1a38fda" -Authorization "admin:password"