# sword-build-win32

This repository contains batch scripts and GitHub CI scripts that build the [SWORD library](https://www.crosswire.org/sword/) and all its dependencies for the WIN32 platform. The SWORD library gives access to bible text modules and related ressources. The files in this repository are used to build the Windows version of [node-sword-interface](https://github.com/tobias-klein/node-sword-interface).

When cloning this repository you must use the option `--recurse-submodules` so that all submodule repos are available immediately. You also need to have [git-lfs](https://git-lfs.github.com/) installed, because some of the modules are using lfs properties.

The following libraries are automatically built with every push on this repo:
- zlib
- XZ Utils
- bzip2
- curl
- icu
- SWORD

Furthermore, when a release is created, binaries are automatically uploaded as release artifacts.
