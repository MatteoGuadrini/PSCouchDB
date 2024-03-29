using module ../PSCouchDB/PSCouchDB.psm1
BeforeAll {
    Import-Module ../PSCouchDB/PSCouchDB.psm1
    . ../PSCouchDB/functions/CouchDBdatabase.ps1
    . ../PSCouchDB/functions/CouchDBdesigndocument.ps1
    New-CouchDBDatabase -Database test -Authorization "admin:password"
    $SCRIPT:FileTemp = (New-TemporaryFile).FullName
}

Describe "New-CouchDBDesignDocument" {
    It "Create a new design document." {
        $data = '{"views":{"data_test":{"map":"function(doc) {emit(doc._id, doc._rev)}"}}}'
        (New-CouchDBDesignDocument -Database test -Document "space" -Data $data -Authorization "admin:password").ok | Should -Be 'true'
    }
}

Describe "Get-CouchDBDesignDocument" {
    It "Get a design document." {
        (Get-CouchDBDesignDocument -Database test -Document "space" -Authorization "admin:password")._id | Should -Be '_design/space'
    }
}

Describe "Set-CouchDBDesignDocument" {
    It "Modify a design document." {
        $data = '{"views":{"data_test":{"map":"function(doc) {emit(doc._id, doc._rev)}"}}}'
        (Set-CouchDBDesignDocument -Database test -Document "space" -Revision (Get-CouchDBDesignDocument -Database test -Document "space")._rev -Data $data -Authorization "admin:password").id | Should -Be '_design/space'
    }
}

Describe "Compress-CouchDBDesignDocument" {
    It "Compress design document." {
        (Compress-CouchDBDesignDocument -Database test -DesignDoc space -Authorization "admin:password").ok | Should -Be 'true'
    }
}

Describe "Get-CouchDBDatabaseDesignDocument" {
    It "Get all design document on a database." {
        Get-CouchDBDatabaseDesignDocument -Database test -Authorization "admin:password" | Should -BeLike '*'
    }
}

Describe "Add-CouchDBDesignDocumentAttachment" {
    It "Create a new attachment in a design document." {
        "PSCouchDB test" | Out-File -FilePath $FileTemp
        (Add-CouchDBDesignDocumentAttachment -Database test -Document space -Revision (Get-CouchDBDesignDocument -Database test -Document "space" -Authorization "admin:password")._rev -Attachment $FileTemp -Authorization "admin:password").ok | Should -Be 'true'
    }
}

Describe "Get-CouchDBDesignDocumentAttachment" {
    It "Get or save attachment from design document." {
        $Attachment = [System.IO.Path]::GetFileName($FileTemp)
        Get-CouchDBDesignDocumentAttachment -Database test -Document "space" -Attachment $Attachment | Should -BeLike '*'
    }
}

Describe "Remove-CouchDBDesignDocumentAttachment" {
    It "Remove an attachment in a design document." {
        $Attachment = [System.IO.Path]::GetFileName($FileTemp)
        (Remove-CouchDBDesignDocumentAttachment -Database test -Document "space" -Revision (Get-CouchDBDesignDocument -Database test -Document "space" -Authorization "admin:password")._rev -Attachment $Attachment -Authorization "admin:password" -Force).ok | Should -Be 'true'
    }
}

Describe "Remove-CouchDBDesignDocument" {
    It "Remove a design document." {
        (Remove-CouchDBDesignDocument -Database test -Document "space" -Revision (Get-CouchDBDesignDocument -Database test -Document "space")._rev -Authorization "admin:password" -Force).ok | Should -Be 'true'
    }
}

AfterAll {
    Remove-CouchDBDatabase -Database test -Authorization "admin:password" -Force
}