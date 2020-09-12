#
# Module manifest for module 'PSCouchDB'
#
# Generated by: mguadrini
#
# Generated on: 2/15/18
#

@{

    # Script module or binary module file associated with this manifest.
    RootModule        = 'PSCouchDB.psm1'

    # Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
    NestedModules     = @(
        # PSCouchDB function modules 
        '.\functions\CouchDBprivate.ps1',
        '.\functions\CouchDBconfiguration.ps1',
        '.\functions\CouchDBpermission.ps1',
        '.\functions\CouchDBserver.ps1',
        '.\functions\CouchDBreplication.ps1',
        '.\functions\CouchDBauthentication.ps1',
        '.\functions\CouchDBdatabase.ps1',
        '.\functions\CouchDBdocument.ps1',
        '.\functions\CouchDBdesigndocument.ps1',
        # PSCouchDB alias modules
        '.\alias\CouchDBalias.ps1'
    )

    # Version number of this module.
    ModuleVersion     = '2.1.0'

    # Supported PSEditions
    # CompatiblePSEditions = @()

    # ID used to uniquely identify this module
    GUID              = 'b4de3821-e760-497d-a0ed-c9af0dc041dd'

    # Author of this module
    Author            = 'Matteo Guadrini <matteo.guadrini@hotmail.it>'

    # Company or vendor of this module
    #CompanyName = ''

    # Copyright statement for this module
    Copyright         = '(c) Matteo Guadrini. All rights reserved.'

    # Description of the functionality provided by this module
    Description       = 'Advanced CLI for CouchDB server'

    # Minimum version of the PowerShell engine required by this module
    PowerShellVersion = '5.1'

    # Name of the PowerShell host required by this module
    # PowerShellHostName = ''

    # Minimum version of the PowerShell host required by this module
    # PowerShellHostVersion = ''

    # Minimum version of Microsoft .NET Framework required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
    # DotNetFrameworkVersion = ''

    # Minimum version of the common language runtime (CLR) required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
    # CLRVersion = ''

    # Processor architecture (None, X86, Amd64) required by this module
    # ProcessorArchitecture = ''

    # Modules that must be imported into the global environment prior to importing this module
    # RequiredModules = @()

    # Assemblies that must be loaded prior to importing this module
    # RequiredAssemblies = @()

    # Script files (.ps1) that are run in the caller's environment prior to importing this module.
    # ScriptsToProcess = @()

    # Type files (.ps1xml) to be loaded when importing this module
    # TypesToProcess = @()

    # Format files (.ps1xml) to be loaded when importing this module
    # FormatsToProcess = @()

    # Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
    # NestedModules = @()

    # Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
    FunctionsToExport = @(
        "Connect-CouchDBDatabase",
        "Disconnect-CouchDBDatabase",
        "Send-CouchDBRequest",
        "Get-CouchDBDatabase",
        "Test-CouchDBDatabase",
        "Copy-CouchDBDatabase",
        "Get-CouchDBServer",
        "Get-CouchDBDatabaseInfo",
        "Get-CouchDBDatabaseChanges",
        "Get-CouchDBDatabasePurgedLimit",
        "Get-CouchDBDatabaseUpdates",
        "Get-CouchDBDatabaseShards",
        "Get-CouchDBDocument",
        "Get-CouchDBBulkDocument",
        "Get-CouchDBDesignDocument",
        "Get-CouchDBDesignDocumentAttachment",
        "Get-CouchDBDatabaseDesignDocument",
        "Get-CouchDBAttachment",
        "Get-CouchDBUser",
        "Get-CouchDBAdmin",
        "Get-CouchDBConfiguration",
        "Get-CouchDBNode",
        "Get-CouchDBDatabaseSecurity",
        "Get-CouchDBReplication",
        "Get-CouchDBReplicationScheduler",
        "Get-CouchDBReplicationDocument",
        "Get-CouchDBActiveTask",
        "Get-CouchDBClusterSetup",
        "Get-CouchDBIndex",
        "Get-CouchDBMissingRevision",
        "Get-CouchDBRevisionDifference",
        "Get-CouchDBRevisionLimit",
        "Get-CouchDBSession",
        "Sync-CouchDBDatabaseShards",
        "Copy-CouchDBDocument",
        "Measure-CouchDBStatistics",
        "Enable-CouchDBCluster",
        "Search-CouchDBHelp",
        "New-CouchDBObject",
        "Add-CouchDBNode",
        "Compress-CouchDBDatabase",
        "Compress-CouchDBDesignDocument",
        "Clear-CouchDBView",
        "Clear-CouchDBDocuments",
        "Set-CouchDBDatabasePurgedLimit",
        "Set-CouchDBDocument",
        "New-CouchDBBulkDocument",
        "Set-CouchDBDesignDocument",
        "Set-CouchDBUser",
        "Set-CouchDBAdmin",
        "Set-CouchDBConfiguration",
        "Set-CouchDBReplication",
        "Set-CouchDBRevisionLimit",
        "Set-CouchDBSession",
        "Set-CouchDBProxy",
        "Grant-CouchDBDatabasePermission",
        "Revoke-CouchDBDatabasePermission",
        "Request-CouchDBReplication",
        "New-CouchDBDatabase",
        "New-CouchDBDocument",
        "New-CouchDBDesignDocument",
        "Add-CouchDBDesignDocumentAttachment",
        "Add-CouchDBAttachment",
        "New-CouchDBUser",
        "New-CouchDBAdmin",
        "New-CouchDBReplication",
        "New-CouchDBUuids",
        "New-CouchDBIndex",
        "Remove-CouchDBDatabase",
        "Remove-CouchDBDocument",
        "Remove-CouchDBDesignDocument",
        "Remove-CouchDBDesignDocumentAttachment",
        "Remove-CouchDBAttachment",
        "Remove-CouchDBUser",
        "Remove-CouchDBAdmin",
        "Remove-CouchDBNode",
        "Remove-CouchDBReplication",
        "Remove-CouchDBIndex",
        "Remove-CouchDBSession",
        "Remove-CouchDBProxy",
        "Restart-CouchDBServer",
        "Search-CouchDBFullText",
        "Find-CouchDBDocuments",
        "Write-CouchDBFullCommit",
        "Export-CouchDBDatabase",
        "Import-CouchDBDatabase",
        "Read-CouchDBLog",
        "Clear-CouchDBLog"
    )

    # Cmdlet s to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
    CmdletsToExport   = @()

    # Variables to export from this module
    VariablesToExport = 'CouchDBCachePreference','CouchDBSaveCredentialPreference'

    # Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
    AliasesToExport   = @(
        "condb",
        "disdb",
        "creq",    
        "gcdb",
        "cpdb",
        "tcdb",
        "gcsi",
        "gcdbc",
        "gcdbu",
        "gcdbsh",
        "gcdbs",
        "gcdoc",
        "gcbdoc",
        "gcddoc",
        "gcdatt",
        "gcbpl",
        "gcatt",
        "gcusr",
        "gcadm",
        "gcconf",
        "gcnode",
        "gcrpl",
        "gcrpls",
        "gcrd",
        "gcrpdoc",
        "gctsk",
        "gccs",
        "gcidx",
        "gcddd",
        "gcrl",
        "gcmr",
        "gcss",
        "scds",
        "cpdoc",
        "mcsts",
        "eccl",
        "src",
        "helpc",
        "newcdb",
        "acnode",
        "ccdb",
        "ccdd",
        "ccview",
        "ccdoc",
        "scdbpl",
        "scdoc",
        "scddoc",
        "scusr",
        "scadm",
        "scconf",
        "ncbd",
        "scrpl",
        "scrl",
        "scs",
        "sps",
        "gcdbp",
        "rcdbp",
        "rcdbr",
        "ncdb",
        "ncdoc",
        "ncddoc",
        "adatt",
        "acatt",
        "ncusr",
        "ncadm",
        "ncrpl",
        "ncuuid",
        "ncidx",
        "rcdb",
        "rcdoc",
        "rcddoc",
        "rdatt",
        "rcatt",
        "rcusr",
        "rcadm",
        "rcnode",
        "rcrpl",
        "rcidx",
        "rcsrv",
        "rcs",
        "rps",
        "scft",
        "fcdoc",
        "finddoc",
        "wcfc",
        "ecdb",
        "exportdb",
        "icdb",
        "importdb",
        "rdblog",
        "cdblog",
        "mkdb",
        "mkdoc",
        "mkuser",
        "mkadmin",
        "rmdb",
        "rmdoc",
        "rmuser",
        "rmadmin"
    )

    # DSC resources to export from this module
    # DscResourcesToExport = @()

    # List of all modules packaged with this module
    # ModuleList = @()

    # List of all files packaged with this module
    # FileList = @()

    # Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
    PrivateData       = @{

        PSData = @{

            # Tags applied to this module. These help with module discovery in online galleries.
            Tags       = @("CouchDB", "Apache", "curl", "Database", "NoSql", "api", "http", "db")

            # A URL to the license for this module.
            LicenseUri = 'https://github.com/MatteoGuadrini/PSCouchDB/blob/master/LICENSE.md'

            # A URL to the main website for this project.
            ProjectUri = 'https://matteoguadrini.github.io/PSCouchDB'

            # A URL to an icon representing this module.
            IconUri    = 'https://pscouchdb.readthedocs.io/en/latest/_images/pscouchdb-logo.svg'

            # ReleaseNotes of this module
            # ReleaseNotes = ''

        } # End of PSData hashtable

    } # End of PrivateData hashtable

    # HelpInfo URI of this module
    HelpInfoURI       = 'https://pscouchdb.readthedocs.io/en/latest/'

    # Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
    # DefaultCommandPrefix = ''

}
