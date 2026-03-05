 <#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Jason Stokes
    LinkedIn        : https://www.linkedin.com/in/jason-stokes-50144518a/
    GitHub          : https://github.com/jasonstokes1
    Date Created    : 03-02-2026
    Last Modified   : 03-03-2026
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AU-000500

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN11-AU-000500).ps1 
#>

# Define the registry path and property details
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application"
$name = "MaxSize"
$value = 0x8000 # This is 32768 in hexadecimal

# Check if the path exists; if not, create it
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
    Write-Host "Created registry path: $registryPath" -ForegroundColor Cyan
}

# Create or overwrite the dword value
New-ItemProperty -Path $registryPath -Name $name -Value $value -PropertyType DWord -Force | Out-Null

Write-Host "Successfully set $name to $value at $registryPath" -ForegroundColor Green 
