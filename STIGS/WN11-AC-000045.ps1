<#
.SYNOPSIS
    This PowerShell script programmatically enforces the DISA STIG requirement WN11-AC-000045 for Windows 11. 
    It ensures that the system automatically initiates a screen lock after a specific period of inactivity to prevent unauthorized access to an unattended workstation.
    
.NOTES
    Author          : Jason Stokes
    LinkedIn        : https://www.linkedin.com/in/jason-stokes-50144518a/
    GitHub          : https://github.com/jasonstokes1
    Date Created    : 03-02-2026
    Last Modified   : 03-04-2026
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AC-000045

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN11-AC-000045).ps1 
#>

# Set screen saver timeout to 900 seconds (15 minutes)
$path = "HKCU:\Control Panel\Desktop"
Set-ItemProperty -Path $path -Name "ScreenSaveTimeOut" -Value "900" -Force
Write-Host "WN11-AC-000045: Timeout set to 15 minutes." -ForegroundColor Green
