REM *** bzip2 ***

if (%2 == "") (set TOOLSET="v142") else (set TOOLSET=%2)

devenv bzip2\libbz2.dsp /Upgrade
msbuild bzip2\libbz2.vcxproj /p:Configuration=Release /p:Platform="Win32" /p:PlatformToolset=%TOOLSET% /p:TargetPlatformVersion=10.0.17763.0 /p:PreferredToolArchitecture=Win32
copy bzip2\Release\libbz2.* %1\