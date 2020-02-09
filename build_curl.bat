REM *** CURL ***

if (%2 == "") (set VS="16 2019") else (set VS=%2)

del /s /f /q curl\build
mkdir curl\build
cmake -B curl\build -G "Visual Studio %VS%" -A Win32 curl
devenv curl\build\curl.sln /Build Release
copy curl\build\lib\Release\* %1\