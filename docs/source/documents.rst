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

    Get-CouchDBDocument -Database test -Document "Hitchhikers" -Authorization "admin:password"

Get partitioned documents
_________________________

.. code-block:: powershell

    Get-CouchDBDocument -Database test -Partition testing -Authorization "admin:password"

In this table you can find all the possible parameters to get the document.

================    ===========
PARAMETER           DESCRIPTION
================    ===========
Revision            The CouchDB revision document.
Local               Return CouchDB local document.
Revisions           Return all CouchDB db revisions.
History             Return all info CouchDB db revisions.
Attachments         Includes attachments bodies in response.
AttachmentsInfo     Includes encoding information in attachment stubs if the particular attachment is compressed.
AttachmentsSince    Includes attachments only since specified revisions. Doesn’t includes attachments for specified revisions.
Conflicts           Includes information about conflicts in document.
DeletedConflicts    Includes information about deleted conflicted revisions.
Latest              Forces retrieving latest “leaf” revision, no matter what rev was requested.
LocalSequence       Includes last update sequence for the document.
Metadata            Acts same as specifying all conflicts, deleted_conflicts and revs_info query parameters.
OpenRevisions       Retrieves documents of specified leaf revisions. Additionally, value all id default and  to return all leaf revisions.
Partition           CouchDB partition name
================    ===========

And if use **_all_docs** view, in this table you can find all the possible parameters.

================    ===========
PARAMETER           DESCRIPTION
================    ===========
Descending          Return the documents in descending by key order. Default is ``false``.
EndKey              Stop returning records when the specified key is reached.
EndKeyDocument      Stop returning records when the specified document ID is reached.
Group				Group the results using the reduce function to a group or single row. Implies reduce is ``true`` and the maximum group_level. Default is ``false``.
GroupLevel			Specify the group level to be used. Implies group is ``true``.
IncludeDocuments	Include the associated document with each row. Default is ``false``.
InclusiveEnd		Specifies whether the specified end key should be included in the result. Default is ``true``.
Key					Return only documents that match the specified key. The document must be _all_docs.
Keys				Return only documents where the key matches one of the keys specified in the array.
Limit				Limit the number of the returned design documents to the specified number.
Reduce				Use the reduction function. Default is true when a reduce function is defined.
Skip				Skip this number of records before starting to return the results.
Sorted				Sort returned rows. Setting this to false offers a performance boost. The total_rows and offset fields are not available when this is set to ``false``. Default is ``true``.
Stable				Whether or not the view results should be returned from a stable set of shards. Default is ``false``.
Stale				Allow the results from a stale view to be used. Supported values: ``ok``, ``update_after and`` ``false``. ``ok`` is equivalent to ``stable=true&update=false``. ``update_after`` is equivalent to ``stable=true&update=lazy``. ``false`` is equivalent to ``stable=false&update=true``.
StartKey			Return records starting with the specified key.
StartKeyDocument	Return records starting with the specified document ID. Ignored if startkey is not set.
Update				Whether or not the view in question should be updated prior to responding to the user. Supported values: ``true``, ``false``, ``lazy``. Default is ``true``.
UpdateSequence		Whether to include in the response an update_seq value indicating the sequence id of the database the view reflects. Default is ``false``.
================    ===========


Create a document
_________________

To creates a new named document, or creates a new revision of the existing document. The ``Data`` parameter it can be a json or a hashtable object.

.. code-block:: powershell

    $data = '{"planet":"Magrathea", "name":"Slartibartfast"}'
    New-CouchDBDocument -Database test -Document "Hitchhikers" -Data $data -Authorization "admin:password"

There is also the possibility of enabling a batch mode.

.. code-block:: powershell

    $data = '{"planet":"Magrathea", "name":"Slartibartfast"}'
    New-CouchDBDocument -Database test -Document "Hitchhikers" -Data $data -BatchMode -Authorization "admin:password"
    Write-CouchDBFullCommit -Database test -Authorization "admin:password"

.. note::
    Until you run the ``Write-CouchDBFullCommit`` cmdlet, the document will not be written to disk but kept only in memory. This can be useful in case of bulk writing.

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

    Get-CouchDBDocument -Database test -Local -Authorization "admin:password"

Get a bulk documents
____________________

This method can be called to query several documents in bulk. 

.. code-block:: powershell

    using module PSCouchDB
    $bdocs = New-Object PSCouchDBBulkDocument -ArgumentList '{"_id":"test"}'
    $bdocs.AddDocument('{"_id":"test1","_rev":"2-9a68ee74a8276c7f11146245ba43676f"}')
    Get-CouchDBBulkDocument -Database test -Data $bdocs -Authorization "admin:password"

or run in background:

.. code-block:: powershell

    using module PSCouchDB
    $bdocs = New-Object PSCouchDBBulkDocument -ArgumentList '{"_id":"test"}'
    $bdocs.AddDocument('{"_id":"test1","_rev":"2-9a68ee74a8276c7f11146245ba43676f"}')
    Get-CouchDBBulkDocument -Database test -Data $bdocs -Authorization "admin:password" -AsJob
    Get-Job -Id 1 | Receive-Job -Keep

Create documents in bulk
________________________

The bulk document API allows you to create and update multiple documents at the same time within a single request.

.. code-block:: powershell

    using module PSCouchDB
    $bdocs = New-Object PSCouchDBBulkDocument -ArgumentList '{"_id":"test","name":"test"}'
    $bdocs.AddDocument('{"_id":"test1","name":"test"}')
    New-CouchDBBulkDocument -Database test -Data $bdocs -Authorization "admin:password"

or run in background:

.. code-block:: powershell

    using module PSCouchDB
    $bdocs = New-Object PSCouchDBBulkDocument -ArgumentList '{"_id":"test","name":"test"}'
    $bdocs.AddDocument('{"_id":"test1","name":"test"}')
    New-CouchDBBulkDocument -Database test -Data $bdocs -Authorization "admin:password" -AsJob
    Get-Job -Id 1 | Receive-Job -Keep


Attachments
___________

Document can includes attachments, then the returned structure will contain a summary of the attachments associated with the document.

Get an attachment
*****************

It’s possible to retrieve document with all attached files content.

.. code-block:: powershell

    Get-CouchDBAttachment -Database test -Document "Hitchhikers" -Attachment test.txt -Authorization "admin:password"

Also is possible save a file.

.. code-block:: powershell

    Get-CouchDBAttachment -Database test -Document "Hitchhikers" -Attachment test.txt -OutFile "C:\out.txt" -Authorization "admin:password"

Or get info of specific attachment.

.. code-block:: powershell

    Get-CouchDBAttachment -Database test -Document "Hitchhikers" -Attachment test.txt -Info -Authorization "admin:password"

Create an attachment
********************

To replace or add an attachment.

.. code-block:: powershell

    Add-CouchDBAttachment -Database test -Document "Hitchhikers" -Attachment "C:\test.txt" -Revision "4-f6d66c4d70da66cded6bea889468eb14" -Authorization "admin:password"

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

    Get-CouchDBDocument -Database test -Document "Hitchhikers" -Revisions -Authorization "admin:password"

Get a history of revisions
**************************

You can get additional information (history) about the revisions for a given document.

.. code-block:: powershell

    Get-CouchDBDocument -Database test -Document "Hitchhikers" -History -Authorization "admin:password"

Get a specific revision
***********************

To get a specific revision, use the ``Revision`` parameter, and specify the full revision number. 

.. code-block:: powershell

    Get-CouchDBDocument -Database test -Document "Hitchhikers" -Revision "5-7bf1766d9a5f3e4a60b400e98d62f523" -Authorization "admin:password"

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

    Find-CouchDBDocuments -Database test -Selector "name" -Operator eq -Value "Arthur Dent" -Fields _id,name,planet -Authorization "admin:password"

or with native Mango query

.. code-block:: powershell

    Find-CouchDBDocuments -Database test -Find '{"selector": {"name":{"$eq":"Arthur Dent"}},"fields":["_id","name","planet"]}' -Authorization "admin:password"

or with class (for complex query)

.. code-block:: powershell

    using module PSCouchDB
    $q = New-Object -TypeName PSCouchDBQuery
    $q.AddSelector("name","Arthur Dent")
    $q.AddSelectorOperator('$eq')
    $q.AddFields("_id")
    $q.AddFields("name")
    $q.AddFields("planet")
    Find-CouchDBDocuments -Database test -Find $q.GetNativeQuery() -Authorization "admin:password"

or search partitioned documents in a database, use the following cmdlet.

.. code-block:: powershell

    Find-CouchDBDocuments -Database test -Partition test -Selector "name" -Operator eq -Value "Arthur Dent" -Fields _id,name,planet

If you want to use Mango queries, follow the next sections. Otherwise you can see more examples in the `Classes section <classes.html>`_.

Search a document
*****************

To perform a more generic search in a database, without knowing the various selectors, use:

.. code-block:: powershell

    Search-CouchDBFullText -Database test -Patterns "space","planet" -Authorization "admin:password"

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
    Find-CouchDBDocuments -Database test -Find $q.GetNativeQuery() -Authorization "admin:password"

.. code-block:: powershell

    Find-CouchDBDocuments -Database test -Selector "name" -Operator eq -Value "Arthur Dent" -Fields _id,name,planet -Authorization "admin:password"

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

    Find-CouchDBDocuments -Database test -Selector "name" -Operator eq -Value "Arthur Dent" -Fields _id,name,planet -Sort name,planet -Authorization "admin:password"

Limit
*****

Maximum number of results returned. Default is 25.

.. code-block:: powershell

    Find-CouchDBDocuments -Database test -Selector "name" -Operator eq -Value "Arthur Dent" -Fields _id,name,planet -Limit 100 -Authorization "admin:password"

Skip
****

Skip the first ‘n’ results, where ‘n’ is the value specified.

.. code-block:: powershell

    Find-CouchDBDocuments -Database test -Selector "name" -Operator eq -Value "Arthur Dent" -Fields _id,name,planet -Skip 10 -Authorization "admin:password"

Use index
*********

Instruct a query to use a specific index.

.. code-block:: powershell

    Find-CouchDBDocuments -Database test -Selector "name" -Operator eq -Value "Arthur Dent" -Fields _id,name,planet -UseIndex "index_planet" -Authorization "admin:password"

Read quorum
***********

Read quorum needed for the result. This defaults to 1, in which case the document found in the index is returned.

If set to a higher value, each document is read from at least that many replicas before it is returned in the results. This is likely to take more time than using only the document stored locally with the index.

.. code-block:: powershell

    Find-CouchDBDocuments -Database test -Selector "name" -Operator eq -Value "Arthur Dent" -Fields _id,name,planet -ReadQuorum 3 -Authorization "admin:password"

Bookmark
********

 A string that enables you to specify which page of results you require. 
 Used for paging through result sets. 
 Every query returns an opaque string under the bookmark key that can then be passed back in a query to get the next page of results. 
 If any part of the selector query changes between requests, the results are undefined. 

.. code-block:: powershell

    Find-CouchDBDocuments -Database test -Selector "name" -Operator eq -Value "Arthur Dent" -Fields _id,name,planet -Bookmark "my_bookmark" -Authorization "admin:password"

No Update
*********

Whether to update the index prior to returning the result. Default is true.

.. code-block:: powershell

    Find-CouchDBDocuments -Database test -Selector "name" -Operator eq -Value "Arthur Dent" -Fields _id,name,planet -NoUpdate -Authorization "admin:password"

Stable
******

Whether or not the view results should be returned from a “stable” set of shards.

.. code-block:: powershell

    Find-CouchDBDocuments -Database test -Selector "name" -Operator eq -Value "Arthur Dent" -Fields _id,name,planet -Stable -Authorization "admin:password"

Stale
*****

Combination of ``update=false`` and ``stable=true`` options. Possible options: ``"ok"``

.. code-block:: powershell

    Find-CouchDBDocuments -Database test -Selector "name" -Operator eq -Value "Arthur Dent" -Fields _id,name,planet -Stale 'ok' -Authorization "admin:password"

Execution statistics
********************

Include execution statistics in the query response.

.. code-block:: powershell

    Find-CouchDBDocuments -Database test -Selector "name" -Operator eq -Value "Arthur Dent" -Fields _id,name,planet -ExecutionStats -Authorization "admin:password"

Explain
*******

Shows which index is being used by the query.

.. code-block:: powershell

    Find-CouchDBDocuments -Database test -Selector "name" -Operator eq -Value "Arthur Dent" -Fields _id,name,planet -Sort name,planet -Explain -Authorization "admin:password"