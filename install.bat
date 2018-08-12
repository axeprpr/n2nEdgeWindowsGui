@echo off
Rd "%WinDir%\system32\test_permissions" >NUL 2>NUL
md "%WinDir%\System32\test_permissions" 2>NUL||(Echo Please run as administrator£¡&&Pause >nul&&Exit)
Rd "%WinDir%\System32\test_permissions" 2>NUL
start /wait %~dp0\tap-windows-9.21.2.exe
taskkill /im edge.exe /f
taskkill /im n2nGui.exe /f
del /f /s /q "%ProgramFiles%\n2nGui\*.*"
rd /q /s "%ProgramFiles%\n2nGui\"
rd /q /s "%ProgramFiles%\n2nGui"
md "%ProgramFiles%\n2nGui"
xcopy /s/h/e/k/f/c "%~dp0\n2n" "%ProgramFiles%\n2nGui\n2n\"
xcopy /s/h/e/k/f/c "%~dp0\main.ico" "%ProgramFiles%\n2nGui\"
xcopy /s/h/e/k/f/c "%~dp0\n2nGui.exe" "%ProgramFiles%\n2nGui\"
xcopy /s/h/e/k/f/c "%~dp0\conf.ini" "%ProgramFiles%\n2nGui\"
shortcut.exe /a:c /f:"%userprofile%\desktop\n2nGui.lnk" /t:"%ProgramFiles%\n2nGui\n2nGui.exe" /w:"%ProgramFiles%\n2nGui"

