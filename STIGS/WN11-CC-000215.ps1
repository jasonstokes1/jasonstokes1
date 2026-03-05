<#
.SYNOPSIS
    This PowerShell script enforces the DISA STIG requirement WN11-CC-000215 for Windows 11. 
    It disables the AutoPlay/AutoRun feature across all drive types to prevent the automatic -
    execution of potentially malicious code or scripts when external media (such as USB flash drives -
    or external hard drives) is connected to the system.
    
.NOTES
    Author          : Jason Stokes
    LinkedIn        : https://www.linkedin.com/in/jason-stokes-50144518a/
    GitHub          : https://github.com/jasonstokes1
    Date Created    : 03-02-2026
    Last Modified   : 03-05-2026
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000215

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

# Disable AutoRun/AutoPlay on all drives
$path = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer"
if (-not (Test-Path $path)) { New-Item $path -Force | Out-Null }
New-ItemProperty -Path $path -Name "NoDriveTypeAutoRun" -Value 255 -PropertyType DWord -Force | Out-Null
Write-Host "WN11-CC-000215: AutoPlay disabled for all drives." -ForegroundColor Green
