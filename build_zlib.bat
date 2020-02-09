REM *** ZLIB ***

del /s /f /q zlib\build
mkdir zlib\build

if (%2=="") (
    cmake -B zlib\build -G "Visual Studio 16 2019" -A Win32 zlib
) else (
    cmake -B zlib\build -G "Visual Studio %2" -A Win32 zlib
)

devenv zlib\build\zlib.sln /Build Release
copy zlib\build\Release\zlib.* %1\