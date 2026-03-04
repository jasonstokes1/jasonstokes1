 <#
.SYNOPSIS
    This PowerShell script enforces the WN11-CC-000315 security requirement by disabling the "Always install with elevated privileges" feature. 
It programmatically sets the AlwaysInstallElevated registry value to 0 in both the local machine and Current User hives to prevent
unauthorized privilege escalation via Windows Installer (.msi) files.

.NOTES
    Author          : Jason Stokes
    LinkedIn        : https://www.linkedin.com/in/jason-stokes-50144518a/
    GitHub          : https://github.com/jasonstokes1
    Date Created    : 2026-03-02
    Last Modified   : 2024-03-03
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

# Define the registry paths
$paths = @(
    "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Installer",
    "HKCU:\SOFTWARE\Policies\Microsoft\Windows\Installer"
)

$name = "AlwaysInstallElevated"
$value = 0 # 0 = Disabled

foreach ($path in $paths) {
    # Create the key if it doesn't exist
    if (-not (Test-Path $path)) {
        New-Item -Path $path -Force | Out-Null
        Write-Host "Created path: $path" -ForegroundColor Cyan
    }

    # Set the value to 0
    New-ItemProperty -Path $path -Name $name -Value $value -PropertyType DWord -Force | Out-Null
    Write-Host "Set $name to $value in $path" -ForegroundColor Green
} 
