@echo off
title Uzi's Map Editor
set "DEST=%LOCALAPPDATA%\UzisMapEditor"
set "HERE=%~dp0"
if not exist "%DEST%\java\bin\javaw.exe" (
  echo Installing Java, one moment...
  powershell -NoProfile -ExecutionPolicy Bypass -Command "$d='%DEST%'; New-Item -ItemType Directory -Force $d | Out-Null; Remove-Item -Recurse -Force \"$d\java\",\"$d\_jre\" -ErrorAction SilentlyContinue; Expand-Archive -Force '%HERE%jre.zip' \"$d\_jre\"; $top=Get-ChildItem \"$d\_jre\" | Select-Object -First 1; Move-Item $top.FullName \"$d\java\"; Remove-Item -Recurse -Force \"$d\_jre\""
)
if not exist "%DEST%\app" mkdir "%DEST%\app"
copy /Y "%HERE%editor.jar" "%DEST%\editor.jar" >nul
cd /d "%DEST%"
start "" "%DEST%\java\bin\javaw.exe" -Dume.appdir="%DEST%\app" -Dume.noupdate=true -jar "%DEST%\editor.jar"
