BeforeAll {
    Import-Module ../PSCouchDB/PSCouchDB.psm1
    . ../PSCouchDB/functions/CouchDBserver.ps1
}

Describe "Get-CouchDBServer" {
    It "Get server information." {
        (Get-CouchDBServer).couchdb | Should -Be 'Welcome'
    }
    It "Get server status." {
        (Get-CouchDBServer -Status).status | Should -Be 'ok'
    }
}