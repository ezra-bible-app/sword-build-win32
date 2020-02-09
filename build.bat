REM *** ZLIB ***

mkdir zlib\build
cmake -B zlib\build -G "NMake Makefiles" zlib
(cd zlib\build && nmake)