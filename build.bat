@echo off
setlocal
echo =======================================
echo Building FileFive Desktop...
echo =======================================

where node >nul 2>nul
if %errorlevel% neq 0 (
    echo [ERROR] Node.js is not installed. Please install it first.
    pause
    exit /b 1
)
where python >nul 2>nul
if %errorlevel% neq 0 (
    echo [ERROR] Python is not installed. Please install it first.
    pause
    exit /b 1
)

echo [1/4] Installing npm dependencies (Locked versions)...
call npm install

echo [2/4] Downloading Node.js portable runtime...
powershell -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri 'https://nodejs.org/dist/v22.14.0/node-v22.14.0-win-x64.zip' -OutFile 'node.zip'"

if not exist node.zip (
    echo [ERROR] Failed to download Node.js.
    pause
    exit /b 1
)

if exist node-temp rmdir /s /q node-temp

powershell -Command "Expand-Archive -Path 'node.zip' -DestinationPath 'node-temp' -Force"
copy "node-temp\node-v22.14.0-win-x64\node.exe" "node.exe"
del /q node.zip
rmdir /s /q node-temp

pip install -r requirements.txt

echo [4/4] Packaging into single executable...
if exist build rmdir /s /q build
if exist dist rmdir /s /q dist

pyinstaller -w -F --add-data "node_modules;node_modules" --add-binary "node.exe;." --icon=icon.ico launch.py

echo =======================================
echo Build complete! Check the dist folder.
echo =======================================
pause
endlocal
