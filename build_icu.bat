REM *** ICU ***

set argC=0
for %%x in (%*) do Set /A argC+=1

if %argC% equ 1 (set TOOLSET="v142") else (set TOOLSET=%2)

devenv icu\icu4c\source\allinone\allinone.sln /Upgrade
msbuild icu\icu4c\source\allinone\allinone.sln /p:Configuration=Release /p:Platform="Win32" /p:PlatformToolset=%TOOLSET% /p:TargetPlatformVersion=10.0.17763.0 /p:PreferredToolArchitecture=Win32

copy icu\icu4c\bin\*.dll %1\
copy icu\icu4c\lib\*.lib %1\
copy icu\icu4c\lib\*.pdb %1\