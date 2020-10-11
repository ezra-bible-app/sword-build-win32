# sword-build-win32

This repository contains batch scripts and GitHub CI scripts that build the [SWORD library](https://www.crosswire.org/sword/) and all its dependencies for the WIN32 platform (using the Visual Studio 2019 C++ compiler). The SWORD library gives access to bible text modules and related ressources. The released files are used to build the Windows version of [node-sword-interface](https://github.com/tobias-klein/node-sword-interface).

When cloning this repository you must use the option `--recurse-submodules` so that all submodule repos are available immediately. You also need to have [git-lfs](https://git-lfs.github.com/) installed, because some of the modules are using lfs properties.

The following libraries are automatically built with every push on this repo:
- zlib
- XZ Utils
- bzip2
- curl
- icu
- SWORD

Furthermore, when a release is created, binaries are automatically uploaded as release artifacts.

## Linking against sword.dll

### Definition SWUSINGDLL

When linking against sword.dll you need to have the define `SWUSINGDLL` set in your application's build environment. This ensures that symbols are being imported correctly (see [defs.h](https://github.com/bibletime/crosswire-sword-mirror/blob/trunk/include/defs.h#L68) in SWORD headers).

### List of libraries to link against (SWORD and Dependencies)

This is a sample list of libraries to link against (example from [node-sword-interface](https://github.com/tobias-klein/node-sword-interface), note that the syntax is *node-gyp* specific):

    '-l<(module_root_dir)/build/sword-build-win32/lib/sword.lib',
    '-l<(module_root_dir)/build/sword-build-win32/lib/icuuc.lib',
    '-l<(module_root_dir)/build/sword-build-win32/lib/icuin.lib',
    '-l<(module_root_dir)/build/sword-build-win32/lib/icudt.lib',
    '-l<(module_root_dir)/build/sword-build-win32/lib/libbz2.lib',
    '-l<(module_root_dir)/build/sword-build-win32/lib/liblzma.lib',
    '-l<(module_root_dir)/build/sword-build-win32/lib/libcurl_imp.lib',
    '-lWldap32.lib',
    '-lWs2_32.lib',
    '-lcrypt32.lib',
    '-lNormaliz.lib'

### Include path

Besides providing the list of linked libraries you also need to make sure that the include path is configured correctly, see this example from [node-sword-interface](https://github.com/tobias-klein/node-sword-interface), note that the syntax is *node-gyp* specific:

    "<(module_root_dir)/build/sword-build-win32/include"
