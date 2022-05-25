BeforeAll {
    Import-Module ../PSCouchDB/PSCouchDB.psm1
    . ../PSCouchDB/functions/CouchDBdatabase.ps1
    . ../PSCouchDB/functions/CouchDBdesigndocument.ps1
    New-CouchDBDatabase -Database test -Authorization "admin:password"
    $SCRIPT:FileTemp = (New-TemporaryFile).FullName
}

Describe "Get-CouchDBDesignDocument" {
    It "Get a design document." {
        (Get-CouchDBDesignDocument -Database test -Document "space" -Authorization "admin:password")._id | Should -Be '_design/space'
    }
}

Describe "Get-CouchDBDatabaseDesignDocument" {
    It "Get all design document on a database." {
        Get-CouchDBDatabaseDesignDocument -Database test -Authorization "admin:password" | Should -BeLike '*'
    }
}

AfterAll {
    Remove-CouchDBDatabase -Database test -Authorization "admin:password" -Force
}