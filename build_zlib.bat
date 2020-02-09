REM *** ZLIB ***

del /s /f /q zlib\build
mkdir zlib\build

set argC=0
for %%x in (%*) do Set /A argC+=1

if %argC% equ 1 (
    cmake -B zlib\build -G "Visual Studio 16 2019" -A Win32 zlib
) else (
    cmake -B zlib\build -G "Visual Studio %2" -A Win32 zlib
)

devenv zlib\build\zlib.sln /Build Release
copy zlib\build\Release\zlib.* %1\