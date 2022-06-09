using module ../PSCouchDB/PSCouchDB.psm1
BeforeAll {
    Import-Module ../PSCouchDB/PSCouchDB.psm1
    . ../PSCouchDB/functions/CouchDBdatabase.ps1
    . ../PSCouchDB/functions/CouchDBdocument.ps1
    New-CouchDBDatabase -Database test -Authorization "admin:password"
    $SCRIPT:FileTemp = (New-TemporaryFile).FullName
}

Describe "New-CouchDBDocument" {
    It "Create a new document." {
        $data = @{"answer"=42; "ask"="Ultimate Question of Life, the Universe and Everything"}
        (New-CouchDBDocument -Database test -Document "Hitchhikers" -Data $data -Authorization "admin:password").ok | Should -Be 'true'
    }
}

Describe "Get-CouchDBDocument" {
    It "Get a document." {
        (Get-CouchDBDocument -Database test -Document "Hitchhikers")._id | Should -Be "Hitchhikers"
    }
}

Describe "Set-CouchDBDocument" {
    It "Modify a document." {
        $data = @{"answer"=43; "ask"="Ultimate Question of Life, the Universe and Everything"}
        (Set-CouchDBDocument -Database test -Document "Hitchhikers" -Revision (Get-CouchDBDocument -Database test -Document "Hitchhikers")._rev -Data $data -Authorization "admin:password").ok | Should -Be 'true'
    }
}

Describe "Copy-CouchDBDocument" {
    It "Copy from document." {
        (Copy-CouchDBDocument -Database test -Document "Hitchhikers" -Destination "Hitchhikers Guide" -Authorization "admin:password").ok | Should -Be 'true'
    }
}

Describe "Get-CouchDBBulkDocument" {
    It "Get a bulk document." {
        $bdocs = New-CouchDBObject -TypeName PSCouchDBBulkDocument -ArgumentList '{"_id":"Hitchhikers"}'
        $bdocs.AddDocument('{"_id":"Hitchhikers Guide"}')
        (Get-CouchDBBulkDocument -Database test -Data $bdocs -Authorization admin:password).results | Should -BeLike "*"
    }
}

Describe "New-CouchDBBulkDocument" {
    It "Create a bulk document." {
        $bdocs = '{
            "docs":  [
                        {
                            "_id":  "test",
                            "name":  "test"
                        },
                        {
                            "_id":  "test1",
                            "name":  "test"
                        }
                    ]
        }'
        $result = New-CouchDBBulkDocument -Database test -Data $bdocs -Authorization admin:password
        $result[0].ok | Should -Be 'true'
        $result[1].ok | Should -Be 'true'
    }
}

Describe "Add-CouchDBAttachment" {
    It "Create or replace a new attachment on document." {
        "PSCouchDB test" | Out-File -FilePath $FileTemp
        $Attachment = New-CouchDBObject PSCouchDBAttachment -ArgumentList $FileTemp
        (Add-CouchDBAttachment -Database test -Document "Hitchhikers" -Revision (Get-CouchDBDocument -Database test -Document "Hitchhikers")._rev -Attachment $Attachment -Authorization "admin:password").ok | Should -Be 'true'
    }
}

Describe "Get-CouchDBAttachment" {
    It "Get or save attachment." {
        $Attachment = [System.IO.Path]::GetFileName($FileTemp)
        Get-CouchDBAttachment -Database test -Document "Hitchhikers" -Attachment $Attachment | Should -BeLike '*'
    }
}

Describe "Remove-CouchDBAttachment" {
    It "Remove an attachment document." {
        $Attachment = [System.IO.Path]::GetFileName($FileTemp)
        (Remove-CouchDBAttachment -Database test -Document "Hitchhikers" -Attachment $Attachment -Revision (Get-CouchDBDocument -Database test -Document "Hitchhikers")._rev -Authorization "admin:password" -Force).ok | Should -Be 'true'
    }
}

Describe "Search-CouchDBFullText" {
    It "Full text search." {
        Search-CouchDBFullText -Database test -Patterns "test","test1" -Authorization "admin:password" | Should -BeLike '*'
    }
}

Describe "Find-CouchDBDocuments" {
    It "Find document data in a database." {
        (Find-CouchDBDocuments -Database test -Selector "name" -Operator eq -Value "test" -Fields _id,name).docs[0].name | Should -Be 'test'
    }
}

Describe "Remove-CouchDBDocument" {
    It "Remove a document." {
        (Remove-CouchDBDocument -Database test -Document "Hitchhikers" -Revision (Get-CouchDBDocument -Database test -Document "Hitchhikers")._rev -Force -Authorization "admin:password").ok | Should -Be 'true'
    }
}

Describe "Clear-CouchDBDocuments" {
    It "A database purge permanently document." {
        (Clear-CouchDBDocuments -Database test -Document "test1" -Authorization "admin:password" -Force).purged | Should -BeLike '*'
    }
}

AfterAll {
    Remove-CouchDBDatabase -Database test -Authorization "admin:password" -Force
}