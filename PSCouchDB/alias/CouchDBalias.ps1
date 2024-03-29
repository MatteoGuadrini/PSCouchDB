# Alias for all export cmdlets
New-Alias -Name "condb" -Value Connect-CouchDBDatabase -Option ReadOnly
New-Alias -Name "disdb" -Value Disconnect-CouchDBDatabase -Option ReadOnly
New-Alias -Name "creq" -Value Send-CouchDBRequest -Option ReadOnly
New-Alias -Name "tcdb" -Value Test-CouchDBDatabase -Option ReadOnly
New-Alias -Name "cpdb" -Value Copy-CouchDBDatabase -Option ReadOnly
New-Alias -Name "gcdb" -Value Get-CouchDBDatabase -Option ReadOnly
New-Alias -Name "gcbpl" -Value Get-CouchDBDatabasePurgedLimit -Option ReadOnly
New-Alias -Name "gcsi" -Value Get-CouchDBServer -Option ReadOnly
New-Alias -Name "gcdbc" -Value Get-CouchDBDatabaseChanges -Option ReadOnly
New-Alias -Name "gcdbu" -Value Get-CouchDBDatabaseUpdates -Option ReadOnly
New-Alias -Name "gcdbsh" -Value Get-CouchDBDatabaseShards -Option ReadOnly
New-Alias -Name "gcdoc" -Value Get-CouchDBDocument -Option ReadOnly
New-Alias -Name "gcbdoc" -Value Get-CouchDBBulkDocument -Option ReadOnly
New-Alias -Name "gcddoc" -Value Get-CouchDBDesignDocument -Option ReadOnly
New-Alias -Name "gcdatt" -Value Get-CouchDBDesignDocumentAttachment -Option ReadOnly
New-Alias -Name "gcatt" -Value Get-CouchDBAttachment -Option ReadOnly
New-Alias -Name "gcusr" -Value Get-CouchDBUser -Option ReadOnly
New-Alias -Name "gcadm" -Value Get-CouchDBAdmin -Option ReadOnly
New-Alias -Name "gcconf" -Value Get-CouchDBConfiguration -Option ReadOnly
New-Alias -Name "gcnode" -Value Get-CouchDBNode -Option ReadOnly
New-Alias -Name "gcdbs" -Value Get-CouchDBDatabaseSecurity -Option ReadOnly
New-Alias -Name "gcrpl" -Value Get-CouchDBReplication -Option ReadOnly
New-Alias -Name "gcrpls" -Value Get-CouchDBReplicationScheduler -Option ReadOnly
New-Alias -Name "gctsk" -Value Get-CouchDBActiveTask -Option ReadOnly
New-Alias -Name "gccs" -Value Get-CouchDBClusterSetup -Option ReadOnly
New-Alias -Name "gcrpdoc" -Value Get-CouchDBReplicationDocument -Option ReadOnly
New-Alias -Name "gcidx" -Value Get-CouchDBIndex -Option ReadOnly
New-Alias -Name "gcddd" -Value Get-CouchDBDatabaseDesignDocument -Option ReadOnly
New-Alias -Name "gcmr" -Value Get-CouchDBMissingRevision -Option ReadOnly
New-Alias -Name "gcrd" -Value Get-CouchDBRevisionDifference -Option ReadOnly
New-Alias -Name "gcrl" -Value Get-CouchDBRevisionLimit -Option ReadOnly
New-Alias -Name "gcss" -Value Get-CouchDBSession -Option ReadOnly
New-Alias -Name "subconf" -Value Submit-CouchDBConfiguration -Option ReadOnly
New-Alias -Name "scds" -Value Sync-CouchDBDatabaseShards -Option ReadOnly
New-Alias -Name "gcdbrs" -Value Get-CouchDBReshards -Option ReadOnly
New-Alias -Name "scdbrs" -Value Set-CouchDBReshards -Option ReadOnly
New-Alias -Name "rcdbrs" -Value Remove-CouchDBReshards -Option ReadOnly
New-Alias -Name "cpdoc" -Value Copy-CouchDBDocument -Option ReadOnly
New-Alias -Name "mcsts" -Value Measure-CouchDBStatistics -Option ReadOnly
New-Alias -Name "eccl" -Value Enable-CouchDBCluster -Option ReadOnly
New-Alias -Name "src" -Value Search-CouchDBHelp -Option ReadOnly
New-Alias -Name "newcdb" -Value New-CouchDBObject -Option ReadOnly
New-Alias -Name "helpc" -Value Search-CouchDBHelp -Option ReadOnly
New-Alias -Name "acnode" -Value Add-CouchDBNode -Option ReadOnly
New-Alias -Name "ccdb" -Value Compress-CouchDBDatabase -Option ReadOnly
New-Alias -Name "ccdd" -Value Compress-CouchDBDesignDocument -Option ReadOnly
New-Alias -Name "ccview" -Value Clear-CouchDBView -Option ReadOnly
New-Alias -Name "ccdoc" -Value Clear-CouchDBDocuments -Option ReadOnly
New-Alias -Name "scdbpl" -Value Set-CouchDBDatabasePurgedLimit -Option ReadOnly
New-Alias -Name "scdoc" -Value Set-CouchDBDocument -Option ReadOnly
New-Alias -Name "scddoc" -Value Set-CouchDBDesignDocument -Option ReadOnly
New-Alias -Name "scusr" -Value Set-CouchDBUser -Option ReadOnly
New-Alias -Name "scadm" -Value Set-CouchDBAdmin -Option ReadOnly
New-Alias -Name "scconf" -Value Set-CouchDBConfiguration -Option ReadOnly
New-Alias -Name "scrpl" -Value Set-CouchDBReplication -Option ReadOnly
New-Alias -Name "scrl" -Value Set-CouchDBRevisionLimit -Option ReadOnly
New-Alias -Name "scs" -Value Set-CouchDBSession -Option ReadOnly
New-Alias -Name "sps" -Value Set-CouchDBProxy -Option ReadOnly
New-Alias -Name "cdbmaint" -Value Set-CouchDBMaintenanceMode -Option ReadOnly
New-Alias -Name "gcdbp" -Value Grant-CouchDBDatabasePermission -Option ReadOnly
New-Alias -Name "rcdbp" -Value Revoke-CouchDBDatabasePermission -Option ReadOnly
New-Alias -Name "rcdbr" -Value Request-CouchDBReplication -Option ReadOnly
New-Alias -Name "ncdb" -Value New-CouchDBDatabase -Option ReadOnly
New-Alias -Name "ncdoc" -Value New-CouchDBDocument -Option ReadOnly
New-Alias -Name "ncddoc" -Value New-CouchDBDesignDocument -Option ReadOnly
New-Alias -Name "adatt" -Value Add-CouchDBDesignDocumentAttachment -Option ReadOnly
New-Alias -Name "acatt" -Value Add-CouchDBAttachment -Option ReadOnly
New-Alias -Name "ncusr" -Value New-CouchDBUser -Option ReadOnly
New-Alias -Name "ncadm" -Value New-CouchDBAdmin -Option ReadOnly
New-Alias -Name "ncrpl" -Value New-CouchDBReplication -Option ReadOnly
New-Alias -Name "ncuuid" -Value New-CouchDBUuids -Option ReadOnly
New-Alias -Name "ncbd" -Value New-CouchDBBulkDocument -Option ReadOnly
New-Alias -Name "ncidx" -Value New-CouchDBIndex -Option ReadOnly
New-Alias -Name "rcdb" -Value Remove-CouchDBDatabase -Option ReadOnly
New-Alias -Name "rcdoc" -Value Remove-CouchDBDocument -Option ReadOnly
New-Alias -Name "rcddoc" -Value Remove-CouchDBDesignDocument -Option ReadOnly
New-Alias -Name "rdatt" -Value Remove-CouchDBDesignDocumentAttachment -Option ReadOnly
New-Alias -Name "rcatt" -Value Remove-CouchDBAttachment -Option ReadOnly
New-Alias -Name "rcusr" -Value Remove-CouchDBUser -Option ReadOnly
New-Alias -Name "rcadm" -Value Remove-CouchDBAdmin -Option ReadOnly
New-Alias -Name "rcnode" -Value Remove-CouchDBNode -Option ReadOnly
New-Alias -Name "rcrpl" -Value Remove-CouchDBReplication -Option ReadOnly
New-Alias -Name "rcidx" -Value Remove-CouchDBIndex -Option ReadOnly
New-Alias -Name "rcs" -Value Remove-CouchDBSession -Option ReadOnly
New-Alias -Name "rps" -Value Remove-CouchDBProxy -Option ReadOnly
New-Alias -Name "rcsrv" -Value Restart-CouchDBServer -Option ReadOnly
New-Alias -Name "scft" -Value Search-CouchDBFullText -Option ReadOnly
New-Alias -Name "fcdoc" -Value Find-CouchDBDocuments -Option ReadOnly
New-Alias -Name "fcddoc" -Value Find-CouchDBDesignDocument -Option ReadOnly
New-Alias -Name "wcfc" -Value Write-CouchDBFullCommit -Option ReadOnly
New-Alias -Name "ecdb" -Value Export-CouchDBDatabase -Option ReadOnly
New-Alias -Name "icdb" -Value Import-CouchDBDatabase -Option ReadOnly
New-Alias -Name "rdblog" -Value Read-CouchDBLog -Option ReadOnly
New-Alias -Name "cdblog" -Value Clear-CouchDBLog -Option ReadOnly
New-Alias -Name "cdsa" -Value Search-CouchDBAnalyze -Option ReadOnly

# Intuitive alias
New-Alias -Name "mkdb" -Value New-CouchDBDatabase -Option ReadOnly
New-Alias -Name "mkdoc" -Value New-CouchDBDocument -Option ReadOnly
New-Alias -Name "mkuser" -Value New-CouchDBUser -Option ReadOnly
New-Alias -Name "mkadmin" -Value New-CouchDBAdmin -Option ReadOnly
New-Alias -Name "rmdb" -Value Remove-CouchDBDatabase -Option ReadOnly
New-Alias -Name "rmdoc" -Value Remove-CouchDBDocument -Option ReadOnly
New-Alias -Name "rmuser" -Value Remove-CouchDBUser -Option ReadOnly
New-Alias -Name "rmadmin" -Value Remove-CouchDBAdmin -Option ReadOnly
New-Alias -Name "finddoc" -Value Find-CouchDBDocuments -Option ReadOnly
New-Alias -Name "importdb" -Value Import-CouchDBDatabase -Option ReadOnly
New-Alias -Name "exportdb" -Value Export-CouchDBDatabase -Option ReadOnly
