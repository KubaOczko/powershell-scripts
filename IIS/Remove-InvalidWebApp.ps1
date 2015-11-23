<#
    Removes web application without existing target path.
#>
$site = "Default Web Site"
$webApps = Get-WebApplication -Site $site

ForEach($webApp in $webApps){
    if (!(Test-Path -Path $webApp.PhysicalPath))
    {
        Remove-WebApplication -Site $site -Name $webApp.path
        Write-Host $webApp.path ' removed...'
    }
}
