BeforeAll {
    Import-Module ../PSCouchDB/PSCouchDB.psm1
    . ../PSCouchDB/functions/CouchDBpermission.ps1
}

Describe "New-CouchDBAdmin" {
    It "Create a new admin user." {
        $password = "password" | ConvertTo-SecureString -AsPlainText -Force
        (New-CouchDBAdmin -Userid newadminuser -Password $password -Authorization "admin:password").newadminuser | Should -BeLike '*'
    }
}

Describe "New-CouchDBUser" {
    It "Create a new user." {
        $password = "password" | ConvertTo-SecureString -AsPlainText -Force
        (New-CouchDBAdmin -Userid newadminuser -Password $password -Authorization "admin:password").ok | Should -Be "true"
    }
}