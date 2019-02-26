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
