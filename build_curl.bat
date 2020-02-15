REM *** CURL ***

git --git-dir=curl/.git checkout %1

del /s /f /q curl\build
mkdir curl\build

set argC=0
for %%x in (%*) do Set /A argC+=1

if %argC% equ 3 (
    set VS=%3
    set VS=%VS:"=%
    cmake -B curl\build -G "Visual Studio %VS%" -A Win32 curl
) else (
    cmake -B curl\build -G "Visual Studio 16 2019" -A Win32 curl
)

devenv curl\build\curl.sln /Build Release /Project libcurl
copy curl\build\lib\Release\*.dll %2\
copy curl\build\lib\Release\*.lib %2\