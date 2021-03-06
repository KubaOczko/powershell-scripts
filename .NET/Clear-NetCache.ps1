# Stop IIS service
iisreset /Stop /Timeout:0


# Get .NET framework root
$netRoot = (Get-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\.NETFramework' -Name InstallRoot).InstallRoot

# Search for Temporary folders (within all framework versions)
$aspNetTempFolders = Get-ChildItem -Path $netRoot -Directory -Filter 'Temporary ASP.NET Files' -Recurse

# Delete all data in temp folders
foreach ($path in $aspNetTempFolders.FullName)
{
    $path += "\*"
    Remove-Item -Path $path -Recurse -Force
}

# Start IIS service
iisreset /Start /Timeout:0
