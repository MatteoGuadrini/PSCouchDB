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
        (Get-CouchDBNode -Authorization "admin:password" -Versions).all_nodes | Should -BeLike '*'
    }
}