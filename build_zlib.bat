REM *** ZLIB ***

if (%2 == "") (set VS="16 2019") else (set VS=%2)

del /s /f /q zlib\build
mkdir zlib\build
cmake -B zlib\build -G "Visual Studio %VS%" -A Win32 zlib
devenv zlib\build\zlib.sln /Build Release
copy zlib\build\Release\zlib.* %1\