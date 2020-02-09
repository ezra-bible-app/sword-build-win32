REM *** CURL ***

del /s /f /q curl\build
mkdir curl\build
cmake -B curl\build -G "Visual Studio 16 2019" -A Win32 curl
devenv curl\build\curl.sln /Build Release