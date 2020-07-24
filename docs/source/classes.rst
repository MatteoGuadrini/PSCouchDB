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

Create an PSCouchDB object
__________________________

To create every object defined in PSCouchDB module, use this.

.. code-block:: powershell

    $query = New-CouchDBObject -TypeName PSCouchDBRequest
    $query.GetType()

PSCouchDBRequest class
______________________

This class is used to construct a http request object.

Properties
**********

.. code-block:: powershell

    authorization    Property   pscredential authorization {get;set;}
    data             Property   string data {get;set;}
    database         Property   string database {get;set;}
    document         Property   string document {get;set;}
    method           Property   string method {get;set;}
    parameter        Property   string parameter {get;set;}
    port             Property   int port {get;set;}
    protocol         Property   string protocol {get;set;}
    server           Property   string server {get;set;}
    uri              Property   System.UriBuilder uri {get;set;}

Methods
*******

.. code-block:: powershell

    AddAuthorization Method     void AddAuthorization(pscredential credential), void AddAuthorization(string auth)
    ClearCache       Method     void ClearCache()
    DisableCache     Method     void DisableCache()
    EnableCache      Method     void EnableCache()
    Equals           Method     bool Equals(System.Object obj)
    GetData          Method     string GetData()
    GetHashCode      Method     int GetHashCode()
    GetHeader        Method     string GetHeader()
    GetStatus        Method     int GetStatus()
    GetType          Method     type GetType()
    GetUri           Method     uri GetUri()
    Request          Method     psobject Request()
    RequestAsJob     Method     void RequestAsJob(string name)
    SetData          Method     void SetData(string json)
    SetDatabase      Method     void SetDatabase(string database)
    SetDocument      Method     void SetDocument(string document)
    SetMethod        Method     void SetMethod(string method)
    SetParameter     Method     void SetParameter(array parameter)
    SetPort          Method     void SetPort(int port)
    SetServer        Method     void SetServer(string server)
    SetSsl           Method     void SetSsl(), void SetSsl(int port)
    ToString         Method     string ToString()

Build a request
***************

To create a ``PSCouchDBRequest`` object, just do the following.

.. code-block:: powershell

    using module PSCouchDB
    $req = New-Object -TypeName PSCouchDBRequest                            # GET http://localhost:5984/
    $req = New-Object -TypeName PSCouchDBRequest -ArgumentList 'db'         # GET http://localhost:5984/db
    $req = New-Object -TypeName PSCouchDBRequest -ArgumentList 'db','doc1'  # GET http://localhost:5984/db/doc1
    $req.GetType()

Set server
**********

To set a different server (default is localhost).

.. code-block:: powershell

    $req.SetServer('cdb1.local')    # FQDN
    $req.SetServer('127.0.0.15')    # ip address

Set port
********

To set a different port (default is 5984).

.. code-block:: powershell

    $req.SetPort(8080)

Set SSL
*******

To set a SSL https.

.. code-block:: powershell

    $req.SetSsl()       # https on 6984
    $req.SetSsl(443)    # https on 443

Set a method
************

Default method is GET. To set other method, run this.

.. code-block:: powershell

    $req.SetMethod('PUT')

Add authorization
*****************

To add authorization with two methods.

.. code-block:: powershell

    $req.AddAuthorization('admin:password')     # string version
    [string]$userName = 'admin'
    [string]$userPassword = 'password'
    [securestring]$secStringPassword = ConvertTo-SecureString $userPassword -AsPlainText -Force
    [pscredential]$credOject = New-Object System.Management.Automation.PSCredential ($userName, $secStringPassword)
    $req.AddAuthorization($credOject)           # PSCredential object version

Set database
************

To set a database on the URI object.

.. code-block:: powershell

    $req.SetDatabase('db')

Set document
************

To set a document on the URI object.

.. code-block:: powershell

    $req.SetDocument('doc')

Set parameter
*************

To set a parameter on the URI object.

.. code-block:: powershell

    $req.SetParameter('param')                  # single param string
    $req.SetParameter('param1=true')            # key=value param string
    $req.SetParameter(@('param','param1=true')) # array param

Set data
********

To set a json data.

.. code-block:: powershell

    $data = @"
    {
        "doc_ids": [
            "test"
        ]
    }
    "@
    $req.SetData($Data)
    $req.GetData()      # verify json data

Get Uri
*******

.. code-block:: powershell

    $req.GetUri()

Get request header
******************

To get a request header.

.. code-block:: powershell

    $req.GetHeader()

Get status code
***************

To get a status code of last request.

.. code-block:: powershell

    $req.GetStatus()

Get request
***********

To get a result of request.

.. code-block:: powershell

    $req.Request()

Get request in background
*************************

To send a request in background like daemon or job.

.. code-block:: powershell

    $req.RequestAsJob('name of job')

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

.. code-block:: powershell

    $query.GetNativeQuery()

PSCouchDBDocument class
_______________________

This class is used to construct a documents.

Properties
**********

.. code-block:: powershell

    _id           Property   string _id {get;set;}
    _rev          Property   string _rev {get;set;}
    _attachments  Property   hashtable _attachments {get;set;}


Methods
*******

.. code-block:: powershell

    AddAttachment        Method     void AddAttachment(PSCouchDBAttachment attachment), void AddAttachment(string attachment)
    Equals               Method     bool Equals(System.Object obj)
    FromJson             Method     hashtable FromJson(string json)
    GetDocument          Method     hashtable GetDocument()
    GetHashCode          Method     int GetHashCode()
    GetType              Method     type GetType()
    RemoveAllAttachments Method     void RemoveAllAttachments()
    RemoveAttachment     Method     void RemoveAttachment(string attachment)
    RemoveElement        Method     void RemoveElement(string key)
    ReplaceAttachment    Method     void ReplaceAttachment(PSCouchDBAttachment attachment), void ReplaceAttachment(string attachment)
    SetElement           Method     void SetElement(string key), void SetElement(string key, System.Object value)
    ToJson               Method     string ToJson(), string ToJson(int depth), string ToJson(int depth, bool compress)
    ToString             Method     string ToString()

Build a document
****************

To create a ``PSCouchDBDocument`` object, just do the following.

.. code-block:: powershell

    using module PSCouchDB
    $doc = New-Object -TypeName PSCouchDBDocument
    $doc.GetType()

Add element to document
^^^^^^^^^^^^^^^^^^^^^^^

Add one element to our document object.

.. code-block:: powershell

    $doc.SetElement("test")              # New key "test" with empty value
    $doc.SetElement("test1", "value1")   # New key "test1" with value "value1"

Modify element to document
^^^^^^^^^^^^^^^^^^^^^^^^^^

Modify or add an exists element on document object.

.. code-block:: powershell

    $doc.SetElement("test", "newvalue")

Remove element to document
^^^^^^^^^^^^^^^^^^^^^^^^^^

Delete an exists element on document object.

.. code-block:: powershell

    $doc.RemoveElement("test")

View document
^^^^^^^^^^^^^

To view entire element of document object.

.. code-block:: powershell

    $doc.GetDocument()

Get json document
^^^^^^^^^^^^^^^^^

To get json representation of document object.

.. code-block:: powershell

    $doc.ToJson()

Add one attachment
^^^^^^^^^^^^^^^^^^

Add an attachment to doc object.

.. code-block:: powershell

    $doc.AddAttachment('C:\test.txt')   # string option
    $attachment = New-Object PSCouchDBAttachment -ArgumentList 'C:\test.txt'
    $doc.AddAttachment($attachment)     # PSCouchDBAttachment option

Replace one attachment
^^^^^^^^^^^^^^^^^^^^^^

Replace an attachment to doc object.

.. code-block:: powershell

    $doc.ReplaceAttachment('C:\test.txt')   # string option
    $attachment = New-Object PSCouchDBAttachment -ArgumentList 'C:\test.txt'
    $doc.ReplaceAttachment($attachment)     # PSCouchDBAttachment option

Remove one attachment
^^^^^^^^^^^^^^^^^^^^^

Remove an attachment to doc object.

.. code-block:: powershell

    $doc.RemoveAttachment('test.txt')

Remove all attachments
^^^^^^^^^^^^^^^^^^^^^^

Remove all attachments to doc object.

.. code-block:: powershell

    $doc.RemoveAllAttachments()


PSCouchDBAttachment class
_________________________

This class is used to construct an attachment documents.

Properties
**********

.. code-block:: powershell

    content_type Property   string content_type {get;set;}
    filename     Property   string filename {get;set;}


Methods
*******

.. code-block:: powershell

    Equals       Method     bool Equals(System.Object obj)
    GetData      Method     string GetData()
    SaveData     Method     void GetData()
    GetHashCode  Method     int GetHashCode()
    GetType      Method     type GetType()
    ToString     Method     string ToString()

Build an attachment
*******************

To create a ``PSCouchDBAttachment`` object, just do the following.

.. code-block:: powershell

    using module PSCouchDB
    $attachment = New-Object PSCouchDBAttachment -ArgumentList "C:\test\test.log"
    $attachment.GetType()

Get content of an attachment
****************************

Get content of an attachment of a documents

.. code-block:: powershell

    $attachment.GetData()

Attach a file to document
*************************

Create document object ``PSCouchDBDocument`` with attachment

.. code-block:: powershell

    $attach = New-Object PSCouchDBAttachment -ArgumentList "C:\test\test.log"
    $doc1 = New-Object PSCouchDBDocument -ArgumentList '122', '1-2c903913030efb4d711db085b1f44107', "C:\test\test.log"
    $doc2 = New-Object PSCouchDBDocument -ArgumentList '122', '1-2c903913030efb4d711db085b1f44107', $attach
    $doc1.GetDocument()
    $doc2.GetDocument()

PSCouchDBBulkDocument class
___________________________

This class is used to construct an bulk documents.

Properties
**********

.. code-block:: powershell

    docs           Property   PSCouchDBDocument[] docs {get;set;}

Methods
*******

.. code-block:: powershell

    AddDocument    Method     void AddDocument(string doc), void AddDocument(PSCouchDBDocument doc)
    Equals         Method     bool Equals(System.Object obj)
    GetDocuments   Method     PSCouchDBDocument[] GetDocuments()
    GetHashCode    Method     int GetHashCode()
    GetType        Method     type GetType()
    RemoveDocument Method     void RemoveDocument(string _id)
    SetDeleted     Method     void SetDeleted()
    ToString       Method     string ToString()

Create bulk document
********************

Create a bulk document.

.. code-block:: powershell

    using module PSCouchDB
    $bdocs = New-Object PSCouchDBBulkDocument
    $bdocs.GetType()

You can create also a bulk document with one or more documents.

.. code-block:: powershell

    using module PSCouchDB
    $doc120 = New-Object PSCouchDBDocument -ArgumentList '120'
    $doc121 = New-Object PSCouchDBDocument -ArgumentList '121'
    $doc122 = New-Object PSCouchDBDocument -ArgumentList '122'
    # One document
    $bdocs = New-Object PSCouchDBBulkDocument -ArgumentList $doc120                             # PSCouchDBDocument
    $bdocs = New-Object PSCouchDBBulkDocument -ArgumentList '{"_id":"test","name":"test"}'      # JSON
    # Two or more documents
    $bdocs = [PSCouchDBBulkDocument]@{docs=@($doc120,$doc121,$doc122)}
    $bdocs.GetType()

Add document
************

To add document to bulk documents.

.. code-block:: powershell

    $bdocs.AddDocument($doc120)                         # PSCouchDBDocument
    $bdocs.AddDocument('{"_id":"test","name":"test"}')  # JSON

Remove document
***************

To remove document to bulk documents.

.. code-block:: powershell

    $bdocs.RemoveDocument('120')      # _id of document

PSCouchDBSecurity class
_______________________

This class is used to construct a security database documents.

Properties
**********

.. code-block:: powershell

    admins           Property   psobject admins {get;set;}
    members          Property   psobject members {get;set;}

Methods
*******

.. code-block:: powershell

    AddAdmins        Method     void AddAdmins(string name), void AddAdmins(array name), void AddAdmins(string name, str...
    AddMembers       Method     void AddMembers(string name), void AddMembers(array name), void AddMembers(string name, ...
    Equals           Method     bool Equals(System.Object obj)
    GetAdmins        Method     hashtable GetAdmins()
    GetHashCode      Method     int GetHashCode()
    GetMembers       Method     hashtable GetMembers()
    GetType          Method     type GetType()
    RemoveAdminName  Method     void RemoveAdminName(string name)
    RemoveAdminRole  Method     void RemoveAdminRole(string role)
    RemoveMemberName Method     void RemoveMemberName(string name)
    RemoveMemberRole Method     void RemoveMemberRole(string role)
    ToJson           Method     string ToJson()
    ToString         Method     string ToString()

Create security document
************************

Create a security document for assign permission to a database.

.. code-block:: powershell

    using module PSCouchDB
    $sec = New-Object PSCouchDBSecurity
    $sec.GetType()

Get admins
**********

To get all admin names and roles.

.. code-block:: powershell

    $sec.GetAdmins()

Get members
***********

To get all member names and roles.

.. code-block:: powershell

    $sec.GetMembers()

Add admins
**********

Add one or more admin names and roles to security object.

.. code-block:: powershell

    $sec.AddAdmins('root')                                      # add admin name
    $sec.AddAdmins('root', 'roots')                             # add admin name and role
    $sec.AddAdmins(@('root', 'admin'))                          # add admin names
    $sec.AddAdmins(@('root', 'admin'), @('roots', 'admins'))    # add admin names and roles

Add members
***********

Add one or more member names and roles to security object.

.. code-block:: powershell

    $sec.AddMembers('member1')                                      # add member name
    $sec.AddMembers('member1', 'access')                            # add member name and role
    $sec.AddMembers(@('member1', 'member2'))                        # add member names
    $sec.AddMembers(@('member1', 'member2'), @('access', 'read'))   # add member names and roles

Remove admin
************

Remove one admin to security object.

.. code-block:: powershell

    $sec.RemoveAdminName('root')    # remove member name
    $sec.RemoveAdminRole('roots')   # remove member role

Remove member
*************

Remove one member to security object.

.. code-block:: powershell

    $sec.RemoveMemberName('member1')    # remove member name
    $sec.RemoveMemberRole('access')     # remove member role

Get json
********

To get json string to security object.

.. code-block:: powershell

    $sec.ToJson()

PSCouchDBReplication class
__________________________

This class is used to construct a replica database documents.

Properties
**********

.. code-block:: powershell

    continuous              Property   bool continuous {get;set;}
    source                  Property   System.UriBuilder source {get;set;}
    target                  Property   System.UriBuilder target {get;set;}
    _id                     Property   string _id {get;set;}
    _rev                    Property   string _rev {get;set;}

Methods
*******

.. code-block:: powershell

    AddDocIds               Method     void AddDocIds(array ids)
    AddSourceAuthentication Method     void AddSourceAuthentication(string user, string passwd)
    AddTargetAuthentication Method     void AddTargetAuthentication(string user, string passwd)
    CreateTarget            Method     void CreateTarget()
    Equals                  Method     bool Equals(System.Object obj)
    GetDocument             Method     hashtable GetDocument()
    GetHashCode             Method     int GetHashCode()
    GetType                 Method     type GetType()
    SetCancel               Method     void SetCancel()
    SetCheckpointInterval   Method     void SetCheckpointInterval(int ms)
    SetContinuous           Method     void SetContinuous()
    SetFilter               Method     void SetFilter(string filter)
    SetQueryParams          Method     void SetQueryParams(hashtable paramaters)
    SetRevision             Method     void SetRevision(string revision)
    SetSelector             Method     void SetSelector(string selector)
    SetSinceSequence        Method     void SetSinceSequence(string sequence)
    SetSourceProxy          Method     void SetSourceProxy(string proxyUri)
    SetSourceServer         Method     void SetSourceServer(string server)
    SetSourceSsl            Method     void SetSourceSsl(), void SetSourceSsl(int port)
    SetTargetProxy          Method     void SetTargetProxy(string proxyUri)
    SetTargetServer         Method     void SetTargetServer(string server)
    SetTargetSsl            Method     void SetTargetSsl(), void SetTargetSsl(int port)
    ToJson                  Method     string ToJson()
    ToString                Method     string ToString()
    UseCheckpoints          Method     void UseCheckpoints()

Create replication document
***************************

Create a replication document.

.. code-block:: powershell

    using module PSCouchDB
    $rep = New-Object PSCouchDBReplication -ArgumentList 'db','repdb'
    $rep.GetType()

Set revision
************

Set revision to replication document.

.. code-block:: powershell

    $rep.SetRevision("1-f6d66c4d70da66cded6bea889468eb14")

Set authentication
******************

Add authentication for source and target database.

.. code-block:: powershell

    $rep.AddSourceAuthentication("admin","password") # Source
    $rep.AddTargetAuthentication("admin","password") # Target

Set SSL
*******

Set SSL (https protocol) for source and target database.

.. code-block:: powershell

    $rep.SetSourceSsl() # Source
    $rep.SetTargetSsl(443) # Target, specifying port

Set server
**********

Set server (default localhost) for source and target database.

.. code-block:: powershell

    $rep.SetSourceServer('db1.local') # Source
    $rep.SetTargetServer('db2.local') # Target, specifying port

Set cancel operation
********************

Set cancel flag for request replica operation.

.. code-block:: powershell

    $rep.SetCancel()

Set continuous replica
**********************

Set continuous flag for replica operation.

.. code-block:: powershell

    $rep.SetContinuous()

Other flag for replica
**********************

.. code-block:: powershell

    $rep.SetCheckpointInterval(300) # checkpoint interval in milliseconds
    $rep.CreateTarget()             # create target database
    $rep.AddDocIds('test','test2')  # replicate only ids specified
    $rep.SetFilter()                # set filter function (ddoc/filter format)
    $rep.SetSourceProxy()           # set source proxy server
    $rep.SetTargetProxy()           # set target proxy server
    $rep.SetQueryParams()           # set query for filter function
    $rep.SetSelector()              # set selector (see PSCouchDBQuery)
    $rep.SetSinceSequence()         # set since sequence
    $rep.UseCheckpoints()           # use checkpoint for replication

Get replication document
************************

Get the replication document.

.. code-block:: powershell

    $rep.GetDocument()  # hashtable format
    $rep.ToJson()       # json format


PSCouchDBView class
___________________

This class is used to construct a view.

Properties
**********

.. code-block:: powershell

    map                   Property   string map {get;set;}
    name                  Property   string name {get;set;}
    reduce                Property   string reduce {get;set;}
    view                  Property   psobject view {get;set;}


Methods
*******

.. code-block:: powershell

    AddMapFunction        Method     void AddMapFunction(string function)
    AddReduceFunction     Method     void AddReduceFunction(string function)
    BuilMapFunction       Method     string [PSCouchDBView]::BuilMapFunction(hashtable condition)
    Equals                Method     bool Equals(System.Object obj)
    GetHashCode           Method     int GetHashCode()
    GetJsonView           Method     string GetJsonView()
    GetType               Method     type GetType()
    GetView               Method     hashtable GetView()
    RemoveMapFunction     Method     void RemoveMapFunction()
    RemoveReduceFunction  Method     void RemoveReduceFunction()
    ReplaceMapFunction    Method     void ReplaceMapFunction(string function)
    ReplaceReduceFunction Method     void ReplaceReduceFunction(string function)
    ToString              Method     string ToString()

Build a view
************

To create a ``PSCouchDBView`` object, just do the following.

.. code-block:: powershell

    using module PSCouchDB
    $view = New-Object PSCouchDBView -ArgumentList "test_view"
    $doc.GetType()

Get view
********

Get content of view, in two methods.

.. code-block:: powershell

    $view.GetView()     # hashtable content
    $view.GetJsonView() # string json content

Add function
************

Add one map function to view object.

.. code-block:: powershell

    $view.AddMapFunction("function(doc) { emit(doc.name, doc.age); }")          # add first map function
    $view.ReplaceMapFunction("function(doc) { emit(doc.name, doc.surname); }")  # replace exists map function

Add one reduce function to view object.
The sets valid for the reduce functions are: ``_approx_count_distinct``,``_count``,``_stats``,``_sum``

.. code-block:: powershell

    $view.AddReduceFunction("_sum")             # add first reduce function
    $view.ReplaceReduceFunction("_count")       # replace exists reduce function

Remove function
***************

Remove exists map function to view object.

.. code-block:: powershell

    $view.RemoveMapFunction()

Remove exists reduce function to view object.

.. code-block:: powershell

    $view.RemoveReduceFunction()

Build a map function
********************

This object have a method than permit to create a simple map function.
Before, create a condition hashtable.

.. code-block:: powershell

    $condition = @{
            EQUAL = 'doc.field1 == 0';  # Add if condition to function: if (doc.field1 == 0) {}
            EQUEMIT = 'doc.field1';     # Add emit function to if equal condition: if (doc.field1 == 0) {emit(doc.field1)}
            MINIMUM = 'doc.field1 < 0'; # Add if condition to function: if (doc.field1 < 0) {}
            MINEMIT = 'doc.field2';     # Add emit function to if equal condition: if (doc.field1 < 0) {emit(doc.field1)}
            MAXIMUM = 'doc.field1 > 0'; # Add if condition to function: if (doc.field1 > 0) {}
            MAXEMIT = 'doc.field3';     # Add emit function to if equal condition: if (doc.field1 > 0) {emit(doc.field1)}
            EMITDOC = "doc"             # If other emit is specified, this is null
        }

Now pass this hashtable like argument to method.

.. code-block:: powershell

    $map = [PSCouchDBView]::BuildMapFunction($condition)

PSCouchDBDesignDoc class
________________________

This class is used to construct a design documents, simple or complex.

Properties
**********

.. code-block:: powershell

    validate_doc_update  Property   string validate_doc_update {get;set;}
    views                Property   System.Object views {get;set;}
    _attachments         Property   hashtable _attachments {get;set;}
    _id                  Property   string _id {get;set;}
    _rev                 Property   string _rev {get;set;}


Methods
*******

.. code-block:: powershell

    AddAttachment        Method     void AddAttachment(PSCouchDBAttachment attachment), void AddAttachment(string attach...
    AddView              Method     void AddView(PSCouchDBView view), void AddView(string name, string map), void AddVie...
    Equals               Method     bool Equals(System.Object obj)
    FromJson             Method     hashtable FromJson(string json)
    GetDocument          Method     hashtable GetDocument()
    GetHashCode          Method     int GetHashCode()
    GetType              Method     type GetType()
    RemoveAllAttachments Method     void RemoveAllAttachments()
    RemoveAttachment     Method     void RemoveAttachment(string attachment)
    RemoveElement        Method     void RemoveElement(string key)
    RemoveView           Method     void RemoveView(string name)
    ReplaceAttachment    Method     void ReplaceAttachment(PSCouchDBAttachment attachment), void ReplaceAttachment(strin...
    ReplaceView          Method     void ReplaceView(PSCouchDBView view), void ReplaceView(string name, string map), voi...
    SetElement           Method     void SetElement(string key), void SetElement(string key, string value)
    SetValidateFunction  Method     void SetValidateFunction(string function)
    ToJson               Method     string ToJson(), string ToJson(int depth), string ToJson(int depth, bool compress)
    ToString             Method     string ToString()

Build a design document
***********************

To create a ``PSCouchDBDesignDoc`` object, just do the following.

.. code-block:: powershell

    using module PSCouchDB
    $ddoc = New-Object -TypeName PSCouchDBDesignDoc
    $ddoc.GetType()

Work with views
***************

Views are the primary tool used for querying and reporting on CouchDB documents. With *AddView* it is possible to add map and reduce function.

Add map function
^^^^^^^^^^^^^^^^

.. code-block:: powershell

    $ddoc.AddView('myview', 'function(doc){emit(doc);}')
    
Add reduce function
^^^^^^^^^^^^^^^^^^^

.. code-block:: powershell

    $ddoc.AddView('myview', 'function(doc){emit(doc);}', '_count')

Add view object
^^^^^^^^^^^^^^^

.. code-block:: powershell

    $view = New-Object PSCouchDBView -ArgumentList "myview"
    $view.AddMapFunction("function(doc) { emit(doc.name, doc.age); }")
    $view.AddReduceFunction("_sum")
    $ddoc.AddView($view)

Work with validation
********************

A design document may contain a function named ``validate_doc_update`` which can be used to prevent invalid or unauthorized document update requests from being stored. 
Use *AddValidation* for add one. Only one function is allowed at a time.

.. code-block:: powershell

    $ddoc.SetValidateFunction('function(newDoc, oldDoc, userCtx, secObj) {if (newDoc.type == "post") {// validation logic for posts}}')

Native design document
**********************

To receive the design document in native format use the *ToJson* method.

.. code-block:: powershell

    $ddoc.ToJson()

Create design document
**********************

See `Create design document <ddoc.html#custom-functions>`_.

.. code-block:: powershell

    New-CouchDBDesignDocument -Database test -Document "mydesigndoc" -Data $ddoc.ToJson() -Authorization "admin:password"