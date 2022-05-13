BeforeAll {
    Import-Module ../PSCouchDB/PSCouchDB.psm1
    . ../PSCouchDB/functions/CouchDBdatabase.ps1
}

Describe "New-CouchDBDatabase" {
    It "Create a new database." {
        (New-CouchDBDatabase -Database test -Authorization "admin:password").ok | Should -Be "true"
    }
}

Describe "Test-CouchDBDatabase" {
    It "Test if database exists." {
        Test-CouchDBDatabase -Database test | Should -BeLike '*'
    }
}

Describe "Get-CouchDBDatabase" {
    It "Get a database information." {
        (Get-CouchDBDatabase -Database test).db_name | Should -Be "test"
    }
}

Describe "Copy-CouchDBDatabase" {
    It "Copy database." {
        Copy-CouchDBDatabase -Database test -Destination test_new -Authorization admin:password
        (Get-CouchDBDatabase -Database test_new).db_name | Should -Be "test_new"
    }
}

Describe "Remove-CouchDBDatabase" {
    It "Remove a database." {
        (Remove-CouchDBDatabase -Database test -Authorization "admin:password").ok | Should -Be "true"
        (Remove-CouchDBDatabase -Database test_new -Authorization "admin:password").ok | Should -Be "true"
    }
}