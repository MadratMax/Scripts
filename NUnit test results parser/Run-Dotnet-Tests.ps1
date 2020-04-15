param (
	[Parameter(Mandatory = $true)]
	[string]$pathToTestDll,
	[string]$category = "smoke"
)

$invocation = (Get-Variable MyInvocation).Value
$directorypath = Split-Path $invocation.MyCommand.Path

Write-Host "[INFO] Starting tests with category $category"

$runsettings = @"
<?xml version="1.0" encoding="utf-8"?>
<RunSettings><TestRunParameters>
<Parameter name="IncomingCategory" value="$category" />
</TestRunParameters>
</RunSettings>
"@

$runsettings | Out-File -FilePath run.runsettings

& dotnet vstest $pathToTestDll /TestCaseFilter:TestCategory=$category /Settings:run.runsettings  --logger:"trx;LogFileName=$directorypath\TestResult.xml"

Write-Host "[INFO] Removing runsettings"
Remove-Item run.runsettings -Force