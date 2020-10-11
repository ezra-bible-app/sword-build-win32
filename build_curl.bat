REM *** CURL ***

git --git-dir=curl/.git checkout %1

mkdir build
del /s /f /q build\curl
mkdir build\curl

set argC=0
for %%x in (%*) do Set /A argC+=1

if %argC% equ 3 (
    set VS=%3
    cmake -B build\curl -G "Visual Studio %VS%" -A Win32 curl
) else (
    cmake -B build\curl -G "Visual Studio 16 2019" -A Win32 curl
)

devenv build\curl\curl.sln /Build Release /Project libcurl
dir build\curl\lib\Release\
copy build\curl\lib\Release\*.dll %2\
copy build\curl\lib\Release\*.lib %2\