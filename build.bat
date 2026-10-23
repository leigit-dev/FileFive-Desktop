@echo off
echo =======================================
echo Building FileFive Desktop...
echo =======================================

echo [1/4] Installing npm dependencies...
call npm install filefive

echo [2/4] Downloading Node.js portable runtime...
powershell -Command "Invoke-WebRequest -Uri 'https://nodejs.org/dist/v22.14.0/node-v22.14.0-win-x64.zip' -OutFile 'node.zip'"
powershell -Command "Expand-Archive -Path 'node.zip' -DestinationPath 'node-temp' -Force"
copy "node-temp\node-v22.14.0-win-x64\node.exe" "node.exe"
del /q node.zip
rmdir /s /q node-temp

echo [3/4] Installing Python dependencies...
pip install -r requirements.txt

echo [4/4] Packaging into single executable...
pyinstaller -w -F --add-data "node_modules;node_modules" --add-binary "node.exe;." --icon=icon.ico launch.py

echo =======================================
echo Build complete! Check the dist folder.
echo =======================================
pause