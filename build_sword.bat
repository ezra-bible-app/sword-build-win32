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
      -DCMAKE_WINDOWS_EXPORT_ALL_SYMBOLS=TRUE ^
      -DBZIP2_LIBRARY=%cd%\%2\libbz2.lib ^
      -DBZIP2_INCLUDE_DIR=%cd%\bzip2 ^
      -DXZ_LIBRARY=%cd%\%2\liblzma.lib ^
      -DXZ_INCLUDE_DIR=%cd%\xz\src\liblzma\api ^
      -DICU_ROOT=%cd%\icu\icu4c ^
      -DICU_INCLUDE_DIR=%cd%\icu\icu4c\include ^
      -DCURL_LIBRARY=%cd%\%2\libcurl_imp.lib ^
      -DCURL_INCLUDE_DIR=%cd%\curl\include ^
      sword

devenv build\sword\libsword.sln /Build Release /Project sword /ProjectConfig Debug
dir build\sword\Release\
copy build\sword\Release\* %2\
