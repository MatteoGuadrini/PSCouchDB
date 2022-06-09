using module ../PSCouchDB/PSCouchDB.psm1
BeforeAll {
    Import-Module ../PSCouchDB/PSCouchDB.psm1
    . ../PSCouchDB/functions/CouchDBpermission.ps1
    . ../PSCouchDB/functions/CouchDBconfiguration.ps1
    . ../PSCouchDB/functions/CouchDBserver.ps1
    . ../PSCouchDB/functions/CouchDBdatabase.ps1
    . ../PSCouchDB/functions/CouchDBdocument.ps1
    . ../PSCouchDB/functions/CouchDBprivate.ps1
    New-CouchDBDatabase -Database test -Authorization "admin:password"
}

Describe "New-CouchDBAdmin" {
    It "Create a new admin user." {
        $password = "password" | ConvertTo-SecureString -AsPlainText -Force
        (New-CouchDBAdmin -Userid newadminuser -Password $password -Authorization "admin:password").results | Should -BeLike '*'
    }
}

Describe "Set-CouchDBAdmin" {
    It "Reset password of admin user." {
        $password = "password" | ConvertTo-SecureString -AsPlainText -Force
        (Set-CouchDBAdmin -Userid admin -Password $password -Authorization "admin:password").result | Should -BeLike '*'
    }
}

Describe "Remove-CouchDBAdmin" {
    It "Remove an admin user." {
        (Remove-CouchDBAdmin -Userid newadminuser -Authorization "admin:password" -Force).results | Should -BeLike '*'
    }
}

Describe "New-CouchDBUser" {
    It "Create a new user." {
        $password = "password" | ConvertTo-SecureString -AsPlainText -Force
        (New-CouchDBUser -Userid test_user -Password $password -Authorization "admin:password").ok | Should -Be 'true'
    }
}

Describe "Set-CouchDBUser" {
    It "Set an user properties." {
        $password = "newpassword" | ConvertTo-SecureString -AsPlainText -Force
        (Set-CouchDBUser -Userid test_user -Password $password -Revision (Get-CouchDBUser -Userid test_user -Authorization "admin:password")._rev -Authorization "admin:password").ok | Should -Be 'true'
    }
}

Describe "Remove-CouchDBUser" {
    It "Remove an user." {
        (Remove-CouchDBUser -Userid test_user -Revision (Get-CouchDBUser -Userid test_user -Authorization "admin:password")._rev -Authorization "admin:password" -Force).ok | Should -Be 'true'
    }
}

Describe "Grant-CouchDBDatabasePermission" {
    It "Grant the security object for the given database." {
        $sec = @"
{
    "admins": {
        "names": [],
        "roles": []
    },
    "members": {
        "names": ["reader"],
        "roles": []
    }
}
"@
        (Grant-CouchDBDatabasePermission -Database test -Data $sec -Authorization "admin:password").ok | Should -Be "true"
    }
}

Describe "Get-CouchDBDatabaseSecurity" {
    It "Get the current security object from the specified database." {
        Get-CouchDBDatabaseSecurity -Database test -Authorization "admin:password" | Should -BeLike '*'
    }
}

Describe "Revoke-CouchDBDatabasePermission" {
    It "Revoke all permission on database." {
        (Revoke-CouchDBDatabasePermission -Database test -Authorization "admin:password" -Force).ok | Should -Be "true"
    }
}

AfterAll {
    Remove-CouchDBDatabase -Database test -Authorization "admin:password" -Force
}