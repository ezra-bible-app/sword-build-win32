REM *** bzip2 ***

git --git-dir=bzip2/.git checkout %1

mkdir build
del /s /f /q build\bzip2
mkdir build\bzip2

cl /nologo /O2 /MD /D_CRT_SECURE_NO_WARNINGS /DWIN32 /c /Fobuild\bzip2\ ^
   bzip2\blocksort.c bzip2\huffman.c bzip2\crctable.c bzip2\randtable.c ^
   bzip2\compress.c bzip2\decompress.c bzip2\bzlib.c
link /nologo /DLL /MACHINE:X86 /DEF:bzip2\libbz2.def /OUT:build\bzip2\libbz2.dll /IMPLIB:build\bzip2\libbz2.lib build\bzip2\*.obj

dir build\bzip2
copy build\bzip2\libbz2.dll %2\
copy build\bzip2\libbz2.lib %2\
