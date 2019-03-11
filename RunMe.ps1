# Run
$scriptDir = Split-Path ($MyInvocation.MyCommand.Path)
Import-Module $scriptDir\Open-LinkInChrome.psm1

Write-Host ("Running scripts from: $scriptDir")

Write-Host ("Running Open URL")

Open-LinkInChrome

