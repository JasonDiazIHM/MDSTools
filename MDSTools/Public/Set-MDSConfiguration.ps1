function Set-MDSConfiguration {
    <#
    .SYNOPSIS
    Set module configuration variables

    .DESCRIPTION
    Some functions in the module require variables that are unique to the environment.  This function allows for the setting of those variables.  Supported variables may be tab completed with the name parameter.  Those variables include:
        ADConnectServer (Start-MDSADSyncSyncCycle)
        SkypeOnPremServer (Import-MDSSkypeOnPrem)

    .PARAMETER Name
    Valid values:  ADConnectServer, SkypeOnPremServer

    .PARAMETER Value
    String value for the variable specified in the name parameter

    .EXAMPLE
    Set-MDSConfiguration -Name ADConnectServer -Value AADConnect.contoso.com

    .NOTES
    Uses the 'Configuration' module by Joel Bennett (https://www.powershellgallery.com/packages/Configuration)

    #>
	[cmdletbinding()]
    param(
        [ValidateSet("ADConnectServer","SkypeOnPremServer")]
        [Parameter(Mandatory)]
        [String]$Name,

        [Parameter(Mandatory)]
        [String]$Value
    )
    begin {}
    process {
        $Configuration = Import-Configuration
        If ($Configuration) {
            $Configuration.Add($Name,$Value)
            Get-Module C:\Users\1113193\OneDrive\GitTFS\MDSTools\MDSTools.psd1 -ListAvailAble | Export-Configuration $Configuration -Scope Enterprise
        }
        Else {
            Write-Host "Export new value"
            $FirstEntry = @{$Name = $Value}
            Get-Module C:\Users\1113193\OneDrive\GitTFS\MDSTools\MDSTools.psd1 -ListAvailAble | Export-Configuration $FirstEntry -Scope Enterprise
        }
    }
    end {}
}