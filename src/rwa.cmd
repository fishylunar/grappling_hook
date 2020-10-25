@echo off
 cls
powershell.exe /C "Get-Content .\grapplinghook.ps1 -Raw | Invoke-Expression"
pause
exit