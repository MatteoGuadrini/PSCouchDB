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