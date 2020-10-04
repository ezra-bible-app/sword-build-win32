REM *** SWORD ***

git --git-dir=sword/.git checkout %1

mkdir build
del /s /f /q build\sword
mkdir build\sword

set argC=0
for %%x in (%*) do Set /A argC+=1

if %argC% equ 3 (
    set VS=%3
) else (
    set VS="16 2019"
)

cmake -B build\sword -G "Visual Studio %VS%" -A Win32 ^
      -DICU_DEBUG=ON ^
      -DCMAKE_WINDOWS_EXPORT_ALL_SYMBOLS=TRUE ^
      -DBZIP2_LIBRARY=%cd%\%2\libbz2.lib ^
      -DBZIP2_INCLUDE_DIR=%cd%\bzip2 ^
      -DXZ_LIBRARY=%cd%\%2\liblzma.lib ^
      -DXZ_INCLUDE_DIR=%cd%\xz\src\liblzma\api ^
      -DICU_INCLUDE_DIR=%cd%\icu\icu4c\include ^
      -DICU_DATA_LIBRARY=%cd%\%2\icudt.lib ^
      -DICU_I18N_LIBRARY=%cd%\%2\icuin.lib ^
      -DICU_IO_LIBRARY=%cd%\%2\icuio.lib ^
      -DICU_UC_LIBRARY=%cd%\%2\icuuc.lib ^
      -DCURL_LIBRARY=%cd%\%2\libcurl_imp.lib ^
      -DCURL_INCLUDE_DIR=%cd%\curl\include ^
      sword

devenv build\sword\libsword.sln /Build Release /Project sword
copy build\sword\Release\* %2\
