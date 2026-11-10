@echo off
setlocal
set GRADLE_VERSION=8.13
set GRADLE_HOME=%USERPROFILE%\.gradle\wordmaster-wrapper\gradle-%GRADLE_VERSION%
set GRADLE_ZIP=%USERPROFILE%\.gradle\wordmaster-wrapper\gradle-%GRADLE_VERSION%-bin.zip
if exist "%GRADLE_HOME%\bin\gradle.bat" goto run_gradle
if not exist "%USERPROFILE%\.gradle\wordmaster-wrapper" mkdir "%USERPROFILE%\.gradle\wordmaster-wrapper"
echo Gradle %GRADLE_VERSION% yuklab olinmoqda...
powershell -NoProfile -ExecutionPolicy Bypass -Command "$ErrorActionPreference='Stop'; Invoke-WebRequest -Uri 'https://services.gradle.org/distributions/gradle-%GRADLE_VERSION%-bin.zip' -OutFile '%GRADLE_ZIP%'; Expand-Archive -LiteralPath '%GRADLE_ZIP%' -DestinationPath '%USERPROFILE%\.gradle\wordmaster-wrapper' -Force"
if errorlevel 1 exit /b 1
:run_gradle
call "%GRADLE_HOME%\bin\gradle.bat" %*
exit /b %ERRORLEVEL%
