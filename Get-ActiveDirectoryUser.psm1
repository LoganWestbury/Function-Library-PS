function queryActiveDirectoryUser {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $True)]
        [String]$employeeID
    )
	
    Get-ADUser $employeeID -Properties * | Format-List Name, Company, Department, Description, Office, EmailAddress, Logoncount, Created, LastLogonDate, LastBadPasswordAttempt, PasswordNeverExpires, LockedOut
}