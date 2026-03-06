<#
.SYNOPSIS
    This script remediates WN11-CC-000195 by enforcing the "Enhanced Anti-Spoofing" requirement for Windows Hello facial recognition. 
    This is a critical biometric security measure that requires specialized hardware (like an IR camera) to distinguish between a live 
    human face and a static image or replica, significantly hardening the authentication process.

.NOTES
    Author          : Jason Stokes
    LinkedIn        : https://www.linkedin.com/in/jason-stokes-50144518a/
    GitHub          : https://github.com/jasonstokes1
    Date Created    : 03-02-2026
    Last Modified   : 03-06-2026
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000195

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN11-CC-000195).ps1 
#>

# Define the registry path for Facial Biometrics policy
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Biometrics\FacialFeatures"
$name = "EnhancedAntiSpoofing"
$value = 1 # 1 = Enabled

# Ensure the registry path exists
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}

# Set the value to 1 to enable enhanced anti-spoofing
New-ItemProperty -Path $registryPath -Name $name -Value $value -PropertyType DWord -Force | Out-Null

Write-Host "WN11-CC-000195: Enhanced anti-spoofing for facial recognition enabled." -ForegroundColor Green
