@echo off

:START_ANYDESK
start "C:\ProgramData\chocolatey\lib\anydesk.portable\tools\AnyDesk.exe"
ping 127.0.0.1 -n 4 > nul
for /f "delims=" %%i in ('"C:\ProgramData\chocolatey\lib\anydesk.portable\tools\AnyDesk.exe" --get-id') do (
    set ID=%%i
)
if "%ID%"=="" (
    taskkill /f /im anydesk.exe > nul
    goto START_ANYDESK
)
if "%ID%"=="0" (
    taskkill /f /im anydesk.exe > nul
    goto START_ANYDESK
)

echo disalardp | "C:\ProgramData\chocolatey\lib\anydesk.portable\tools\AnyDesk.exe" --set-password _full_access
echo AnyDesk ID is: %ID%
echo AnyDesk Password: disalardp
echo You can login now!
