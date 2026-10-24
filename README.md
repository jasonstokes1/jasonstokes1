# <a href="https://www.linkedin.com/in/jason-stokes-50144518a/">Jason Stokes</a>'s IT and Cybersecurity Project Portfolio 🔐

**Cybersecurity Analyst Intern @ LOG(N) Pacific** · Aspiring SOC Analyst

I investigate real alerts end to end in Microsoft Sentinel and Defender for Endpoint: triage, KQL hunting, verdict, and containment. Highlights: building custom detection rules, finding and closing a gap in my own detections, remediating High-severity vulnerabilities with Tenable, and an AI agent that hunts threats in plain English.

`Microsoft Sentinel` · `Defender for Endpoint` · `KQL` · `Tenable` · `Azure` · `MITRE ATT&CK` · `Incident Response` · `Linux` · `PowerShell`

## 🤖 Agentic AI Security Engineering

- **[Agentic AI SOC Analyst](https://github.com/jasonstokes1/agentic-ai-soc-analyst)** - Natural-language threat hunting across Azure Log Analytics and Microsoft Defender. Plans its own KQL queries, maps findings to MITRE ATT&CK with graded confidence, and isolates compromised hosts only after human authorization. Demonstrated across macOS, Windows PowerShell, Visual Studio, and Linux.

## 🚨 Threat Hunting, Incident Response & Security Operations

- **[SOC Analyst Investigations — LOG(N) Pacific Internship](https://github.com/jasonstokes1/soc-analyst-portfolio)** - Four alert-to-verdict investigations in Sentinel and Defender: password spraying (including a detection gap I found and closed with a new rule), a stolen admin password that let attackers turn a server into an attack tool with a brute-forcer disguised as Chrome, a ransomware attack chain with device isolation, and a Linux tool-download case.
- **[Threat Hunting Scenario (Tor Browser Usage)](https://github.com/jasonstokes1/threat-hunting-scenario-tor)** - End-to-end threat hunt that confirmed an employee downloaded, silently installed, and used the TOR browser to bypass network controls. Traced the full chain across DeviceFileEvents, DeviceProcessEvents, and DeviceNetworkEvents with KQL - from installer download to a live connection to a TOR entry node on port 9001 - then built a chronological timeline and isolated the endpoint.
- **[MySQL Database Ransom — Incident Response & DFIR Case Study](https://github.com/jasonstokes1/mysql-ransom-incident-response)** - Investigated an internet-exposed MySQL server destroyed by an automated ransom actor under 5 hours after exposure. Reconstructed the attack from MySQL audit logs and Defender KQL hunts, proved the data was destroyed (not stolen) and the Windows host was never breached, and corroborated it with a pre/post host-forensics package diff. Includes a Sentinel geo-map of attack origins.
- **[Operation ECHOLEAK — AI Prompt Injection & Copilot Data Exfiltration](https://github.com/jasonstokes1/Operation-ECHOLEAK)** - Investigated how a single phishing email tricked Microsoft 365 Copilot into stealing 13 confidential files with no hacked account and no malware. Traced the attack across Sentinel logs using KQL, proved how the data left the company, and recommended detections and fixes.

## 🛰️ Microsoft Sentinel SIEM

- **[Geo Map - Global Auth](https://github.com/jasonstokes1/sentinel-siem-geo-map-global-auth)** - Workbook mapping where remote logons (RDP and network) come from, sized by attempts and colored by successes, to spot a successful login from a country the business doesn't operate in. Built on `DeviceLogonEvents` with KQL geolocation.
- **[Geo Map - Outbound Connections](https://github.com/jasonstokes1/sentinel-siem-geo-map-outbound-c2)** - Maps where endpoints connect out to, with Microsoft and Azure traffic filtered out, to surface possible command-and-control servers contacted by many devices at once.
- **[Geo Map - Data Exfiltration](https://github.com/jasonstokes1/sentinel-siem-geo-map-data-exfil)** - Maps outbound data volume by destination using Azure flow logs (`NTANetAnalytics`), to show how much data is leaving the network and where it's going.
- **[Geo Map - Inbound Threat Intel](https://github.com/jasonstokes1/sentinel-siem-geo-map-inbound-threat-intel)** - Joins a live threat-intelligence feed against accepted network traffic to show known-malicious IPs that actually got in, not just ones that tried.
- **[Geo Map - Admin Operations](https://github.com/jasonstokes1/sentinel-siem-geo-map-admin-ops)** - Designed independently from a raw `AzureActivity` schema: maps where Azure admin actions (starting VMs, running commands, changing settings) come from, colored by failure rate, to catch a stolen admin credential probing its permissions.

## ⚠️ Vulnerability Management

- **[Vulnerability Management Program Implementation](https://github.com/jasonstokes1/Vulnerability-Management-Program/tree/main)** - Built a vulnerability management program from scratch: policy, stakeholder buy-in, change-board approval, and Tenable authenticated scans. Six remediation rounds cut vulnerabilities 81% (26 → 5) and resolved 100% of critical findings.
- **[RDP Vulnerability Remediation: Find, Prove, Fix](https://github.com/jasonstokes1/rdp-vulnerability-remediation)** - Traced Tenable findings on an internet-facing Windows server to 3,435 failed RDP logins in Sentinel, rebuilt the same weaknesses on my own Azure VM, and fixed them with PowerShell and patching (High vulnerabilities 5 → 0, verified by rescan). Then locked RDP down with a network security group, cutting unsolicited internet connections from 229 to 0.

<hr/>

## 🤳 Connect With Me

[<img align="left" alt="Jason Stokes | LinkedIn" width="22px" src="https://cdn.jsdelivr.net/npm/simple-icons@v3/icons/linkedin.svg" />][linkedin]

[linkedin]: https://www.linkedin.com/in/jason-stokes-50144518a/
