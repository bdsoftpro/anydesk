@echo off
powershell -Command "choco install anydesk -y --ignore-checksums"
powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/bdsoftpro/anydesk/main/start.bat -OutFile C:\Users\runneradmin\Desktop\software\start.bat"
set password=del!@12sha
powershell -Command "Set-LocalUser -Name 'runneradmin' -Password (ConvertTo-SecureString -AsPlainText '%password%' -Force)"
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /t REG_DWORD /d 0 /f
tzutil /s "Central America Standard Time"
