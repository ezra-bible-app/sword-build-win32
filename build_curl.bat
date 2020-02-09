REM *** CURL ***

del /s /f /q curl\build
mkdir curl\build
cmake -B curl\build -G "Visual Studio 15 2017" -A Win32 curl
devenv curl\build\curl.sln /Build Release