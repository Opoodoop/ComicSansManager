@echo off
color 0a
:start 

if not exist "backup.reg" (
    echo backup.reg not found. Creating registry backup...
    reg export HKLM\Software backup.reg /y
    echo Backup created as backup.reg
) else (
    echo backup.reg already exists. No action taken.
)

echo What would you like to do?
echo 1 - Install
echo 2 - Uninstall

set /p option=

if %option%==1 (
    echo installing...
    start staged.reg
) else if %option%==2 (
    echo uninstalling...
    start backup.reg
) else (
    echo invalid choice
    goto start
)

echo finished
pause