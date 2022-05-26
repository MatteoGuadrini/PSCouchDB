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
        (Set-CouchDBDesignDocument -Database test -Document "space" -Revision (Get-CouchDBDesignDocument -Database test -Document "space")._rev -Data $data -Authorization "admin:password")._id | Should -Be '_design/space'
    }
}


Describe "Get-CouchDBDatabaseDesignDocument" {
    It "Get all design document on a database." {
        Get-CouchDBDatabaseDesignDocument -Database test -Authorization "admin:password" | Should -BeLike '*'
    }
}

Describe "Add-CouchDBDesignDocumentAttachment" {
    It "Create a new attachment in a design document." {
        $Attachment = New-CouchDBObject PSCouchDBAttachment -ArgumentList $FileTemp
        (Add-CouchDBDesignDocumentAttachment -Database test -Document space -Revision (Get-CouchDBDesignDocument -Database test -Document "space" -Authorization "admin:password")._rev -Attachment $Attachment -Authorization "admin:password").ok | Should -Be 'true'
    }
}

Describe "Get-CouchDBDesignDocumentAttachment" {
    It "Get or save attachment from design document." {
        Get-CouchDBDesignDocumentAttachment -Database test -Document "space" -Attachment $FileTemp | Should -BeLike '*'
    }
}

AfterAll {
    Remove-CouchDBDatabase -Database test -Authorization "admin:password" -Force
}