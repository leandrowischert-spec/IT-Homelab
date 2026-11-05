# PowerShell Script – Test Results

**Script:** Get-EnabledADUsers.ps1  
**Environment:** Windows Server 2025, Active Directory Domain Services  
**Target server:** DC01  
**Execution method:** PowerShell Direct (Hyper-V)

## Objective
Retrieve all enabled Active Directory user accounts and display their names, account names and enabled status.

## Test Results
- Script executed successfully on DC01.
- Seven enabled Active Directory accounts returned.
- Output verified against the lab environment.
- No execution errors after resolving the script's security-zone restriction.

## Troubleshooting
The script was initially blocked by the RemoteSigned execution policy because it contained a Zone.Identifier security marker.

After reviewing the script content, the file was unblocked using Unblock-File without changing the system-wide execution policy.

## Outcome
Successful execution and verification of an Active Directory administration script.
