$scriptpath = $MyInvocation.MyCommand.Path
$totalDir = Split-Path $scriptpath

Import-Module $totalDir\displayVersion.psm1
function showMenuReusable {
    Param (
        [CmdletBinding()]
        [Parameter(Mandatory = $True)]
        [Array]$menuItems
    )
    [Array]$tempMenuArray = $menuItems
			
    displayVersion
    $menuCounter = $tempMenuArray.Length
    $i = 0
			
    do {
        Write-Host ("Option $i : " + $tempMenuArray[$i])
        [Environment]::NewLine
        $i++
    }
    until ($i -eq $menuCounter)	
}