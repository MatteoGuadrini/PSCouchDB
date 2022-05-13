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

Describe "Set-CouchDBAdmin" {
    It "Reset password of admin user." {
        $password = "newpassword" | ConvertTo-SecureString -AsPlainText -Force
        (Set-CouchDBAdmin -Userid admin -Password $password -Authorization "admin:password").ok | Should -Be "true"
    }
}

Describe "Remove-CouchDBAdmin" {
    It "Remove an admin user." {
        (Remove-CouchDBAdmin -Userid newadminuser -Authorization "admin:password" -Force).ok | Should -Be "true"
    }
}

Describe "New-CouchDBUser" {
    It "Create a new user." {
        $password = "password" | ConvertTo-SecureString -AsPlainText -Force
        (New-CouchDBAdmin -Userid newadminuser -Password $password -Authorization "admin:password").ok | Should -Be "true"
    }
}

Describe "Set-CouchDBUser" {
    It "Set an user properties." {
        $password = "newpassword" | ConvertTo-SecureString -AsPlainText -Force
        (Set-CouchDBUser -Userid test_user -Password $password -Revision (Get-CouchDBUser -Userid test_user -Authorization "admin:password").rev -Authorization "admin:password").ok | Should -Be "true"
    }
}

Describe "Remove-CouchDBUser" {
    It "Remove an user." {
        (Remove-CouchDBUser -Userid test_user -Revision (Get-CouchDBUser -Userid test_user -Authorization "admin:password").rev -Authorization "admin:password" -Force).ok | Should -Be "true"
    }
}

Describe "Grant-CouchDBDatabasePermission" {
    It "Grant the security object for the given database." {
        (New-CouchDBDatabase -Database test -Authorization "admin:password").ok | Should -Be "true"
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
    Grant-CouchDBDatabasePermission -Database test -Data $sec -Authorization "admin:password" | Should -Be "true"
    }
}

Describe "Get-CouchDBDatabaseSecurity" {
    It "Get the current security object from the specified database." {
        Get-CouchDBDatabaseSecurity -Database test -Authorization "admin:password" | Should -BeLike '*'
    }
}

Describe "Revoke-CouchDBDatabasePermission" {
    It "Revoke all permission on database." {
        Revoke-CouchDBDatabasePermission -Database test -Authorization "admin:password"
    }
}