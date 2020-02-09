REM *** CURL ***

del /s /f /q curl\build
mkdir curl\build

set argC=0
for %%x in (%*) do Set /A argC+=1

if %argC% equ 1 (
    cmake -B curl\build -G "Visual Studio 16 2019" -A Win32 curl
) else (
    cmake -B curl\build -G "Visual Studio %2" -A Win32 curl
)

devenv curl\build\curl.sln /Build Release
copy curl\build\lib\Release\* %1\