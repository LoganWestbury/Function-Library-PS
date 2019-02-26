function textSeperateLine {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $True)]
        [String]$inputString
    )
	
    [Environment]::NewLine
    Write-Host $inputString
    [Environment]::NewLine
}
