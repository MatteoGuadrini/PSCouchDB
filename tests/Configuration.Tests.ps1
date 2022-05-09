BeforeAll {
    Import-Module ../PSCouchDB/PSCouchDB.psm1
    . ../PSCouchDB/functions/CouchDBconfiguration.ps1
}

Describe "Get-CouchDBNode" {
    It "Get server nodes." {
        (Get-CouchDBNode -Authorization "admin:password").name | Should -BeLike '*'
    }
    It "Get server memberships." {
        (Get-CouchDBNode -Authorization "admin:password" -Membership).all_nodes | Should -BeLike '*'
    }
    It "Get node versions." {
        Get-CouchDBNode -Authorization "admin:password" -Versions | Should -BeLike '*'
    }
}

Describe "Add-CouchDBNode" {
    It "Add server nodes." {
        Add-CouchDBNode -BindAddress "couchdb_test" -Authorization "admin:password" | Should -BeLike '*'
    }
}

Describe "Remove-CouchDBNode" {
    It "Remove server nodes." {
        Remove-CouchDBNode -Node "couchdb_test@localhost" -Authorization "admin:password" | Should -BeLike '*'
    }
}

Describe "Get-CouchDBConfiguration" {
    It "Get configuration." {
        Get-CouchDBConfiguration -Session "log" -Key "level" -Authorization "admin:password" | Should -BeLike '*'
    }
}