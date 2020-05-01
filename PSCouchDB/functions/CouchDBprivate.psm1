function Send-CouchDBRequest {
    <#
    .SYNOPSIS
    Send a request through rest method to CouchDB server.
    .DESCRIPTION
    This command builds the url and data and uses Invoke 
    to pass the CouchDB API call.
    .PARAMETER Method
    The REST method. Default is "GET".
    The avalaible methods are:
    "HEAD","GET","PUT","DELETE","POST"
    .PARAMETER Server
    The CouchDB server name. Default is localhost.
    This takes part in the url here: 
    http://{server}.
    .PARAMETER Port
    The CouchDB server port. Default is 5984.
    This takes part in the url here: 
    http://localhost:{port}.
    .PARAMETER Database
    The CouchDB database. This takes part in the url here: 
    http://localhost:5984/{database}.
    .PARAMETER Document
    The CouchDB document. This takes part in the url here: 
    http://localhost:5984/db/{document}.
    .PARAMETER Authorization
    The CouchDB authorization form; user and password.
    Authorization format like this: user:password
    ATTENTION: if the password is not specified, it will be prompted.
    When the authorization parameter is first specified, a 
    session variable is created ($couchdb_session) that lasts the entire 
    powershell session. The next calls can be made without
    specifying the authorization parameter, 
    if you do not have to change users.
    This takes part in the url here: 
    http://{authorization}@localhost:5984.
    .PARAMETER Revision
    The CouchDB revision document.
    The revision document format like this: {count}-{uuid}
    2-b91bb807b4685080c6a651115ff558f5
    This takes part in the url here: 
    http://localhost:5984/db/doc?rev={revision}.
    .PARAMETER Attachment
    The CouchDB document attachment. Is a ContentType -> multipart/form-data
    and InFile -> path of attachment.
    .PARAMETER Data
    The CouchDB document data. Is a Json data format.
    The encoding is UTF-8.
    .PARAMETER OutFile
    Path of download attachment file.
    .PARAMETER Ssl
    Set ssl connection on CouchDB server.
    This modify protocol to https and port to 6984.
    https://localhost:6984.
    .EXAMPLE
    This example get a database "db":
    Send-CouchDBRequest -Server couchdb1.local -Method "GET" -Database db
    .EXAMPLE
    This example get a document "doc1" on database "db":
    Send-CouchDBRequest -Server couchdb1.local -Method "GET" -Database db -Document doc1
    .EXAMPLE
    This example get a document "doc1" on database "db" on "localhost" server in SSL connection:
    Send-CouchDBRequest -Method "GET" -Database db -Document doc1 -Ssl:$true
    .LINK
    Invoke-RestMethod
    #>
    [CmdletBinding()]
    param (
        [ValidateSet("HEAD", "GET", "PUT", "DELETE", "POST")] [string] $Method,
        [string] $Server,
        [int] $Port,
        [string] $Database,
        [string] $Document,
        [string] $Authorization,
        [string] $Revision,
        [string] $Attachment,
        [string] $Data,
        [string] $OutFile,
        [switch] $Ssl
    )
    # Set default server
    Write-Verbose -Message "Check if variable `$Server is null, else set variable to 'localhost'"
    if (-not($Server)) {
        $Server = 'localhost'
        Write-Debug -Message "`$Server is $Server"
    }
    # Set protocol
    Write-Verbose -Message "Check if SSL is enable"
    if ($Ssl.IsPresent) {
        # Set default port
        Write-Verbose -Message "Check if variable `$Port is null, else set variable to '6984'"
        if (-not($Port)) {
            $Port = 6984
            Write-Debug -Message "`$Port is $Port"
        }
        # Set SSL protocol
        $Protocol = 'https'
        Write-Debug -Message "`$Protocol is $Protocol"
    } else {
        # Set default port
        Write-Verbose -Message "Check if variable `$Port is null, else set variable to '5984'"
        if (-not($Port)) {
            $Port = 5984
            Write-Debug -Message "`$Port is $Port"
        }
        # Set deafult protocol
        $Protocol = 'http'
        Write-Debug -Message "`$Protocol is $Protocol"
    }
    # Initialize option of command
    $options = @{ }
    # Analize method for web request
    Write-Verbose -Message "Check http method, default is GET"
    Write-Debug -Message "`$Method is $Method"
    switch ($Method) {
        "HEAD" { $options.Add("Method", "HEAD") }
        "GET" { $options.Add("Method", "GET") }
        "PUT" { $options.Add("Method", "PUT") }
        "DELETE" { $options.Add("Method", "DELETE") }
        "POST" { $options.Add("Method", "POST") }
        Default { $options.Add("Method", "GET") }
    }
    # Build the url
    Write-Verbose -Message "Build the url"
    $url = "${Protocol}://${Server}:$Port"
    # Set database
    Write-Verbose -Message "Add database to url, if exists"
    if ($Database) {
        $url += "/$Database"
        Write-Debug -Message "`$Database is $Database"
    }
    # Set document
    Write-Verbose -Message "Add document to url, if exists"
    if (($Document) -and ($Database)) {
        $url += "/$Document"
        Write-Debug -Message "`$Document is $Document"
    }
    # Set attachment
    Write-Verbose -Message "Add attachment to url, if exists"
    if (($Attachment) -and ($Document) -and ($Database)) {
        Write-Debug -Message "`$Attachment is $Attachment"
        if (Test-Path $Attachment) {
            $AttachmentName = (Get-Item $Attachment).Name
            $options.Add("ContentType", "multipart/form-data")
            $options.Add("InFile", $Attachment)
            Write-Debug -Message "Tested attachment path $Attachment"
        } else {
            $AttachmentName = $Attachment
            Write-Debug -Message "Tested name of attachment $AttachmentName"
            if ($OutFile) {
                $options.Add("OutFile", $OutFile)
                Write-Debug -Message "Get attachment $AttachmentName to file $OutFile"
            }
        }
        $url += "/$AttachmentName"
    }
    # Check revision
    Write-Verbose -Message "Add revision to url, if exists"
    if ($Revision) {
        $url += "?rev=$Revision"
        Write-Debug -Message "`$Revision is $Revision"
    }
    # Add url
    Write-Verbose -Message "Compose the url: $url"
    $options.Add("Uri", $url)
    # Check session
    if (-not($couchdb_session) -or ($Authorization)) {
        # Check the credential for access on database
        $cred = $Authorization -split ":"
        if (-not($cred[1]) -and ($cred[0])) { 
            $password = ConvertTo-CouchDBPassword -SecurePassword (Read-Host "Enter password for $($cred[0])" -AsSecureString)
            $Authorization = "$($cred[0]):${password}".Replace(" ", "")
            Remove-Variable -Name password
        }
        Write-Verbose -Message "Check authorization"
        $base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(($Authorization)))
        $options.Add("Headers", @{Authorization = ("Basic {0}" -f $base64AuthInfo) })
        Write-Debug -Message "`$Authorization is $Authorization"
        $options.Add("SessionVariable", "couchdb_session")
    } else {
        $options.Add("WebSession", $couchdb_session)
    }
    # Build the json data
    Write-Verbose -Message "Check json data"
    if (($Data) -and ($Database)) {
        $options.Add("ContentType", "application/json")
        $options.Add("Body", ([System.Text.Encoding]::UTF8.GetBytes($Data)))
        Write-Debug -Message "`$Data is $Data"
        Write-Verbose -Message "`$Data is $Data"
    }
    # Check return header or not
    if ($Method -eq "HEAD") {
        # Invoke WEB request
        Write-Verbose -Message "Finally, send request to CouchDB server $Server"
        $results = Invoke-WebRequest @options
        Set-Variable -Name couchdb_session -Value $couchdb_session -Scope Global
    } else {
        # Invoke REST method
        Write-Verbose -Message "Finally, send request to CouchDB server $Server"
        $results = Invoke-RestMethod @options
        Set-Variable -Name couchdb_session -Value $couchdb_session -Scope Global
        
    }
    return $results
}

function ConvertTo-CouchDBPassword ([SecureString] $SecurePassword) {
    <#
    .SYNOPSIS
    Convert SecureString.
    .DESCRIPTION
    Convert to SecureString to simple string.
    .PARAMETER SecurePassword
    Password format in [SecureString].
    .EXAMPLE
    $password = "password" | ConvertTo-SecureString -AsPlainText -Force
    ConvertTo-CouchDBPassword -SecurePassword $password
    This example return a readable password.
    .LINK
    https://pscouchdb.readthedocs.io/en/latest/permission.html#create-admin-user
    #>
    $BSTR = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($SecurePassword)
    $UnsecurePassword = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)
    return $UnsecurePassword
}