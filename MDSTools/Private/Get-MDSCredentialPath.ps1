function Get-MDSCredentialPath {
	[cmdletbinding()]
    param(
        [string]$FileName
    )

    begin {}
    process {
        $ConfigurationMachinePath = (Get-StoragePath -Scope User)
        Join-Path $ConfigurationMachinePath $FileName
    }
    end {}

}
