@echo off & mode 33,3
Title Windows Cleaner

::Check If User Has Admin Privileges
timeout /t 1 /nobreak > NUL
openfiles > NUL 2>&1
if %errorlevel%==0 (
    echo Running..
) else (
    mode 46,4
    color 04
    echo  You must run the file in Administrator mode.
    echo.
    echo  Press any key to exit..
    pause > NUL
    exit
)

color 0a

Call :0

::Delete Junk Files
del c:\*.log /a/s/q/f >nul 2>&1 & Call :1
del c:\*.old /a/s/q/f >nul 2>&1 & Call :2
del c:\*.tmp /a/s/q/f >nul 2>&1 & Call :3

::Delete Temporary Files
del /s /f /q %WinDir%\Temp\*.* >nul 2>&1
del /s /f /q %WinDir%\Prefetch\*.* >nul 2>&1
del /s /f /q %Temp%\*.* >nul 2>&1
del /s /f /q %AppData%\Temp\*.* >nul 2>&1
del /s /f /q %HomePath%\AppData\LocalLow\Temp\*.* >nul 2>&1
del /s /f /q %AppData%\Local\Microsoft\Windows\Caches\*.* >nul 2>&1
Call :4

::Delete Used Drivers Files
del /s /f /q %SYSTEMDRIVE%\AMD\*.* >nul 2>&1
del /s /f /q %SYSTEMDRIVE%\NVIDIA\*.* >nul 2>&1
del /s /f /q %SYSTEMDRIVE%\INTEL\*.* >nul 2>&1
Call :5

::Delete Temporary Folders
rd /s /q %WinDir%\Temp >nul 2>&1
rd /s /q %WinDir%\Prefetch >nul 2>&1
rd /s /q %Temp% >nul 2>&1
rd /s /q %AppData%\Temp >nul 2>&1
rd /s /q %HomePath%\AppData\LocalLow\Temp >nul 2>&1
rd /s /q %AppData%\Local\Microsoft\Windows\Caches\ >nul 2>&1
Call :6

::Delete Used Drivers Folders
rd /s /q %SYSTEMDRIVE%\AMD >nul 2>&1
rd /s /q %SYSTEMDRIVE%\NVIDIA >nul 2>&1
rd /s /q %SYSTEMDRIVE%\INTEL >nul 2>&1
Call :7

::Recreate Empty Temporary Folders
md %WinDir%\Temp >nul 2>&1
md %WinDir%\Prefetch >nul 2>&1
md %Temp% >nul 2>&1
md %AppData%\Temp >nul 2>&1
md %AppData%\LocalLow\Temp >nul 2>&1
Call :8

::Flashing DNS Cache
ipconfig/flushDNS >nul 2>&1
Call :9

::Using Windows Cleaner Tool
cleanmgr /sagerun
Call :10

cls

mode 60,5

::Repairing System Files
sfc /scannow

color 09

cls

mode 30,4

echo Windows Clean Up Done!
echo.
echo Press any key to exit..
echo.

pause > NUL
exit

::Progress Bar
:0
cls
echo Cleaning...
echo [------------------------------]
ping localhost -n 1 >nul
goto :EOF

:1
cls
echo Cleaning...
echo [###---------------------------]
ping localhost -n 1 >nul
goto :EOF

:2
cls
echo Cleaning...
echo [######------------------------]
ping localhost -n 1 >nul
goto :EOF

:3
cls
echo Cleaning...
echo [#########---------------------]
ping localhost -n 1 >nul
goto :EOF

:4
cls
echo Cleaning...
echo [############------------------]
ping localhost -n 1 >nul
goto :EOF

:5
cls
echo Cleaning...
echo [###############---------------]
ping localhost -n 1 >nul
goto :EOF

:6
cls
echo Cleaning...
echo [##################------------]
ping localhost -n 1 >nul
goto :EOF

:7
cls
echo Cleaning...
echo [#####################---------]
ping localhost -n 1 >nul
goto :EOF

:8
cls
echo Cleaning...
echo [########################------]
ping localhost -n 1 >nul
goto :EOF

:9
cls
echo Cleaning...
echo [###########################---]
ping localhost -n 1 >nul
goto :EOF

:10
cls
echo Cleaning...
echo [##############################]
ping localhost -n 1 >nul
goto :EOF