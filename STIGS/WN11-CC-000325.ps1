<#
.SYNOPSIS
   This PowerShell script remediates WN11-CC-000325 by disabling the "Sign-in last interactive user automatically after a system-initiated restart" policy. 
   This prevents Windows from automatically caching and using user credentials to sign in after a reboot (such as those triggered by Windows Updates), 
   ensuring that no user session is active without explicit manual authentication.
    
.NOTES
    Author          : Jason Stokes
    LinkedIn        : https://www.linkedin.com/in/jason-stokes-50144518a/
    GitHub          : https://github.com/jasonstokes1
    Date Created    : 03-02-2026
    Last Modified   : 03-07-2026
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000325

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN11-CC-000325).ps1 
#>

# Define the registry path for Windows Logon Options
$registryPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"
$name = "DisableAutomaticRestartSignOn"
$value = 1 # 1 = Enabled (This disables the 'Auto Sign-in' feature)

# Ensure the registry path exists
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}

# Set the value to 1 to disable the automatic sign-in after restart
New-ItemProperty -Path $registryPath -Name $name -Value $value -PropertyType DWord -Force | Out-Null

Write-Host "WN11-CC-000325: Automatic sign-in after system restart disabled." -ForegroundColor Green
