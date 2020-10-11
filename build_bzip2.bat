REM *** bzip2 ***

git --git-dir=bzip2/.git checkout %1

set argC=0
for %%x in (%*) do Set /A argC+=1

if %argC% equ 3 (set TOOLSET=%3) else (set TOOLSET="v142")

devenv bzip2\libbz2.dsp /Upgrade
msbuild bzip2\libbz2.vcxproj /p:Configuration=Release /p:Platform="Win32" /p:PlatformToolset=%TOOLSET% /p:TargetPlatformVersion=10.0.17763.0 /p:PreferredToolArchitecture=Win32
dir bzip2\
dir bzip2\Release
copy bzip2\libbz2.dll %2\
copy bzip2\Release\libbz2.lib %2\