 @echo off
 type src\cool.txt
:ask
echo Do you want to run it with, or without admin permissions? (true\false)
set /P admin=
if %admin%==true (
    echo Running as admin
    start powershell.exe /C ".\src\raa.cmd"
) else (
    if %admin%==false (
        echo Running without admin permissions
        cd src
        rwa.cmd
        ) else (
            echo Invalid Answer. you must reply with "true" or "false"
            goto ask
        )
)