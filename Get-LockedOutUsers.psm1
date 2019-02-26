function scanADForLockedOutUsers {
    textSeperateLine -inputString 'List of currently locked out users from Active Directory:'
    Search-ADAccount -LockedOut | Format-Table Name, LastLogonDate, PasswordExpired, PasswordNeverExpires, SamAccountName -Wrap
}