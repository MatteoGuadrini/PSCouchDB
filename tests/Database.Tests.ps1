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

Describe "New-CouchDBIndex" {
    It "Create a new index on database." {
        (New-CouchDBIndex -Database test -Name "test_index" -Fields name,surname -Authorization "admin:password").result | Should -Be "created"
    }
}

Describe "Get-CouchDBIndex" {
    It "Get indexes on database." {
        (Get-CouchDBIndex -Database test).indexes | Should -BeLike "*"
    }
}

Describe "Remove-CouchDBDatabase" {
    It "Remove a database." {
        (Remove-CouchDBDatabase -Database test -Authorization "admin:password").ok | Should -Be "true"
        (Remove-CouchDBDatabase -Database test_new -Authorization "admin:password").ok | Should -Be "true"
    }
}