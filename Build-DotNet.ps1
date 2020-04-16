param
(
	[parameter(Mandatory=$true)]
	[String] $solutionPath,
	
	[parameter(Mandatory=$false)]
	[bool] $nuget = $false,
	
	[parameter(Mandatory=$false)]
	[bool] $clean = $true
)
process
{
	$buildPath = $solutionPath

	$msBuildExe = "msbuild.exe"

	Write-Host
	if ($nuget) {
		Write-Host "Restoring NuGet packages" -foregroundcolor green
		nuget restore "$($buildPath)"
	}
	if ($clean) {
		Write-Host "Cleaning $($path)" -foregroundcolor green
		& "$($msBuildExe)" "$($buildPath)" /t:Clean /m /p:WarningLevel=0
		Write-Host
	}
	Write-Host "Building $($buildPath)" -foregroundcolor green
	$build = & "$($msBuildExe)" "$($buildPath)" /t:Build /m /verbosity:quiet /p:WarningLevel=1	
	$errorCounter = $build.count
	if($errorCounter -gt 3)
	{
		Write-Host
		Write-Host "Build failed" -foregroundcolor red
		Write-Host $build			
	}
	if($errorCounter -le 3)
	{
		Write-Host
		Write-Host "Done" -foregroundcolor green
	}	
}