REM *** ZLIB ***

git --git-dir=zlib/.git checkout %1

del /s /f /q zlib\build
mkdir zlib\build

set argC=0
for %%x in (%*) do Set /A argC+=1

if %argC% equ 3 (
    set VS=%3
    set VS=%VS:"=%
    cmake -B curl\build -G "Visual Studio %VS%" -A Win32 curl
) else (
    cmake -B curl\build -G "Visual Studio 16 2019" -A Win32 curl
)

devenv zlib\build\zlib.sln /Build Release
copy zlib\build\Release\zlib.dll %2\
copy zlib\build\Release\zlib.lib %2\