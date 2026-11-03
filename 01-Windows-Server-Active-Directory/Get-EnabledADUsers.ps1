
# Get-EnabledADUsers.ps1
# Lists all enabled Active Directory users.
# Requires the ActiveDirectory PowerShell module.

Import-Module ActiveDirectory -ErrorAction Stop

Get-ADUser -Filter 'Enabled -eq $true' `
    -Properties Enabled |
    Select-Object Name, SamAccountName, Enabled |
    Sort-Object Name
