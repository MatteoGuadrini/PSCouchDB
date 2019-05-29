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

Documents
=========

All documents are contained in a database. Each document is in json format.

Get a document
______________

To get document by the specified ``Document`` from the specified ``Database``. Unless you request a specific revision, the latest revision of the document will always be returned.

.. code-block:: powershell

    Get-CouchDBDocument -Database test -Document "Hitchhikers"

Create a document
_________________

To creates a new named document, or creates a new revision of the existing document. The ``Data`` parameter it can be a json or a hashtable object.

.. code-block:: powershell

    $data = '{"planet":"Magrathea", "name":"Slartibartfast"}'
    New-CouchDBDocument -Database test -Document "Hitchhikers" -Data $data -Authorization "admin:password"

Modify a document
__________________

With ``Revision`` parameter it is possible to overwrite the document. The document retain the previously written elements. If an item is specified again, it will be overwritten.

.. code-block:: powershell

    $data = @{"answer"=42; "ask"="Ultimate Question of Life, the Universe and Everything"}
    Set-CouchDBDocument -Database test -Document "Hitchhikers" -Revision 1-2c903913030efb4d711db085b1f44107 -Data $data -Authorization "admin:password"

With ``Replace`` parameter, the document is re-write again.

.. code-block:: powershell

    $data = '{"planet":"Heart", "name":"Arthur Dent"}'
    Set-CouchDBDocument -Database test -Document "Hitchhikers" -Revision 2-9a68ee74a8276c7f11146245ba43676f -Data $data -Replace -Authorization "admin:password"

Delete a document
__________________

To delete a document, specify ``Revision`` parameter.

.. note::
    CouchDB doesn’t completely delete the specified document. Instead, it leaves a tombstone with very basic information about the document. The tombstone is required so that the delete action can be replicated across databases.

.. code-block:: powershell

    Remove-CouchDBDocument -Database test -Document "Hitchhikers" -Revision "3-399796e5ce019e04311637e8a8a0f402" -Authorization "admin:password"

Copy a document
_______________

Copies an existing document to a new or existing document. Copying a document is only possible within the same database.

.. code-block:: powershell

    Copy-CouchDBDocument -Database test -Document "Hitchhikers" -Destination "Hitchhikers Guide" -Authorization "admin:password"
    Copy-CouchDBDocument -Database test -Document "Hitchhikers" -Destination "Hitchhikers Guide _deleted" -Revision 3-399796e5ce019e04311637e8a8a0f402 -Authorization "admin:password"

Local document
______________

To get of all of the local documents in a given database. 

.. code-block:: powershell

    Get-CouchDBDocument -Database test -Local

Get a bulk documents
____________________

This method can be called to query several documents in bulk. 

.. code-block:: powershell

    Get-CouchDBBulkDocument -Database test -Document "Hitchhikers","Hitchhikers Guide _deleted","Hitchhikers Guide"

Create documents in bulk
________________________

The bulk document API allows you to create and update multiple documents at the same time within a single request.

.. code-block:: powershell

    Set-CouchDBBulkDocument -Database test -Document "Hitchhikers","Hitchhikers_new","Hitchhikers Guide" -Revision 4-7051cbe5c8faecd085a3fa619e6e6337,$null,3-399796e5ce019e04311637e8a8a0f402 -Authorization "admin:password"

Attachments
___________

Document can includes attachments, then the returned structure will contain a summary of the attachments associated with the document.

Get an attachment
*****************

It’s possible to retrieve document with all attached files content.

.. code-block:: powershell

    Get-CouchDBAttachment -Database test -Document "Hitchhikers" -Attachment test.txt

Also is possible save a file.

.. code-block:: powershell

    Get-CouchDBAttachment -Database test -Document "Hitchhikers" -Attachment test.txt -OutFile "C:\out.txt"

Or get info of specific attachment.

.. code-block:: powershell

    Get-CouchDBAttachment -Database test -Document "Hitchhikers" -Attachment test.txt -Info

Create an attachment
********************

It’s possible to retrieve document with all attached files content.

.. code-block:: powershell

    New-CouchDBAttachment -Database test -Document "Hitchhikers" -Attachment "C:\test.txt" -Revision "4-f6d66c4d70da66cded6bea889468eb14" -Authorization "admin:password"

Modify an attachment
********************

To replace or add an attachment.

.. code-block:: powershell

    Set-CouchDBAttachment -Database test -Document "Hitchhikers" -Attachment "C:\out.txt" -Authorization "admin:password"

Delete an attachment
********************

To remove an attachment.

.. code-block:: powershell

    Remove-CouchDBAttachment -Database test -Document "Hitchhikers" -Attachment out.txt -Revision "5-7bf1766d9a5f3e4a60b400e98d62f523" -Authorization "admin:password"

Revisions
_________

Get a list of revisions
***********************

You can obtain a list of the revisions for a given document.

.. code-block:: powershell

    Get-CouchDBDocument -Database test -Document "Hitchhikers" -Revisions

Get a history of revisions
**************************

You can get additional information (history) about the revisions for a given document.

.. code-block:: powershell

    Get-CouchDBDocument -Database test -Document "Hitchhikers" -History

Get a specific revision
***********************

To get a specific revision, use the ``Revision`` parameter, and specify the full revision number. 

.. code-block:: powershell

    Get-CouchDBDocument -Database test -Document "Hitchhikers" -Revision "5-7bf1766d9a5f3e4a60b400e98d62f523"

Missing revision
****************

With given a list of document revisions, returns the document revisions that do not exist in the database.

.. code-block:: powershell

    Get-CouchDBMissingRevision -Database test -Document "Hitchhikers" -Revision 2-7051cbe5c8faecd085a3fa619e6e6337,5-7bf1766d9a5f3e4a60b400e98d62f523 -Authorization "admin:password"

Purge document
______________

A database purge permanently removes the references to documents in the database. 
Normal deletion of a document within CouchDB does not remove the document from the database, instead, the document is marked as _deleted=true (and a new revision is created). 
This is to ensure that deleted documents can be replicated to other databases as having been deleted. 

.. code-block:: powershell

    Clear-CouchDBDocuments -Database test -Document "Hitchhikers" -Authorization "admin:password"

Query
=====

Find a document
_______________

To search for documents in a database, use the following cmdlet.

.. code-block:: powershell

    Find-CouchDBDocuments -Database test -Selector "name" -Operator eq -Value "Arthur Dent" -Fields _id,name,planet

or with native Mango query

.. code-block:: powershell

    Find-CouchDBDocuments -Database test -Find '{"selector": {"name":{"$eq":"Arthur Dent"}},"fields":["_id","name","planet"]}'

or with class (for complex query)

.. code-block:: powershell

    using module PSCouchDB
    $q = New-Object -TypeName PSCouchDBQuery
    $q.AddSelector("name","Arthur Dent")
    $q.AddSelectorOperator('$eq')
    $q.AddFields("_id")
    $q.AddFields("name")
    $q.AddFields("planet")
    Find-CouchDBDocuments -Database test -Find $q.GetNativeQuery()

If you want to use Mango queries, follow the next sections. Otherwise you can see more examples in the `Classes section <classes.html>`_.

Search a document
*****************

To perform a more generic search in a database, without knowing the various selectors, use:

.. code-block:: powershell

    Search-CouchDBFullText -Database test -Patterns "space","planet"

.. warning::
    This search is much slower than the ``Find-CouchdbDocuments`` cmdlet.

Selector
********

Selectors are expressed as a JSON object describing documents of interest. Within this structure, you can apply conditional logic using specially named fields.

.. code-block:: json

    {
        "selector": {
            "name": "Arthur Dent"
        }
    }

.. code-block:: json

    {
        "selector": {
            "name": {
                "FirstName": "Arthur Dent"
            }
        }
    }

    {
        "selector": {
            "name.FirstName": "Arthur Dent"
        }
    }

Operators
*********

Operators are identified by the use of a dollar sign ($) prefix in the name field.
There are two core types of operators in the selector syntax:

*   Combination operators
*   Condition operators

.. code-block:: json

    {
        "selector": {
            "name": "Arthur Dent"
        }
    }

There are two implicit operators:

*   Equality
*   And

In a selector, any field containing a JSON value, but that has no operators in it, is considered to be an equality condition. The implicit equality test applies also for fields and subfields.

.. code-block:: json

    {
        "selector": {
            "name": {
                "$eq": "Arthur Dent"
            }
        }
    }

is same to

.. code-block:: json

    {
        "selector": {
            "name": "Arthur Dent"
        }
    }

List of available operators:

+---------------+----------+--------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Operator type | Operator | Purpose                                                                                                                                                      |
+===============+==========+==============================================================================================================================================================+
| (In)equality  | lt       | The field is less than the argument                                                                                                                          |
+---------------+----------+--------------------------------------------------------------------------------------------------------------------------------------------------------------+
|               | lte      | The field is less than or equal to the argument                                                                                                              |
+---------------+----------+--------------------------------------------------------------------------------------------------------------------------------------------------------------+
|               | eq       | The field is equal to the argument                                                                                                                           |
+---------------+----------+--------------------------------------------------------------------------------------------------------------------------------------------------------------+
|               | ne       | The field is not equal to the argument                                                                                                                       |
+---------------+----------+--------------------------------------------------------------------------------------------------------------------------------------------------------------+
|               | gte      | The field is greater than or equal to the argument                                                                                                           |
+---------------+----------+--------------------------------------------------------------------------------------------------------------------------------------------------------------+
|               | gt       | The field is greater than the to the argument                                                                                                                |
+---------------+----------+--------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Object        | exists   | Check whether the field exists or not, regardless                                                                                                            |
+---------------+----------+--------------------------------------------------------------------------------------------------------------------------------------------------------------+
|               | type     | Check the document field’s type. Valid values are "null", "boolean", "number", "string", "array", and "object"                                               |
+---------------+----------+--------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Array         | in       | The document field must exist in the list provided                                                                                                           |
+---------------+----------+--------------------------------------------------------------------------------------------------------------------------------------------------------------+
|               | nin      | The document field not must exist in the list provided                                                                                                       |
+---------------+----------+--------------------------------------------------------------------------------------------------------------------------------------------------------------+
|               | size     | Special condition to match the length of an array field in a document. Non-array fields cannot match this condition                                          |
+---------------+----------+--------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Miscellaneous | mod      | Divisor and Remainder are both positive or negative integers. Non-integer values result in a 404.                                                            |
+---------------+----------+--------------------------------------------------------------------------------------------------------------------------------------------------------------+
|               | regex    | A regular expression pattern to match against the document field.The matching algorithms are based on the Perl Compatible Regular Expression (PCRE) library. |
+---------------+----------+--------------------------------------------------------------------------------------------------------------------------------------------------------------+

Examples

.. code-block:: powershell

    using module PSCouchDB
    $q = New-Object -TypeName PSCouchDBQuery
    $q.AddSelector("name","Arthur Dent")
    $q.AddSelectorOperator('$eq')
    $q.AddFields("_id")
    $q.AddFields("name")
    $q.AddFields("planet")
    Find-CouchDBDocuments -Database test -Find $q.GetNativeQuery()

.. code-block:: powershell

    Find-CouchDBDocuments -Database test -Selector "name" -Operator eq -Value "Arthur Dent" -Fields _id,name,planet

.. warning::
    Pay attention to the ``$`` (dollar) sign. If you use the PSCouchDBQuery class or a native query, the sign is required.


Logical operators
*****************

Logical operators are used to combine selectors.

.. important::
    Logical operators are only avalaible when creating an object of type ``PSCouchDBQuery`` or use a native query string. 
    For more details, see `Classes section <classes.html>`_ section. 

AND

.. code-block:: json

    {
        "$and": [
            {
                "_id": { "$gt": null }
            },
            {
                "name": {
                    "$eq": "Arthur Dent"
                }
            }
        ]
    }

OR

.. code-block:: json

    {
        "name": "Arthur Dent",
        "$or": [
            { "planet": "Heart" },
            { "planet": "Magrathea" }
        ]
    }

NOT 

.. code-block:: json

    {
        "name": {
            "$eq": "Arthur Dent"
        },
        "name": {
            "$eq": "Slartibartfast"
        },
        "$not": {
            "name": "Ford Prefect"
        }
    }

+-----------+---------------------------------------------------------------------------------------------------------------------------------------+
| Operator  | Purpose                                                                                                                               |
+===========+=======================================================================================================================================+
| and       | Matches if all the selectors in the array match                                                                                       |
+-----------+---------------------------------------------------------------------------------------------------------------------------------------+
| or        | Matches if any of the selectors in the array match. All selectors must use the same index                                             |
+-----------+---------------------------------------------------------------------------------------------------------------------------------------+
| not       | Matches if the given selector does not match                                                                                          |
+-----------+---------------------------------------------------------------------------------------------------------------------------------------+
| nor       | Matches if none of the selectors in the array match                                                                                   |
+-----------+---------------------------------------------------------------------------------------------------------------------------------------+
| all       | Matches an array value if it contains all the elements of the argument array                                                          |
+-----------+---------------------------------------------------------------------------------------------------------------------------------------+
| elemMatch | Matches and returns all documents that contain an array field with at least one element that matches all the specified query criteria |
+-----------+---------------------------------------------------------------------------------------------------------------------------------------+
| allMatch  | Matches and returns all documents that contain an array field with all its elements matching all the specified query criteria         |
+-----------+---------------------------------------------------------------------------------------------------------------------------------------+

Sort
****

The sort field contains a list of field name and direction pairs, expressed as a basic array. The first field name and direction pair is the topmost level of sort. The second pair, if provided, is the next level of sort.
The direction value is "asc" for ascending, and "desc" for descending. If you omit the direction value, the default "asc" is used.

.. code-block:: json

    {
        "selector": {"name": "Arthur Dent"},
        "sort": [{"name": "asc"}, {"planet": "asc"}]
    }

.. code-block:: powershell

    Find-CouchDBDocuments -Database test -Selector "name" -Operator eq -Value "Arthur Dent" -Fields _id,name,planet -Sort name,planet

Limit
*****

Maximum number of results returned. Default is 25.

.. code-block:: powershell

    Find-CouchDBDocuments -Database test -Selector "name" -Operator eq -Value "Arthur Dent" -Fields _id,name,planet -Limit 100

Skip
****

Skip the first ‘n’ results, where ‘n’ is the value specified.

.. code-block:: powershell

    Find-CouchDBDocuments -Database test -Selector "name" -Operator eq -Value "Arthur Dent" -Fields _id,name,planet -Skip 10

Use index
*********

Instruct a query to use a specific index.

.. code-block:: powershell

    Find-CouchDBDocuments -Database test -Selector "name" -Operator eq -Value "Arthur Dent" -Fields _id,name,planet -UseIndex "index_planet"

Read quorum
***********

Read quorum needed for the result. This defaults to 1, in which case the document found in the index is returned.

If set to a higher value, each document is read from at least that many replicas before it is returned in the results. This is likely to take more time than using only the document stored locally with the index.

.. code-block:: powershell

    Find-CouchDBDocuments -Database test -Selector "name" -Operator eq -Value "Arthur Dent" -Fields _id,name,planet -ReadQuorum 3

Bookmark
********

 A string that enables you to specify which page of results you require. 
 Used for paging through result sets. 
 Every query returns an opaque string under the bookmark key that can then be passed back in a query to get the next page of results. 
 If any part of the selector query changes between requests, the results are undefined. 

.. code-block:: powershell

    Find-CouchDBDocuments -Database test -Selector "name" -Operator eq -Value "Arthur Dent" -Fields _id,name,planet -Bookmark "my_bookmark"

No Update
*********

Whether to update the index prior to returning the result. Default is true.

.. code-block:: powershell

    Find-CouchDBDocuments -Database test -Selector "name" -Operator eq -Value "Arthur Dent" -Fields _id,name,planet -NoUpdate

Stable
******

Whether or not the view results should be returned from a “stable” set of shards.

.. code-block:: powershell

    Find-CouchDBDocuments -Database test -Selector "name" -Operator eq -Value "Arthur Dent" -Fields _id,name,planet -Stable

Stale
*****

Combination of ``update=false`` and ``stable=true`` options. Possible options: ``"ok"``

.. code-block:: powershell

    Find-CouchDBDocuments -Database test -Selector "name" -Operator eq -Value "Arthur Dent" -Fields _id,name,planet -Stale 'ok'

Execution statistics
********************

Include execution statistics in the query response.

.. code-block:: powershell

    Find-CouchDBDocuments -Database test -Selector "name" -Operator eq -Value "Arthur Dent" -Fields _id,name,planet -ExecutionStats

Explain
*******

Shows which index is being used by the query.

.. code-block:: powershell

    Find-CouchDBDocuments -Database test -Selector "name" -Operator eq -Value "Arthur Dent" -Fields _id,name,planet -Sort name,planet -Explain