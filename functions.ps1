function Get-TimesResult{ 
Param ([int]$a,[int]$b)
$c = $a * $b
Write-Output $c
}
Test-Connection