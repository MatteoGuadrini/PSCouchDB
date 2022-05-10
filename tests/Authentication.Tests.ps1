BeforeAll {
    Import-Module ../PSCouchDB/PSCouchDB.psm1
    . ../PSCouchDB/functions/CouchDBauthentication.ps1
}

Describe "Set-CouchDBSession" {
    It "Set cookie authentication." {
        $password = "password" | ConvertTo-SecureString -AsPlainText -Force
        Set-CouchDBSession -UserId admin -Password $password | Should -BeLike '*'
    }
}

Describe "Get-CouchDBSession" {
    It "Get cookie authentication." {
        Get-CouchDBSession | Should -BeLike '*'
    }
}

Describe "Remove-CouchDBSession" {
    It "Remove cookie authentication." {
        Remove-CouchDBSession
        $Global:CouchDBCredential | Should -Be $null
    }
}