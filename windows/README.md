# Personal Environment

### Execution Policy

- Run PowerShell as Administrator

```powershell
Get-ExecutionPolicy
```

```powershell
Set-ExecutionPolicy RemoteSigned
```

### Windows Administration

- [Tools](https://learn.microsoft.com/en-us/sysinternals/downloads/)
- [Autoruns](https://learn.microsoft.com/en-us/sysinternals/downloads/autoruns)
- [Process Explorer](https://learn.microsoft.com/en-us/sysinternals/downloads/process-explorer)

### Remove Bloatware

- Run PowerShell as Administrator

```powershell
DISM /Online /Get-ProvisionedAppxPackages | select-string Packagename
DISM /Online /Remove-ProvisionedAppxPackage /PackageName:"<Package_Name_Here>"
```
