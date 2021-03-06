function IsCloudShellEnvironment {
    <#
    .Synopsis Is Cloud Shell Environment
    #>
    if ((-not (Test-Path env:"ACC_CLOUD")) -or ((get-item env:"ACC_CLOUD").Value -ne "PROD")) {
        return $false
    }
    return $true
}
