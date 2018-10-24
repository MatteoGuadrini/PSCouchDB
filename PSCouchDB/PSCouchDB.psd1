#
# Module manifest for module 'PSCouchDB'
#
# Generated by: mguadrini
#
# Generated on: 2/15/18
#

@{

    # Script module or binary module file associated with this manifest.
    RootModule = 'PSCouchDB.psm1'

    # Version number of this module.
    ModuleVersion = '1.7.0'

    # Supported PSEditions
    # CompatiblePSEditions = @()

    # ID used to uniquely identify this module
    GUID = 'b4de3821-e760-497d-a0ed-c9af0dc041dd'

    # Author of this module
    Author = 'Matteo Guadrini <matteo.guadrini@hotmail.it>'

    # Company or vendor of this module
    #CompanyName = ''

    # Copyright statement for this module
    Copyright = '(c) Matteo Guadrini. All rights reserved.'

    # Description of the functionality provided by this module
    Description = 'Powershell module for CouchDB v2.X'

    # Minimum version of the PowerShell engine required by this module
    PowerShellVersion = '5.0'

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
    FunctionsToExport = @("Get-CouchDBDatabase",
                        "Get-CouchDBDatabaseChanges",
                        "Get-CouchDBDocument",
                        "Get-CouchDBDesignDocument",
                        "Get-CouchDBAttachment",
                        "Get-CouchDBUser",
                        "Get-CouchDBAdmin",
                        "Get-CouchDBConfiguration",
                        "Get-CouchDBNode",
                        "Get-CouchDBDatabaseSecurity",
                        "Get-CouchDBReplication",
                        "Get-CouchDBReplicationScheduler",
                        "Get-CouchDBActiveTask",
                        "Get-CouchDBIndex",
                        "Measure-CouchDBStatistics",
                        "Enable-CouchDBCluster",
                        "Add-CouchDBNode",
                        "Compress-CouchDBDatabase",
                        "Clear-CouchDBView",
                        "Clear-CouchDBDocuments",
                        "Set-CouchDBDocument",
                        "Set-CouchDBDesignDocument",
                        "Set-CouchDBAttachment",
                        "Set-CouchDBUser",
                        "Set-CouchDBAdmin",
                        "Set-CouchDBConfiguration",
                        "Set-CouchDBReplication",
                        "Grant-CouchDBDatabasePermission",
                        "Grant-CouchDBDatabaseSecurity",
                        "Revoke-CouchDBDatabasePermission",
                        "New-CouchDBDatabase",
                        "New-CouchDBDocument",
                        "New-CouchDBDesignDocument",
                        "New-CouchDBAttachment",
                        "New-CouchDBUser",
                        "New-CouchDBAdmin",
                        "New-CouchDBReplication",
                        "New-CouchDBUuids",
                        "New-CouchDBIndex",
                        "Remove-CouchDBDatabase",
                        "Remove-CouchDBDocument",
                        "Remove-CouchDBDesignDocument",
                        "Remove-CouchDBAttachment",
                        "Remove-CouchDBUser",
                        "Remove-CouchDBAdmin",
                        "Remove-CouchDBNode",
                        "Remove-CouchDBReplication",
                        "Remove-CouchDBIndex",
                        "Restart-CouchDBServer",
                        "Find-CouchDBDocuments"
                        )

    # Cmdlet s to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
    CmdletsToExport = @()

    # Variables to export from this module
    #VariablesToExport = '*'

    # Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
    AliasesToExport = @("gcdb",
                        "gcdbc",
                        "gcdoc",
                        "gcddoc",
                        "gcatt",
                        "gcusr",
                        "gcadm",
                        "gcconf",
                        "gcnode",
                        "gcrpl",
                        "gcrpls",
                        "gctsk",
                        "gcidx",
                        "mcsts",
                        "eccl",
                        "acnode",
                        "ccdb",
                        "ccview",
                        "scdoc",
                        "scddoc",
                        "scatt",
                        "scusr",
                        "scadm",
                        "scconf",
                        "scrpl",
                        "gcdbp",
                        "rcdbp",
                        "ncdb",
                        "ncdoc",
                        "ncddoc",
                        "ncatt",
                        "ncusr",
                        "ncadm",
                        "ncrpl",
                        "ncuuid",
                        "ncidx",
                        "rcdb",
                        "rcdoc",
                        "rcddoc",
                        "rcatt",
                        "rcusr",
                        "rcadm",
                        "rcnode",
                        "rcrpl",
                        "rcidx",
                        "rcsrv",
                        "fcdoc",
                        "finddoc"
                        )

    # DSC resources to export from this module
    # DscResourcesToExport = @()

    # List of all modules packaged with this module
    # ModuleList = @()

    # List of all files packaged with this module
    # FileList = @()

    # Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
    PrivateData = @{

        PSData = @{

            # Tags applied to this module. These help with module discovery in online galleries.
            Tags = @("CouchDB","Apache","curl")

            # A URL to the license for this module.
            # LicenseUri = ''

            # A URL to the main website for this project.
            ProjectUri = 'https://matteoguadrini.github.io/PSCouchDB'

            # A URL to an icon representing this module.
            IconUri = 'https://image.ibb.co/mU6TNz/pscouchdb_logo.png'

            # ReleaseNotes of this module
            # ReleaseNotes = ''

        } # End of PSData hashtable

    } # End of PrivateData hashtable

    # HelpInfo URI of this module
    HelpInfoURI = 'https://github.com/MatteoGuadrini/PSCouchDB/wiki'

    # Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
    # DefaultCommandPrefix = ''

    }
