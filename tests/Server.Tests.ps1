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

Describe "Measure-CouchDBStatistics" {
    It "Measure server statistics." {
        (Measure-CouchDBStatistics).type | Should -Be 'histogram'
    }
}

Describe "New-CouchDBUuids" {
    It "Create a new uuids." {
        (New-CouchDBUuids -Count 3).uuids.Length | Should -Be 3
    }
}

Describe "Search-CouchDBAnalyze" {
    It "Tests the results of Lucene analyzer tokenization on sample text." {
        (Search-CouchDBAnalyze -Field "english" -Text "running" -Authorization "admin:password").tokens | Should -Be @("run")
    }
}

Describe "Get-CouchDBReshards" {
    It "State of resharding on the cluster." {
        (Get-CouchDBReshards -Jobs -Authorization "admin:password").jobs | Should -Type [array]
    }
}

Describe "Set-CouchDBReshards" {
    It "Change the resharding state on the cluster." {
        Set-CouchDBReshards -State running -StateReason "Pester start" -Authorization "admin:password" | Should -Type [array]
    }
}

Describe "Get-CouchDBDatabaseUpdates" {
    It "Get database events." {
        (Get-CouchDBDatabaseUpdates -Authorization "admin:password").results | Should -Type [array]
    }
}

Describe "Set-CouchDBProxy" {
    It "Set proxy server and credential." {
        $password = ConvertTo-SecureString 'password' -AsPlainText -Force
        $credential = New-Object System.Management.Automation.PSCredential ('admin', $password)
        Set-CouchDBProxy -Server 'http://myproxy.local:8080' -Credential $credential
        $Global:PSDefaultParameterValues["*CouchDB*:ProxyCredential"] | Should -Be 'http://myproxy.local:8080'
    }
}

Describe "Remove-CouchDBProxy" {
    It "Remove proxy server and credential." {
        Remove-CouchDBProxy
        $Global:PSDefaultParameterValues["*CouchDB*:ProxyCredential"] | Should -Be $null
    }
}