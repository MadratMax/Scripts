param (
	[Parameter(Mandatory = $true)]
	[string]$testResultsFile
)

if (Test-Path "$testResultsFile") {
$ns = @{dns="http://microsoft.com/schemas/VisualStudio/TeamTest/2010"}

[xml]$xml = Get-Content $testResultsFile

$passedNames = Select-Xml -Path "$testResultsFile" -XPath "//dns:UnitTestResult[@testName]" -Namespace $ns | foreach {$_.node} | ? { $_.outcome -eq "passed" } | select testName
$failedNames = Select-Xml -Path "$testResultsFile" -XPath "//dns:UnitTestResult[@testName]" -Namespace $ns | foreach {$_.node} | ? { $_.outcome -eq "failed" } | select testName
$skippedNames = Select-Xml -Path "$testResultsFile" -XPath "//dns:UnitTestResult[@testName]" -Namespace $ns | foreach {$_.node} | ? { $_.outcome -eq "skipped" } | select testName
$testCaseCount = Select-Xml -Path "$testResultsFile" -XPath '//dns:Counters[@total]' -Namespace $ns | foreach {$_.node} | select total
$testCaseExecuted = Select-Xml -Path "$testResultsFile" -XPath '//dns:Counters[@executed]' -Namespace $ns | foreach {$_.node} | select executed
$testCasePassed = Select-Xml -Path "$testResultsFile" -XPath '//dns:Counters[@passed]' -Namespace $ns | foreach {$_.node} | select passed
$testCaseFailed = Select-Xml -Path "$testResultsFile" -XPath '//dns:Counters[@failed]' -Namespace $ns | foreach {$_.node} | select failed
$testCaseSkippedCount = $testCaseCount.total - $testCaseExecuted.executed

Write-Host
$passedTestsNames = $passedNames.testName -join "`r`n Passed: " | Out-String
$failedTestsNames = $failedNames.testName -join "`r`n Failed: " | Out-String
$skippedTestsNames = $skippedNames.testName -join "`r`n Skipped: " | Out-String
$totalTestsNames = $total.testName -join "`r`n Total: " | Out-String

Write-Host " Total tests executed:" $testCaseCount.total -foregroundcolor gray
Write-Host " Passed:"  $testCasePassed.passed -foregroundcolor gray
Write-Host " Failed:"  $testCaseFailed.failed -foregroundcolor gray
Write-Host " Skipped:" $testCaseSkippedCount -foregroundcolor gray
Write-Host

if(-not ($passedNames.Count -eq 0))
{
Write-Host " Passed:" $passedTestsNames -foregroundcolor green
}
if(-not ($failedNames.Count -eq 0))
{
Write-Host " Failed:" $failedTestsNames -foregroundcolor red
}
if(-not ($testCaseSkippedCount -eq 0))
{
Write-Host " Skipped:" $skippedTestsNames -foregroundcolor yellow
}
Write-Host 
} else{
Write-Error "Please provide TestResults file as an argument"
}