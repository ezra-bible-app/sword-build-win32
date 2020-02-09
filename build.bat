REM *** ZLIB ***

mkdir zlib\build
cmake -B zlib\build zlib
devenv zlib\build\zlib.sln /Build Release
