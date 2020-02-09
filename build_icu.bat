REM *** ICU ***

devenv icu\icu4c\source\allinone\allinone.sln /Upgrade
devenv icu\icu4c\source\allinone\allinone.sln /Build Release /Project i18n
devenv icu\icu4c\source\allinone\allinone.sln /Build Release /Project io
devenv icu\icu4c\source\allinone\allinone.sln /Build Release /Project uconv
copy icu\icu4c\bin\*.dll %1\
copy icu\icu4c\lib\*.lib %1\
copy icu\icu4c\lib\*.pdb %1\