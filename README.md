# sword-build-win32

This repository contains batch scripts and GitHub CI scripts that build Sword and all its dependencies for the WIN32 platform.

When cloning this repository, use the option `--recurse-submodules` so that all submodule repos are available immediately. You also need to have [git-lfs](https://git-lfs.github.com/) installed, because some of the modules are using lfs properties.

The following libraries are automatically built with every push on this repo:
- zlib
- XZ Utils
- bzip2
- curl
- icu
- Sword

Furthermore, when a release is created, binaries are automatically uploaded as release artifacts.
