param (
	[Parameter(Mandatory = $true)]
	[string]$testResultsFile,
	[string]$node1 = "Message",
	[string]$node2 = "StackTrace"
)
if (Test-Path "$testResultsFile") {
$nameSpaceRegex = 'xmlns(?<content>.*)'
foreach($line in Get-Content $testResultsFile) {
    if($line -match $nameSpaceRegex){
		$nm = $matches['content'].split("`n")|%{
		$_.split('"')[1]
		}	
			if($nm -eq $Null){
				$nm = $matches['content'].split("`n")|%{
				$_.split("'")[1]
			}	
		}
    }
}
Write-Host $nm

$ns = @{dns="$nm"}
[xml]$xml = Get-Content $testResultsFile
$errorText = Select-Xml -Path "$testResultsFile" -XPath "//dns:$node1" -Namespace $ns | foreach {$_.node} | select
$stackTraceErrorText = Select-Xml -Path "$testResultsFile" -XPath "//dns:$node2" -Namespace $ns | foreach {$_.node} | select
Write-Host
Write-Host ==============================================================================
$mostCommonError = $errorText.'#text' | sort | group | sort Count | select Name -last 1
Write-Host "Most commomn error text: " 
Write-Host $mostCommonError.Name
$mostCommonErrorCount = $errorText.'#text' | sort | group | sort Count | select Count
Write-Host
Write-Host "Number of repetitions : " $mostCommonErrorCount.Count
Write-Host ==============================================================================
$mostStackTraceError = $stackTraceErrorText.'#text' | sort | group | sort Count | select Name -last 1
Write-Host "Most commomn stack trace message: "
Write-Host $mostStackTraceError.Name
$mostStackTraceErrorCount = $stackTraceErrorText.'#text' | sort | group | sort Count | select Count
Write-Host
Write-Host "Number of repetitions : " $mostStackTraceErrorCount.Count
Write-Host ==============================================================================
}else{
Write-Error "Please provide TestResults file as an argument"
}