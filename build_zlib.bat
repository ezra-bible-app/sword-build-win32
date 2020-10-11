REM *** ZLIB ***

git --git-dir=zlib/.git checkout %1

mkdir build
del /s /f /q build\zlib
mkdir build\zlib

set argC=0
for %%x in (%*) do Set /A argC+=1

if %argC% equ 3 (
    set VS=%3
    cmake -B build\zlib -G "Visual Studio %VS%" -A Win32 zlib
) else (
    cmake -B build\zlib -G "Visual Studio 16 2019" -A Win32 zlib
)

devenv build\zlib\zlib.sln /Build Release /Project zlib /DEBUG:FULL
dir build\zlib\Release\
copy build\zlib\Release\zlib.dll %2\
copy build\zlib\Release\zlib.lib %2\