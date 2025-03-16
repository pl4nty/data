@echo off
set errcode=0

if [%1]==[] (
    set TargetImage=/online
    set OSDriveLetter=%SystemDrive%
) else (
    set TargetImage=/image:%1
    set OSDriveLetter=%~d1
)

rem
rem Loggings of the UWP installation are captured in these logs for debugging purpose
rem
set Log_Folder=%OSDriveLetter%\ProgramData\HP\logs\UWP
if not exist "%Log_Folder%" md "%Log_Folder%"

set ALLAPPS_Log=%Log_Folder%\_InstallAllApps.log

echo. >> "%ALLAPPS_Log%"
echo ^>^> %~f0 >> "%ALLAPPS_Log%"
echo ^>^> %date% %time% >> "%ALLAPPS_Log%"
echo. >> "%ALLAPPS_Log%"

rem
rem Retrieve list of installed provisioned appx packages before UWP Pack installation
rem
echo *dism %TargetImage% /get-provisionedappxpackages >> "%ALLAPPS_Log%"
dism %TargetImage% /get-provisionedappxpackages >> "%ALLAPPS_Log%" 2>&1
echo. >> "%ALLAPPS_Log%"

rem
rem Search for and install individual UWP app in the pack
rem
echo *dir /s /b "%~dp0installapp.cmd" >> "%ALLAPPS_Log%"
dir /s /b "%~dp0installapp.cmd" >> "%ALLAPPS_Log%" 2>&1

setlocal ENABLEDELAYEDEXPANSION

for /f "tokens=*" %%i in ('dir /s /b "%~dp0installapp.cmd"') do (
    echo Running "%%i"... >> "%ALLAPPS_Log%"
    call "%%i" %1
    if errorlevel 1 (
        echo ***ERROR*** Failed to run "%%i", error=!errorlevel!. >> "%ALLAPPS_Log%"
        if !errcode! equ 0 set errcode=!errorlevel!
    )
)
echo If file not found appears that means this SoftPaq is utilizing appxinst.cmd.  >> "%ALLAPPS_Log%"
echo If file not found appears that means this SoftPaq is utilizing appxinst.cmd.

endlocal & set errcode=%errcode%

echo errcode=%errcode% >> "%ALLAPPS_Log%"

echo *dir /s /b "%~dp0appxinst.cmd" >> "%ALLAPPS_Log%"
dir /s /b "%~dp0appxinst.cmd" >> "%ALLAPPS_Log%" 2>&1

setlocal ENABLEDELAYEDEXPANSION

for /f "tokens=*" %%i in ('dir /s /b "%~dp0appxinst.cmd"') do (
    echo Running "%%i"... >> "%ALLAPPS_Log%"
    call "%%i" %1
    if errorlevel 1 (
        echo ***ERROR*** Failed to run "%%i", error=!errorlevel!. >> "%ALLAPPS_Log%"
        if !errcode! equ 0 set errcode=!errorlevel!
    )
)
echo If file not found appears that means this SoftPaq is utilizing installapp.cmd. >> "%ALLAPPS_Log%"
echo If file not found appears that means this SoftPaq is utilizing installapp.cmd.

endlocal & set errcode=%errcode%

echo errcode=%errcode% >> "%ALLAPPS_Log%"


:end_InstallAllApps

rem
rem Retrieve list of installed provisioned appx packages after UWP Pack installation
rem
echo. >> "%ALLAPPS_Log%"
echo *dism %TargetImage% /get-provisionedappxpackages >> "%ALLAPPS_Log%"
dism %TargetImage% /get-provisionedappxpackages >> "%ALLAPPS_Log%" 2>&1

echo. >> "%ALLAPPS_Log%"
echo *exit /b %errcode% >> "%ALLAPPS_Log%"
echo. >> "%ALLAPPS_Log%"
echo ^<^< %~f0 >> "%ALLAPPS_Log%"
echo ^<^< %date% %time% >> "%ALLAPPS_Log%"
echo. >> "%ALLAPPS_Log%"

exit /b %errcode%

