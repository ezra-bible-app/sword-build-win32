REM *** ICU ***

git --git-dir=icu/.git checkout %1

set argC=0
for %%x in (%*) do Set /A argC+=1

if %argC% equ 3 (set TOOLSET=%3) else (set TOOLSET="v142")

devenv icu\icu4c\source\allinone\allinone.sln /Upgrade
msbuild icu\icu4c\source\allinone\allinone.sln /p:Configuration=Release /p:Platform="Win32" /p:PlatformToolset=%TOOLSET% /p:TargetPlatformVersion=10.0.17763.0 /p:PreferredToolArchitecture=Win32 /t:common;i18n

copy icu\icu4c\bin\*.dll %2\
copy icu\icu4c\lib\*.lib %2\
copy icu\icu4c\lib\*.pdb %2\