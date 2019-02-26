# Run

$scriptpath = $MyInvocation.MyCommand.Path
$scriptDir = Split-Path $scriptpath

Import-Module $totalDir\Open-LinkInChrome.psm1

openLinkInChrome -url "www.ebay.com"