@ECHO OFF

setlocal

REM ********************************************
REM  Usage: VSProjects.bat <VS9 | VS10> 
REM ********************************************

SET COMPILER_MODE=%1

:: --------------------------------------------------
:: set paths
:: --------------------------------------------------
SET STARTING_DIR=%CD%
SET BATCH_FILE_PATH=%~dp0
SET ROOT_DIRECTORY=%~dp0
CD %BATCH_FILE_PATH%

:: --------------------------------------------------
:: set paths
:: --------------------------------------------------
echo *************************************************
echo Generating Visual Studio Projects
echo *************************************************

if %COMPILER_MODE% == VS9 (
	echo Visual Studio Ver 9 ^(2008^)
	set CMAKE_GENERATOR=Visual Studio 9 2008
	set ROOT_BUILD_PATH=%ROOT_DIRECTORY%\output_vs2008
) else if %COMPILER_MODE% == VS10 (
	echo   Compiler: Visual Studio Version 10 ^(2010^)
	set CMAKE_GENERATOR=Visual Studio 10
	set ROOT_BUILD_PATH=%ROOT_DIRECTORY%\output_vs2010
) else (
	echo Failed to specify type of projects to generate
 	goto errors
)

:: --------------------------------------------------
:: set Toolchain
:: --------------------------------------------------
set TOOLCHAIN=-DINCLUDE_PATH=%BATCH_FILE_PATH%toolchain.WIN32.cmake

:: --------------------------------------------------
:: create projects
:: --------------------------------------------------
if not exist %ROOT_BUILD_PATH% (
	mkdir %ROOT_BUILD_PATH%
)

if exist %ROOT_BUILD_PATH% (
 	cd %ROOT_BUILD_PATH%
	echo Executing...
	echo cmake -G"%CMAKE_GENERATOR%" %TOOLCHAIN% %BATCH_FILE_PATH%
 	cmake -G"%CMAKE_GENERATOR%" %TOOLCHAIN% %BATCH_FILE_PATH%
	rem echo cmake -G"%CMAKE_GENERATOR%" %BATCH_FILE_PATH%
 	rem cmake -G"%CMAKE_GENERATOR%" %BATCH_FILE_PATH%
	if ERRORLEVEL 1 goto errors
) else (
	echo Failed to create or access the root build path
 	goto errors
)

echo Successfully finished generating projects
goto finish

:: --------------------------------------------------
:: handles errors
:: --------------------------------------------------
:errors
@ECHO A cmake error has occurred!!!
cd %STARTING_DIR%
exit /B 1

:: --------------------------------------------------
:: handles successful run
:: --------------------------------------------------
:finish
cd %STARTING_DIR%
exit /B 0