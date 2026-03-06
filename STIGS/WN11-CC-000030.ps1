<#
.SYNOPSIS
   This PowerShell script remediates the WN11-CC-000030 security finding by disabling ICMP Redirects. 
   While the STIG documentation often refers to this as an "MSS (Legacy)" template setting, the script 
   achieves compliance by directly modifying the Windows TCP/IP stack behavior in the registry.
    
.NOTES
    Author          : Jason Stokes
    LinkedIn        : https://www.linkedin.com/in/jason-stokes-50144518a/
    GitHub          : https://github.com/jasonstokes1
    Date Created    : 03-02-2026
    Last Modified   : 03-06-2026
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000030

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN11-CC-000030).ps1 
#>

# Define the registry path for MSS Legacy ICMP Redirects
$registryPath = "HKLM:\System\CurrentControlSet\Services\Tcpip\Parameters"
$name = "EnableICMPRedirect"
$value = 0 # 0 = Disabled

# Ensure the registry path exists (it usually does for Tcpip\Parameters)
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}

# Set the value to 0 to disable ICMP redirects
New-ItemProperty -Path $registryPath -Name $name -Value $value -PropertyType DWord -Force | Out-Null

Write-Host "WN11-CC-000030: ICMP Redirects have been disabled." -ForegroundColor Green
