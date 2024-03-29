BeforeAll {
    Import-Module ../PSCouchDB/PSCouchDB.psm1
    . ../PSCouchDB/functions/CouchDBconfiguration.ps1
    . ../PSCouchDB/functions/CouchDBserver.ps1
    . ../PSCouchDB/functions/CouchDBdatabase.ps1
    . ../PSCouchDB/functions/CouchDBdocument.ps1
    New-CouchDBDatabase -Database test -Authorization "admin:password"
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
        Add-CouchDBNode -BindAddress "127.0.1.1" -Authorization "admin:password" | Should -BeLike '*'
    }
}

Describe "Remove-CouchDBNode" {
    It "Remove server nodes." {
        Remove-CouchDBNode -Node "couchdb@127.0.1.1" -Authorization "admin:password" -Force | Should -BeLike '*'
    }
}

Describe "Get-CouchDBConfiguration" {
    It "Get configuration." {
        Get-CouchDBConfiguration -Session "log" -Key "level" -Authorization "admin:password" | Should -BeLike '*'
    }
}

Describe "Set-CouchDBConfiguration" {
    It "Set element configuration." {
        Set-CouchDBConfiguration -Element "log" -Key "level" -Value "info" -Authorization "admin:password" | Should -BeLike '*'
    }
}

Describe "Submit-CouchDBConfiguration" {
    It "Reloads the configuration from disk." {
        (Submit-CouchDBConfiguration -Authorization "admin:password").ok | Should -Be 'true'
    }
}

AfterAll {
    Remove-CouchDBDatabase -Database test -Authorization "admin:password" -Force
}