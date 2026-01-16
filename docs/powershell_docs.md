# Powershell notes

| Variable   | Description                                                                                                                                                                  |
| ---------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `$PROFILE` | Contains the full path of the PowerShell profile for the current user and the current host application.. `Microsoft.PowerShell_profile.ps1` equivalent to `.bashrc` in Linux |
| `$HOME`    | Contains the full path of the user's home directory.                                                                                                                         |
| `$?`       | Contains the execution status of the last command.                                                                                                                           |

## Create alias

```powershell
Set-Alias ll ls
```
