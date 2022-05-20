BeforeAll {
    Import-Module ../PSCouchDB/PSCouchDB.psm1
    . ../PSCouchDB/functions/CouchDBdocument.ps1
    New-CouchDBDatabase -Database test -Authorization "admin:password"
}

Describe "New-CouchDBDocument" {
    It "Create a new document." {
        $data = @{"answer"=42; "ask"="Ultimate Question of Life, the Universe and Everything"}
        (New-CouchDBDocument -Database test -Document "Hitchhikers" -Data $data -Partition Guide -Authorization "admin:password").ok | Should -Be 'true'
    }
}

Describe "Get-CouchDBDocument" {
    It "Get a document." {
        (Get-CouchDBDocument -Database test -Document "Hitchhikers")._id | Should -Be "Hitchhikers"
    }
}

Describe "Set-CouchDBDocument" {
    It "Modify a document." {
        $data = @{"answer"=43; "ask"="Ultimate Question of Life, the Universe and Everything"}
        (Set-CouchDBDocument -Database test -Document "Hitchhikers" -Revision (Get-CouchDBDocument -Database test -Document "Hitchhikers")._rev -Data $data -Authorization "admin:password").ok | Should -Be 'true'
    }
}

Describe "Remove-CouchDBDocument" {
    It "Remove a document.." {
        (Remove-CouchDBDocument -Database test -Document "Hitchhikers" -Revision (Get-CouchDBDocument -Database test -Document "Hitchhikers")._rev -Force -Authorization "admin:password").ok | Should -Be 'true'
    }
}

AfterAll {
    Remove-CouchDBDatabase -Database test -Authorization "admin:password" -Force
}