@echo off
REM Compila (si se pasa "build") y sirve la app Flutter en http://localhost:8080 , luego abre Chrome.
REM Requiere que la API este corriendo (my-vaccine-api\MyVaccineAppSln\run-local-sqlite.bat).
cd /d "%~dp0"
set PATH=%PATH%;%USERPROFILE%\flutter\bin;%LOCALAPPDATA%\Pub\Cache\bin
if /I "%1"=="build" call flutter build web --no-wasm-dry-run
start "" "C:\Program Files\Google\Chrome\Application\chrome.exe" http://localhost:8080
call dart pub global run dhttpd --path build\web --port 8080
