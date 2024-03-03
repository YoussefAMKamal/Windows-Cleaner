@echo off & mode 33,3

title My Deep Cleaner

::Writing All Drivers Sentex
set DriveList=f:\ d:\ e:\

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
del c:\*.log /a/s/q/f >nul  2>&1 & Call :1
del c:\*.old /a/s/q/f >nul  2>&1 & Call :2
del c:\*.tmp /a/s/q/f >nul  2>&1 & Call :3

::Delete Temporary Files
del /s /f /q %WinDir%\Temp\*.* >nul 2>&1
del /s /f /q %WinDir%\Prefetch\*.* >nul 2>&1
del /s /f /q %Temp%\*.* >nul 2>&1
del /s /f /q %AppData%\Temp\*.* >nul 2>&1
del /s /f /q %AppData%\LocalLow\Temp\*.* >nul 2>&1
del /s /f /q %AppData%\Local\Microsoft\Windows\Caches\*.* >nul 2>&1
del /s /f /q e:\Temp\*.* >nul 2>&1
del /s /f /q d:\Games\Highlights\Temp\*.* >nul 2>&1
Call :4

::Delete Temporary Folders
rd /s /q %WinDir%\Temp >nul 2>&1
rd /s /q %WinDir%\Prefetch >nul 2>&1
rd /s /q %Temp% >nul 2>&1
rd /s /q %AppData%\Temp >nul 2>&1
rd /s /q %AppData%\LocalLow\Temp >nul 2>&1
rd /s /q %AppData%\Local\Microsoft\Windows\Caches\ >nul 2>&1
Call :5

rd /s /q e:\Temp >nul 2>&1
rd /s /q d:\Games\Highlights\Temp >nul 2>&1
Call :6

::Deleting any other Temporary And Cache Folders
for %%l in (%DriveList%) do (

	cd /d %%l

	for /d /r %%a in (*) do (		
		if /i %%~nxa == temp rd /s /q %%a >nul 2>&1
   		if /i %%~nxa == cache rd /s /q %%a >nul 2>&1
	)
)
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
DISM.exe /Online /Cleanup-image /Restorehealth
sfc /scannow

REM rd : remove directory
REM /p: Prompts for confirmation before deleting each file.
REM /f: force deleting of read-only files
REM /s: Delete specified files from all subdirectories.
REM /q: Quiet mode, do not ask if ok to delete on global wildcard
REM /a: Selects files to delete based on attributes.
REM attributes:R Read-only files, S System files, H Hidden files, A Files ready for archiving - Prefix meaning not
REM %systemdrive%: drive upon which the system folder was placed
REM %windir%: a regular variable and is defined in the variable store as %SystemRoot%. 
REM %userprofile%: variable to find the directory structure owned by the user running the process
REM @ECHO OFF — Disables the display prompt and shows content in a clean line.
REM ECHO — Prints the text after the space on the screen.
REM PAUSE — Keeps the window open after running the commands. If you don't

color 09

cls

mode 30,4

echo  Windows Clean Up Done!
echo.
echo  Press any key to exit..
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
echo [############-------------------]
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