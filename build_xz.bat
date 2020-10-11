REM *** XZ ***

git --git-dir=xz/.git checkout %1

set argC=0
for %%x in (%*) do Set /A argC+=1

if %argC% equ 3 (set TOOLSET=%3) else (set TOOLSET="v142")

msbuild xz\windows\vs2017\xz_win.sln ^
        /p:Configuration=Release ^
        /p:Platform="Win32" ^
        /p:PlatformToolset=%TOOLSET% ^
        /p:TargetPlatformVersion=10.0.17763.0 ^
        /p:PreferredToolArchitecture=Win32 ^
        /p:DebugSymbols=true ^
        /p:DebugType=full

dir xz\windows\vs2017\Release\Win32\liblzma_dll\
copy xz\windows\vs2017\Release\Win32\liblzma_dll\liblzma.dll %2\
copy xz\windows\vs2017\Release\Win32\liblzma_dll\liblzma.lib %2\