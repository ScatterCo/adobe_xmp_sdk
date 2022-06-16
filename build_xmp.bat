:: =================================================================================================
:: Copyright 2013 Adobe Systems Incorporated
:: All Rights Reserved.
::
:: NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the terms
:: of the Adobe license agreement accompanying it.
:: =================================================================================================

echo OFF
cls

cd XMP-Toolkit-SDK-CC201607\build

set GENERATE_ALL=Off
set NEXT_LABEL=ok

echo "Generating XMPSDKToolkit Static x64"
set VS_VERSION=2022
set CMAKE_GENERATOR="Visual Studio 17 2022"
set CMAKE_GENERATOR_TOOLSET="v141"
set BUILD_TYPE=Static
set BITS=64
GOTO GenerateNow

:GenerateNow
call cmake_all.bat %BITS% %VS_VERSION% WarningAsError %BUILD_TYPE%
if errorlevel 1 goto error
goto %NEXT_LABEL%

:error
echo CMake Build Failed.
exit /B 1

:ok
echo CMake Build Success.
exit /B 0
