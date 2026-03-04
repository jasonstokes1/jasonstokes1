<#
.SYNOPSIS
    This PowerShell script remediates WN11-AU-000050 by enabling Success auditing for the Process Creation subcategory within the Windows Detailed Tracking audit policy. 
    It utilizes the auditpol.exe utility to ensure that Event ID 4688 is generated whenever a process starts, providing a forensic trail for system activity and security monitoring.

.NOTES
    Author          : Jason Stokes
    LinkedIn        : https://www.linkedin.com/in/jason-stokes-50144518a/
    GitHub          : https://github.com/jasonstokes1
    Date Created    : 2026-03-02
    Last Modified   : 2024-03-04
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000315

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
# Define the subcategory and setting
$subcategory = "Process Creation"
$setting = "/success:enable"

# Apply the audit policy
Write-Host "Configuring Audit Policy for $subcategory..." -ForegroundColor Cyan

& auditpol /set /subcategory:"$subcategory" $setting

# Verify the setting
Write-Host "Verification:" -ForegroundColor Yellow
& auditpol /get /subcategory:"$subcategory"
