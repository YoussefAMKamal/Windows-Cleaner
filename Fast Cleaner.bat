::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFCJbWReROW2GIrAP4/z0/9alo1keXKI5cYPeyYitLOUS5ED2Zqp+jioXy5NcXkwOLi2ufQw7q28PpmqCec6fvG8=
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSDk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFCJbWReROW2GIrAP4/z0/9alo1keXKI5cYPeyYitLOUS5ED2ZqoL12lO2OgACRpWewDlaxcxyQ==
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off & mode 24,3

Title Fast Cleaner

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
del c:\*.old /a/s/q/f >nul 2>&1 & Call :1
del c:\*.tmp /a/s/q/f >nul 2>&1 & Call :2

::Delete Temporary Files
del /s /f /q %WinDir%\Temp\*.* >nul 2>&1
del /s /f /q %WinDir%\Prefetch\*.* >nul 2>&1
del /s /f /q %Temp%\*.* >nul 2>&1
del /s /f /q %AppData%\Temp\*.* >nul 2>&1
del /s /f /q %AppData%\LocalLow\Temp\*.* >nul 2>&1
del /s /f /q %AppData%\Local\Microsoft\Windows\Caches\*.* >nul 2>&1
Call :3 

::Delete Temporary Folders
rd /s /q %WinDir%\Temp >nul 2>&1
rd /s /q %WinDir%\Prefetch >nul 2>&1
rd /s /q %Temp% >nul 2>&1
rd /s /q %AppData%\Temp >nul 2>&1
rd /s /q %AppData%\LocalLow\Temp >nul 2>&1
rd /s /q %AppData%\Local\Microsoft\Windows\Caches\ >nul 2>&1
Call :4

::Recreate Empty Temporary Folders
md %WinDir%\Temp >nul 2>&1
md %WinDir%\Prefetch >nul 2>&1
md %Temp% >nul 2>&1
md %AppData%\Temp >nul 2>&1
md %AppData%\LocalLow\Temp >nul 2>&1
Call :5

::Flashing DNS Cache
ipconfig/flushDNS >nul 2>&1
Call :6

::Using Windows Cleaner Tool
cleanmgr /sagerun
Call :7

color 09

cls

mode 30,4

echo  Windows Clean Up is Done!
echo.
echo  Press any key to exit..

pause > NUL
exit

::Progress Bar
:0
cls
echo Cleaning...
echo [---------------------]
ping localhost -n 1 >nul
goto :EOF

:1
cls
echo Cleaning...
echo [###------------------]
ping localhost -n 1 >nul
goto :EOF

:2
cls
echo Cleaning...
echo [######---------------]
ping localhost -n 1 >nul
goto :EOF

:3
cls
echo Cleaning...
echo [#########------------]
ping localhost -n 1 >nul
goto :EOF

:4
cls
echo Cleaning...
echo [############---------]
ping localhost -n 1 >nul
goto :EOF

:5
cls
echo Cleaning...
echo [###############-----]
ping localhost -n 1 >nul
goto :EOF

:6
cls
echo Cleaning...
echo [##################---]
ping localhost -n 1 >nul
goto :EOF

:7
cls
echo Cleaning...
echo [#####################]
ping localhost -n 1 >nul
goto :EOF