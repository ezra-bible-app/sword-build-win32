REM *** ZLIB ***

del /s /f /q zlib\build
mkdir zlib\build
cmake -B zlib\build -G "Visual Studio 15 2017" -A Win32 zlib
devenv zlib\build\zlib.sln /Build Release