param (
	[Parameter(Mandatory = $true)]
	[string]$inputJson,
	[string]$key1 = "",
	[string]$key2 = "",
	[string]$key3 = "",
	[string]$key4 = "",
	[string]$key5 = "",
	[string]$key6 = "",
	[string]$key7 = "",
	[string]$key8 = "",
	[string]$key9 = "",
	[string]$key10 = ""
)

$content = (Get-Content $inputJson | ConvertFrom-Json)

if($PSBoundParameters.Count -eq 2){
$content = $content.$key1
}
if($PSBoundParameters.Count -eq 3){
$content | ConvertTo-Json -depth 32 | Out-Null
$content = $content.$key1
$content | ConvertTo-Json -depth 32 | Out-Null
$content = $content.$key2
}
if($PSBoundParameters.Count -eq 4){
$content | ConvertTo-Json -depth 32 | Out-Null
$content = $content.$key1
$content | ConvertTo-Json -depth 32 | Out-Null
$content = $content.$key2
$content | ConvertTo-Json -depth 32 | Out-Null
$content = $content.$key3
}
if($PSBoundParameters.Count -eq 5){
$content | ConvertTo-Json -depth 32 | Out-Null
$content = $content.$key1
$content | ConvertTo-Json -depth 32 | Out-Null
$content = $content.$key2
$content | ConvertTo-Json -depth 32 | Out-Null
$content = $content.$key3
$content | ConvertTo-Json -depth 32 | Out-Null
$content = $content.$key4
}
if($PSBoundParameters.Count -eq 6){
$content | ConvertTo-Json -depth 32 | Out-Null
$content = $content.$key1
$content | ConvertTo-Json -depth 32 | Out-Null
$content = $content.$key2
$content | ConvertTo-Json -depth 32 | Out-Null
$content = $content.$key3
$content | ConvertTo-Json -depth 32 | Out-Null
$content = $content.$key4
$content | ConvertTo-Json -depth 32 | Out-Null
$content = $content.$key5
}
if($PSBoundParameters.Count -eq 7){
$content | ConvertTo-Json -depth 32 | Out-Null
$content = $content.$key1
$content | ConvertTo-Json -depth 32 | Out-Null
$content = $content.$key2
$content | ConvertTo-Json -depth 32 | Out-Null
$content = $content.$key3
$content | ConvertTo-Json -depth 32 | Out-Null
$content = $content.$key4
$content | ConvertTo-Json -depth 32 | Out-Null
$content = $content.$key5
$content | ConvertTo-Json -depth 32 | Out-Null
$content = $content.$key6
}
if($PSBoundParameters.Count -eq 8){
$content | ConvertTo-Json -depth 32 | Out-Null
$content = $content.$key1
$content | ConvertTo-Json -depth 32 | Out-Null
$content = $content.$key2
$content | ConvertTo-Json -depth 32 | Out-Null
$content = $content.$key3
$content | ConvertTo-Json -depth 32 | Out-Null
$content = $content.$key4
$content | ConvertTo-Json -depth 32 | Out-Null
$content = $content.$key5
$content | ConvertTo-Json -depth 32 | Out-Null
$content = $content.$key6
$content | ConvertTo-Json -depth 32 | Out-Null
$content = $content.$key7
}
if($PSBoundParameters.Count -eq 9){
$content | ConvertTo-Json -depth 32 | Out-Null
$content = $content.$key1
$content | ConvertTo-Json -depth 32 | Out-Null
$content = $content.$key2
$content | ConvertTo-Json -depth 32 | Out-Null
$content = $content.$key3
$content | ConvertTo-Json -depth 32 | Out-Null
$content = $content.$key4
$content | ConvertTo-Json -depth 32 | Out-Null
$content = $content.$key5
$content | ConvertTo-Json -depth 32 | Out-Null
$content = $content.$key6
$content | ConvertTo-Json -depth 32 | Out-Null
$content = $content.$key7
$content | ConvertTo-Json -depth 32 | Out-Null
$content = $content.$key8
}
if($PSBoundParameters.Count -eq 10){
$content | ConvertTo-Json -depth 32 | Out-Null
$content = $content.$key1
$content | ConvertTo-Json -depth 32 | Out-Null
$content = $content.$key2
$content | ConvertTo-Json -depth 32 | Out-Null
$content = $content.$key3
$content | ConvertTo-Json -depth 32 | Out-Null
$content = $content.$key4
$content | ConvertTo-Json -depth 32 | Out-Null
$content = $content.$key5
$content | ConvertTo-Json -depth 32 | Out-Null
$content = $content.$key6
$content | ConvertTo-Json -depth 32 | Out-Null
$content = $content.$key7
$content | ConvertTo-Json -depth 32 | Out-Null
$content = $content.$key8
$content | ConvertTo-Json -depth 32 | Out-Null
$content = $content.$key9
}
if($PSBoundParameters.Count -eq 11){
$content | ConvertTo-Json -depth 32 | Out-Null
$content = $content.$key1
$content | ConvertTo-Json -depth 32 | Out-Null
$content = $content.$key2
$content | ConvertTo-Json -depth 32 | Out-Null
$content = $content.$key3
$content | ConvertTo-Json -depth 32 | Out-Null
$content = $content.$key4
$content | ConvertTo-Json -depth 32 | Out-Null
$content = $content.$key5
$content | ConvertTo-Json -depth 32 | Out-Null
$content = $content.$key6
$content | ConvertTo-Json -depth 32 | Out-Null
$content = $content.$key7
$content | ConvertTo-Json -depth 32 | Out-Null
$content = $content.$key8
$content | ConvertTo-Json -depth 32 | Out-Null
$content = $content.$key9
$content | ConvertTo-Json -depth 32 | Out-Null
$content = $content.$key10
}
write-host "value: " $content