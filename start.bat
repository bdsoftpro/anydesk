@echo off

:START_ANYDESK
start anydesk
ping 127.0.0.1 -n 10 > nul
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

echo del674569 | anydesk --set-password _full_access
echo AnyDesk ID is: %ID%
echo AnyDesk Password: del674569
echo You can login now!
