REM *** XZ ***

set argC=0
for %%x in (%*) do Set /A argC+=1

if %argC% equ 1 (set TOOLSET="v142") else (set TOOLSET=%2)

msbuild xz\windows\vs2017\xz_win.sln /p:Configuration=Release /p:PlatformToolset=%TOOLSET% /p:TargetPlatformVersion=10.0.17763.0 /p:PreferredToolArchitecture=Win32
dir xz\windows
dir xz\windows\vs2017\Release
dir xz\windows\vs2017\Release\Win32
dir xz\windows\vs2017\Release\Win32\liblzma_dll
copy xz\windows\vs2017\Release\Win32\liblzma_dll\liblzma.* %1\