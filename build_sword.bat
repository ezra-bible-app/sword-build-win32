REM *** SWORD ***


set argC=0
for %%x in (%*) do Set /A argC+=1

if %argC% equ 1 (set VS="16 2019") else (set VS=%2)

del /s /f /q sword\build
mkdir sword\build

cmake -B sword\build -G "Visual Studio %VS%" -A Win32 ^
      -DBZIP2_LIBRARY=output\libbz2.dll ^
      -DBZIP2_INCLUDE_DIR=bzip2 ^
      -DXZ_LIBRARY=output\liblzma.dll ^
      -DXZ_INCLUDE_DIR=xz\include ^
      -DICU_LIBRARY=icu\icu4c\bin\ ^
      -DICU_INCLUDE_DIR=icu\icu4c\include ^
      -DCURL_LIBRARY=output\libcurl.dll ^
      -DCURL_INCLUDE_DIR=curl\include ^
      sword

msbuild sword\build\libsword.sln /p:Configuration=Release /p:Platform="Win32"