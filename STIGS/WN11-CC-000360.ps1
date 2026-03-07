<#
.SYNOPSIS
   This script remediates WN11-CC-000360 by disabling Digest authentication for the Windows Remote Management (WinRM) client. 
   This enforcement ensures that the workstation does not use weak authentication handshakes when connecting to remote servers, 
   reducing the risk of credential interception and replay attacks.
    
.NOTES
    Author          : Jason Stokes
    LinkedIn        : https://www.linkedin.com/in/jason-stokes-50144518a/
    GitHub          : https://github.com/jasonstokes1
    Date Created    : 03-02-2026
    Last Modified   : 03-07-2026
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000360

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN11-CC-000360.).ps1 
#>

# Define the registry path for WinRM Client policy
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Client"
$name = "AllowDigest"
$value = 0 # 0 = Disabled (This Disallows Digest authentication)

# Ensure the registry path exists
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}

# Set the value to 0 to disallow Digest authentication
New-ItemProperty -Path $registryPath -Name $name -Value $value -PropertyType DWord -Force | Out-Null

Write-Host "WN11-CC-000360: WinRM Digest authentication has been disallowed." -ForegroundColor Green
