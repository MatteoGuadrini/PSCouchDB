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

Classes
=======

PSCouchDB module has powershell classes that can be used to construct certain objects.

PSCouchDBQuery class
____________________

This class is used to construct a query object that is compatible with Mango core.

Properties
**********

.. code-block:: powershell

    bookmark            Property   string bookmark {get;set;}
    execution_stats     Property   bool execution_stats {get;set;}
    fields              Property   array fields {get;set;}
    limit               Property   int limit {get;set;}
    r                   Property   int r {get;set;}
    selector            Property   hashtable selector {get;set;}
    skip                Property   int skip {get;set;}
    sort                Property   array sort {get;set;}
    stable              Property   bool stable {get;set;}
    stale               Property   string stale {get;set;}
    update              Property   bool update {get;set;}
    use_index           Property   array use_index {get;set;}


Methods
*******

.. code-block:: powershell

    AddFields           Method     void AddFields(System.Object fields)
    AddIndexies         Method     void AddIndexies(System.Object indexies)
    AddLogicalOperator  Method     void AddLogicalOperator(System.Object operator)
    AddSelector         Method     void AddSelector(System.Object key, System.Object value)
    AddSelectorOperator Method     void AddSelectorOperator(System.Object operator), void AddSelectorOperator(System.Object operator, System.Object key, System.Object value)
    AddSortAsc          Method     void AddSortAsc(System.Object selector)
    AddSortDesc         Method     void AddSortDesc(System.Object selector)
    DisableUpdate       Method     void DisableUpdate()
    Equals              Method     bool Equals(System.Object obj)
    GetHashCode         Method     int GetHashCode()
    GetNativeQuery      Method     string GetNativeQuery()
    GetType             Method     type GetType()
    RemoveFields        Method     void RemoveFields(), void RemoveFields(System.Object field)
    RemoveIndexies      Method     void RemoveIndexies(), void RemoveIndexies(System.Object index)
    RemoveSelector      Method     void RemoveSelector(System.Object key)
    RemoveSort          Method     void RemoveSort(), void RemoveSort(System.Object sort)
    ReplaceSelector     Method     void ReplaceSelector(System.Object key, System.Object value)
    SetBookmark         Method     void SetBookmark(System.Object bookmark)
    SetExecutionStat    Method     void SetExecutionStat(System.Object bool)
    SetLimit            Method     void SetLimit(System.Object limit)
    SetReadQuorum       Method     void SetReadQuorum(System.Object r)
    SetSkip             Method     void SetSkip(System.Object skip)
    SetStable           Method     void SetStable(System.Object bool)
    SetStale            Method     void SetStale()
    ToString            Method     string ToString()

Build a query
*************

To create a ``PSCouchDBQuery`` object, just do the following.

.. code-block:: powershell

    using module PSCouchDB
    $query = New-Object -TypeName PSCouchDBQuery
    $query.GetType()

Work with selector
******************

A CouchDB query is interpreted by Mango engine, so must have some elements. *Selector* is first our element which allows to have a search criterion.

Add selector
^^^^^^^^^^^^

To add one selector to object using *AddSelector* method.

.. code-block:: powershell

    $query.AddSelector('key', 'value')

The search criterion and its exact ``key`` and your ``value``. Now, to verify our query, just get the json, with this method *GetNativeQuery*.

.. code-block:: powershell

    $query.GetNativeQuery()

Remove selector
^^^^^^^^^^^^^^^

If we were wrong to enter the values, it will be enough to remove them with *RemoveSelector* and then insert them again.

.. code-block:: powershell

    $query.RemoveSelector('key')
    $query.AddSelector('answer', 42)

Replace selector
^^^^^^^^^^^^^^^^

Instead if we were wrong to enter only the value of our search key, just do a replace, using the *ReplaceSelector* method

.. code-block:: powershell

    $query.ReplaceSelector('answer', 43)

Limit and Skip
**************

To limit or skip line of query result, set the values with the appropriate methods, *SetLimit* and *SetSkip*.

.. code-block:: powershell

    $query.SetLimit(5)
    $query.SetSkip(1)

To remove the set values, just set them to null.

.. code-block:: powershell

    $query.limit = $null
    $query.skip = $null

Sort
****

To add a sort criterion, use the *AddSortAsc* method for ascending and *AddSortDesc* for the descendant.

.. code-block:: powershell

    $query.AddSortAsc('answer')
    $query.AddSortDesc('answer')

To reset the sort, just remove sorting with *RemoveSort*.

.. code-block:: powershell

    $query.RemoveSort()
    $query.RemoveSort('answer')

Fields
******

Fields are the values that return from the query. To add them with *AddFields*.

.. code-block:: powershell

    $query.AddFields('_id')
    $query.AddFields('_rev')
    $query.AddFields('answer')

To remove all fields use *RemoveFields*.

.. code-block:: powershell

    $query.RemoveFields()

To remove manually one or more fields.

.. code-block:: powershell

    $query.RemoveFields('_rev')

Indexies
********

To configure indexes created previously with `New-CouchDBIndex <databases.html#create-a-new-index>`_.

.. code-block:: powershell

    $query.AddIndexies('test-index')

To remove all indexes or one.

.. code-block:: powershell

    $query.RemoveIndexies()
    $query.RemoveIndexies('test-index')

ReadQuorum
**********

To set *ReadQuorum*.

.. code-block:: powershell

    $query.SetReadQuorum(2)

To remove it.

.. code-block:: powershell

    $query.r = $null

Bookmark
********

To configure bookmarks created previously.

.. code-block:: powershell

    $query.SetBookmark('mybookmark')

To remove it.

.. code-block:: powershell

    $query.bookmark = $null

Update, Stable and Stale
************************

*Update* is enabled by default. To disable it.

.. code-block:: powershell

    $query.DisableUpdate()

To re-enabled it.

.. code-block:: powershell

    $query.update = $true

To enable *stable*.

.. code-block:: powershell

    $query.SetStable($true) #or $query.SetStable(1)

To disable it.

.. code-block:: powershell

    $query.SetStable($false) #or $query.SetStable(0)

*stale* properties, basically sets *update* to ``false`` and *stable* to ``true``.

.. code-block:: powershell

    $query.SetStale()

To restore all changes.

.. code-block:: powershell

    $query.update = $true
    $query.stable = $false
    $query.stale = $null

ExecutionStat
*************

To return execution statistic, just enable it.

.. code-block:: powershell

    $query.SetExecutionStat($true) #or $query.SetExecutionStat(1)

To disable it.

.. code-block:: powershell

    $query.SetExecutionStat($false) #or $query.SetExecutionStat(0)

Selector Operators
******************

The selector operators that can be used are the following: ``$lt,$lte,$eq,$ne,$gte,$gt,$exists,$type,$in,$nin,$size,$mod,$regex`` (see `operator table <documents.html#operators>`_). 
The method *AddSelectorOperator* works in two ways: by specifying only the operator, so it will be applied to all the selector; 
by specifying the selector and the value that you want to associate.

$lt,$lte,$eq,$ne,$gte,$gt
^^^^^^^^^^^^^^^^^^^^^^^^^

The implicit operator used is ``$eq``. The *AddSelectorOperator* method append operators at the designated selector.

.. code-block:: powershell

    $query.AddSelectorOperator('$eq')
    Find-CouchDBDocuments -Database test -Find $query.GetNativeQuery()

To change operator or restore changes.

.. code-block:: powershell

    $query.ReplaceSelector('answer', 42) #to restore only this
    $query.AddSelectorOperator('$lt')
    Find-CouchDBDocuments -Database test -Find $query.GetNativeQuery()

$exists,$type,$in,$nin,$size,$mod
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

With these operators we must also specify the selector we want and its value.

.. code-block:: powershell

    $query.AddSelectorOperator('$exists','answer','true')
    #or
    $query.AddSelectorOperator('$type','answer','string')
    #or
    $query.AddSelector('name','Arthur')
    $query.AddSelector('planet',@('Heart','Magrathea'))
    $query.AddSelectorOperator('$in','planet','Magrathea')
    #or
    $query.AddSelectorOperator('$nin','planet','Vogsphere')
    #or apply operator for all selector
    $query.ReplaceSelector('answer',43)
    $query.ReplaceSelector('name','Arthur')
    $query.ReplaceSelector('planet',@('heart','magrathea'))
    $query.AddSelectorOperator('$in')
    Find-CouchDBDocuments -Database test -Find $query.GetNativeQuery()

$regex
^^^^^^
CouchDB support regular expression (BRE and ERE).

.. code-block:: powershell

    $query.AddSelector('name','Arthur')
    $query.AddSelector('planet',@('Heart','Magrathea'))
    $query.AddSelectorOperator('$regex','name','^[Aa]r{1}[th]{2}.r$')

Logical operators
*****************

PSCouchDBQuery object support logical operators; these are the allowed operators: ``$and,$or,$not,$nor,$all,$elemMatch,$allMatch`` (see `logical operator table <documents.html#logical-operators>`_).

$and,$or,$not,$nor
^^^^^^^^^^^^^^^^^^

With method *AddLogicalOperator* logical conditions can be added.

.. code-block:: powershell

    $query.AddSelector('answer',43)
    $query.AddSelector('name','Arthur')
    $query.AddSelector('planet',@('Heart','Magrathea'))
    $query.AddLogicalOperator('$or')
    Find-CouchDBDocuments -Database test -Find $query.GetNativeQuery()

$all,$elemMatch,$allMatch
^^^^^^^^^^^^^^^^^^^^^^^^^

With these logical operators, return a single or all matches.

.. code-block:: powershell

    $query.AddSelector('name','Arthur')
    $query.AddLogicalOperator('$elemMatch')
    Find-CouchDBDocuments -Database test -Find $query.GetNativeQuery()

Native query format (Mango)
***************************

To receive the object in native format (Mango query) use the *GetNativeQuery* method.

. code-block:: powershell

    $query.GetNativeQuery()

PSCouchDBDesignDoc class
________________________

This class is used to construct a design documents, simple or complex.

Properties
**********

.. code-block:: powershell

    lists               Property   hashtable lists {get;set;}
    shows               Property   hashtable shows {get;set;}
    validate_doc_update Property   string validate_doc_update {get;set;}
    views               Property   hashtable views {get;set;}


Methods
*******

.. code-block:: powershell

    AddList             Method     void AddList(System.Object name)
    AddShow             Method     void AddShow(System.Object name), void AddShow(System.Object name, System.Object key)...
    AddValidation       Method     void AddValidation(array requirements), void AddValidation(array requirements, System...
    AddView             Method     void AddView(System.Object name), void AddView(System.Object name, System.Object key)...
    Equals              Method     bool Equals(System.Object obj)
    GetDesignDocuments  Method     string GetDesignDocuments()
    GetHashCode         Method     int GetHashCode()
    GetType             Method     type GetType()
    SetName             Method     void SetName(System.Object name)
    ToString            Method     string ToString()

Build a design document
***********************

To create a ``PSCouchDBDesignDoc`` object, just do the following.

.. code-block:: powershell

    using module PSCouchDB
    $ddoc = New-Object -TypeName PSCouchDBDesignDoc
    $ddoc.GetType()

Work with views
***************

Views are the primary tool used for querying and reporting on CouchDB documents. With *AddView* it is possible to add four types of predefined views.

Simple view
^^^^^^^^^^^

.. code-block:: powershell

    $ddoc.AddView('myview')
    
View if document key exists
^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code-block:: powershell

    $ddoc.AddView('myviewexists','key')

View if document key exists and your value is value specified
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code-block:: powershell

    $ddoc.AddView('myviewvalue','key','value')

View if document key exists and your value is value specified, and return entire doc
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code-block:: powershell

    $ddoc.AddView('myviewdoc','key','value',$true)


Work with Lists
***************

List functions are used to represent documents in various formats, commonly as HTML pages with nice formatting.
Use *AddList* for add one list or more. List functions they need at least one view.

.. code-block:: powershell

    $ddoc.AddList("mylist")

Work with Shows
***************

With *AddShow* it is possible to add three types of predefined show function. Only one function is allowed at a time.

Simple show
^^^^^^^^^^^

.. code-block:: powershell

    $ddoc.AddShow("myshow")

Show if document key exists
^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code-block:: powershell

    # reset object
    $ddoc = New-Object -TypeName PSCouchDBDesignDoc
    $ddoc.AddShow("myshow","key")

Show if document key exists and your value is value specified
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code-block:: powershell

    # reset object
    $ddoc = New-Object -TypeName PSCouchDBDesignDoc
    $$ddoc.AddShow("myshow","key","value")

Work with validation
********************

A design document may contain a function named ``validate_doc_update`` which can be used to prevent invalid or unauthorized document update requests from being stored. 
Use *AddValidation* for add one. Only one function is allowed at a time.

.. code-block:: powershell

    $ddoc.AddValidation("myvalidation")
    #or add also user authorization
    $ddoc.AddValidation("myvalidation",$true)

Native design document
**********************

To receive the design document in native format use the *GetDesignDocuments* method.

.. code-block:: powershell

    $ddoc.GetDesignDocuments()

Create design document
**********************

See `Create design document <ddoc.html#custom-functions>`_.

.. code-block:: powershell

    New-CouchDBDesignDocument -Database test -Document "mydesigndoc" -Data $ddoc.GetDesignDocuments() -Authorization "admin:password"