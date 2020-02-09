REM *** SWORD ***

set argC=0
for %%x in (%*) do Set /A argC+=1

if %argC% equ 1 (set VS="16 2019") else (set VS=%2)

del /s /f /q sword\build
mkdir sword\build

cmake -B sword\build -G "Visual Studio %VS%" -A Win32 ^
      -DBZIP2_LIBRARY=%cd%\output\libbz2.lib ^
      -DBZIP2_INCLUDE_DIR=%cd%\bzip2 ^
      -DXZ_LIBRARY=%cd%\output\liblzma.lib ^
      -DXZ_INCLUDE_DIR=%cd%\xz\src\liblzma\api ^
      -DICU_LIBRARY=%cd%\output\icudt.lib;%cd%\output\icuin.lib;%cd%\output\icuio.lib;%cd%\output\icuuc.lib ^
      -DICU_INCLUDE_DIR=%cd%\icu\icu4c\include ^
      -DCURL_LIBRARY=%cd%\output\libcurl_imp.lib ^
      -DCURL_INCLUDE_DIR=%cd%\curl\include ^
      sword

devenv sword\build\libsword.sln /Build Release /Project sword
copy sword\build\Release\* %1\
