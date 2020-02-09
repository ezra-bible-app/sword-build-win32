REM *** ICU ***

devenv icu\icu4c\source\allinone\allinone.sln /Upgrade
devenv icu\icu4c\source\allinone\allinone.sln /Build Release
copy icu\icu4c\bin\*.dll %1\
copy icu\icu4c\lib\*.lib %1\
copy icu\icu4c\lib\*.pdb %1\