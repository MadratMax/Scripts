param (
	[Parameter(Mandatory = $true)]
	[string]$file,
	[string]$nsNode = "xmlns"
)

$nameSpaceRegex = "$nsNode(?<content>.*)"

foreach($line in Get-Content $file) {
    if($line -match $nameSpaceRegex){
		$ns = $matches['content'].split("`n")|%{
		$_.split('"')[1]
		}	
			if($ns -eq $Null){
				$ns = $matches['content'].split("`n")|%{
				$_.split("'")[1]
			}	
		}			
		
		Write-Host $ns
    }
}