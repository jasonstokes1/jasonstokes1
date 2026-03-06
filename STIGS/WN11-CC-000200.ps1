<#
.SYNOPSIS
    This script remediates WN11-CC-000200 by disabling the "Enumerate administrator accounts on elevation" policy. 
    This is a defensive hardening measure that prevents the User Account Control (UAC) prompt from displaying a list 
    of available administrator accounts, thereby obscuring administrative usernames from unauthorized users.
    
.NOTES
    Author          : Jason Stokes
    LinkedIn        : https://www.linkedin.com/in/jason-stokes-50144518a/
    GitHub          : https://github.com/jasonstokes1
    Date Created    : 03-02-2026
    Last Modified   : 03-06-2026
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000200

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN11-CC-000200).ps1 
#>

# Define the registry path for Credential User Interface policy
$registryPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\CredUI"
$name = "EnumerateAdministrators"
$value = 0 # 0 = Disabled

# Ensure the registry path exists
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}

# Set the value to 0 to disable administrator account enumeration
New-ItemProperty -Path $registryPath -Name $name -Value $value -PropertyType DWord -Force | Out-Null

Write-Host "WN11-CC-000200: Enumeration of administrator accounts on elevation disabled." -ForegroundColor Green
