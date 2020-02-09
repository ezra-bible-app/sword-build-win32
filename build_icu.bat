REM *** ICU ***

if (%2 == "") (set TOOLSET="v142") else (set TOOLSET=%2)

msbuild icu\source\allinone\allinone.sln /p:Configuration=Release /p:PlatformToolset=%TOOLSET% /p:TargetPlatformVersion=10.0.17763.0 /p:PreferredToolArchitecture=Win32