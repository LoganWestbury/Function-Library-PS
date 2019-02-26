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

function remoteShutdownChecker {
    # Script for displaying scanning the event log of a remote PC and displaying when the PC has been shutdown/restarted.
    # LW - 16/09/2016 
    # Version 1.1
    # Added - Displaying a counter for how many times the PC has been shutdown.
	
    # Begin Script

    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $True)]
        [String]$remoteComputer
    )
	
    $amountOfDays = 90
	
    # Setting the filter - saves resources by not scanning the entire event log
    $FilterLog = @{
        # Sets which part of the event log to search (Security, System etc...)
        LogName   = "System"
        # Sets how far back in the log to check
        StartTime = (Get-Date).AddDays(- $amountOfDays)
        # Set the filter for the event log to the ID '6006' 
        ID        = 6006
    }
	
    # Get User input for remote IP 
    # $remoteComputer = Read-Host 'Input Remote IP / Terminal Name'
	
    # This section actually searches remote PC for shutdowns and puts the output into the variable
    $Events = Get-WinEvent -ComputerName $remoteIP -FilterHashtable $FilterLog
	
    # Count the amount of times the event has happened. In this case it is how many times the PC has been shut down.
    $amountOfRestarts = $Events.Count
	
    # Displaying how many times the PC has been restarted to console 
    textSeperateLine -inputString "The PC with IP $remoteIP has been shut down $amountOfRestarts times in the last $amountOfDays days."
	
    # Display to console the output log
    Get-WinEvent -ComputerName $remoteComputer -FilterHashtable $FilterLog | Format-Table -AutoSize
}

function openLinkInChrome { 

	[CmdletBinding()]
    Param (
        [Parameter(Mandatory = $True)]
        [String]$url
    )

    try {
        $chrome = (Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\chrome.exe').'(Default)'
        Start-Process "$chrome" $url
    }
    catch {
        Start-Process $url
    }
}

openLinkInChrome
