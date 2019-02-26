function Get-VEDStartDate{
# Clear console
Clear-Host

# Display Title
Write-Host ("=============================================================================")
Write-Host ("VED Start Date Calculator")
Write-Host ("The expiry date can be found via the DVLA site vehicleenquiry.service.gov.uk")
Write-Host ("=============================================================================")

# Get user inputs
$expiryDay = Read-Host("Enter the expiry day")
$expiryMonth = Read-Host("Enter the expiry month")
$expiryYear = Read-Host("Enter the expiry year")

# Set date format to UK 
$cultureENGB = New-Object System.Globalization.CultureInfo("en-GB")

# Parse expiry date into datetime object
$expiryDate = ([datetime]($expiryMonth + "/" + $expiryDay + "/" + $expiryYear))

# Calculate start date by going back 5 years and adding 1 day 
$startDate = (($expiryDate.AddYears(-5).AddDays(1)))

# Format both dates into dd/MM/YYYY
$expiryDateFormatted = ($expiryDate).toString("dd/MM/yyyy", $cultureENGB)
$startDateFormatted = ($startDate).toString("dd/MM/yyyy", $cultureENGB)

# Clear console
Clear

# Display outputs to console
Write-Host ("========================================")
Write-Host ("Start Date  = " + $startDateFormatted)
Write-Host ("========================================")
Write-Host ("Expiry Date = " + $expiryDateFormatted)
Write-Host ("========================================")
}

