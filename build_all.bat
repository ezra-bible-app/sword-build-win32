mkdir build
mkdir build\lib

call build_zlib.bat v1.2.9 build\lib
call build_xz.bat v5.2.4 build\lib
call build_bzip2.bat bzip2-1.0.8 build\lib
call build_curl.bat curl-7_68_0 build\lib
call build_icu.bat release-65-1 build\lib
call build_sword.bat e34fd3 build\lib