BeforeAll {
    Import-Module ../PSCouchDB/PSCouchDB.psm1
    . ../PSCouchDB/functions/CouchDBdatabase.ps1
}

Describe "Test-CouchDBDatabase" {
    It "Test if database exists." {
        Test-CouchDBDatabase -Database _users | Should -BeLike '*'
    }
}