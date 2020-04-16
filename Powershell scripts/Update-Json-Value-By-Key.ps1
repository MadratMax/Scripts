param (
	[Parameter(Mandatory = $true)]
	[string]$inputJson,
	[Parameter(Mandatory = $true)]
	[string]$value,
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

$overwrite = $true
$newFileName = "updated_" + (Get-Date).ToString('dd-MM-yyyy_hh-mm-ss_tt') + ".json"

$content = (Get-Content $inputJson | ConvertFrom-Json)
$lastKey

if($PSBoundParameters.Count -eq 3){
$content.update | %{$content.$key1 = $value}
$lastKey = $key1
}
if($PSBoundParameters.Count -eq 4){
$content.update | %{$content.$key1.$key2 = $value}
$lastKey = $key2
}
if($PSBoundParameters.Count -eq 5){
$content = $content.$key1.$key2.$key3
$lastKey = $key3
}
if($PSBoundParameters.Count -eq 6){
$content = $content.$key1.$key2.$key3.$key4
$lastKey = $key4
}
if($PSBoundParameters.Count -eq 7){
$content = $content.$key1.$key2.$key3.$key4.$key5
$lastKey = $key5
}
if($PSBoundParameters.Count -eq 8){
$content = $content.$key1.$key2.$key3.$key4.$key5.$key6
$lastKey = $key6
}
if($PSBoundParameters.Count -eq 9){
$content = $content.$key1.$key2.$key3.$key4.$key5.$key6.$key7
$lastKey = $key7
}
if($PSBoundParameters.Count -eq 10){
$content = $content.$key1.$key2.$key3.$key4.$key5.$key6.$key7.$key8
$lastKey = $key8
}
if($PSBoundParameters.Count -eq 11){
$content = $content.$key1.$key2.$key3.$key4.$key5.$key6.$key7.$key8.$key9
$lastKey = $key9
}
if($PSBoundParameters.Count -eq 12){
$content = $content.$key1.$key2.$key3.$key4.$key5.$key6.$key7.$key8.$key9.$key10
$lastKey = $key10
}
if($overwrite){
$content | ConvertTo-Json -depth 32 | set-content $inputJson
}else{
$content | ConvertTo-Json -depth 32 | Out-File $newFileName -Append
}
write-host $inputJson updated:
write-host $lastKey ":" $value