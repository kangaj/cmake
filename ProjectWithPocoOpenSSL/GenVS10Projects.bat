@ECHO OFF

setlocal

set BATCH_DIR=%~dp0
set SOURCE_DIR=%BATCH_DIR%\src
set THIRDPARTY_DIR=%SOURCE_DIR%\3PC
set OUT_DIR=%BATCH_DIR%\output_vs2010
SET OUT_BIN_DEBUG_DIR=%OUT_DIR%\bin\Debug
SET OUT_BIN_RELEASE_DIR=%OUT_DIR%\bin\Release


call VSProjects.bat VS10

::------------------------------------
::copy runtimes
::------------------------------------

::---------------------------------------------------------------------------------------------
:DEBUG
IF NOT EXIST %OUT_BIN_DEBUG_DIR% MKDIR %OUT_BIN_DEBUG_DIR%

xcopy %THIRDPARTY_DIR%\openssl1.0.1j\lib\win32 %OUT_BIN_DEBUG_DIR% /E /Y /F
xcopy %THIRDPARTY_DIR%\poco1.6.0\lib\vs2010\PocoFoundationd.dll %OUT_BIN_DEBUG_DIR% /E /Y /F

::---------------------------------------------------------------------------------------------
:RELEASE
IF NOT EXIST %OUT_BIN_RELEASE_DIR% MKDIR %OUT_BIN_RELEASE_DIR%

xcopy %THIRDPARTY_DIR%\openssl1.0.1j\lib\win32 %OUT_BIN_RELEASE_DIR% /E /Y /F
xcopy %THIRDPARTY_DIR%\poco1.6.0\lib\vs2010\PocoFoundation.dll %OUT_BIN_RELEASE_DIR% /E /Y /F


::---------------------------------------------------------------------------------------------

endlocal
