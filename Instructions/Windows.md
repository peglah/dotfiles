# Windows dark theme
```cmd
ms-settings:colors
```

# [Disable Shake to minimize](https://www.technipages.com/how-to-disable-shake-to-minimize-in-windows-10)
```cmd
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v DisallowShaking /t REG_DWORD /d 1 /f
```

# [WSL2](https://learn.microsoft.com/en-us/windows/wsl/install)
```cmd
wsl --install -d Debian
```

