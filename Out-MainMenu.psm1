$scriptpath = $MyInvocation.MyCommand.Path
$totalDir = Split-Path $scriptpath
Import-Module $totalDir\showMenuReusable.psm1
function populateMainMenu {
    $menuItems = @(
        "Exit",
        "Remote Shutdown Checker",
        "Scan Active Directory for Locked Out Users",
        "User Lockout Location Checker",
        "Active Directory Query User with Employee ID"
    )
			
    showMenuReusable -menuItems $menuItems
}