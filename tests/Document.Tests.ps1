BeforeAll {
    Import-Module ../PSCouchDB/PSCouchDB.psm1
    . ../PSCouchDB/functions/CouchDBdocument.ps1
    New-CouchDBDatabase -Database test -Authorization "admin:password"
}

Describe "Get-CouchDBDocument" {
    It "Get a document." {
        (Get-CouchDBDocument -Database test -Document "Hitchhikers")._id | Should -Be "Hitchhikers"
    }
}

Describe "New-CouchDBDocument" {
    It "Create a new document." {
        $data = @{"answer"=42; "ask"="Ultimate Question of Life, the Universe and Everything"}
        (New-CouchDBDocument -Database test -Document "Hitchhikers" -Data $data -Partition Guide -Authorization "admin:password").ok | Should -Be 'true'
    }
}

AfterAll {
    Remove-CouchDBDatabase -Database test -Authorization "admin:password" -Force
}