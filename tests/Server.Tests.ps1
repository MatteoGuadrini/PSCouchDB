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

Describe "Get-CouchDBActiveTask" {
    It "List of running tasks, including the task type, name, status and process ID." {
        Get-CouchDBActiveTask
    }
}

Describe "Get-CouchDBClusterSetup" {
    It "Get a cluster setup." {
        (Get-CouchDBClusterSetup).state | Should -BeLike '*enabled*'
    }
}