## CMake-based MinGW-w64 Cross Toolchain

- With mpv-winbuild-cmake-minimal you can build Windows binaries of mpv on debian bookworm linux.

## What is this about?

- The project has its origin: https://github.com/shinchiro/mpv-winbuild-cmake
- I wanted to understand it better and removed all the things I didn't need.
- I like to keep it simple and don't provide binarys it's all about building it yourself.


## Here are the things that are included (alphabetical order):

- Audio:
    - flac
    - lame
    - opus

- Image:
    - libjpeg
    - libjxl
    - png
    - webp

- Subtitles/Interface:
    - freetype2
    - libass

- Plugins:
    - javascript
    - lua

- Video:
    - dav1d
    - rav1e
    - vpx
    - x264


## I also like to point out things that may be important to you that are not included:

- No network protocols
    - curl
    - libssh

- No dvd and bluray physical/image disks
    - libudfread
    - libbluray
    - libdvdread
    - libdvdnav
    - libdvdcss

- No archives
    - libarchive

- No synth scripts
    - vapoursynth
    - davs2


## Full packages list :

- Git/Hg
    - FFmpeg
    - xz
    - x264
    - uchardet
    - rubberband
    - opus
    - mpv
    - luajit
    - libvpx
    - libwebp
    - libpng
    - libunibreak
    - libass
    - lcms2
    - lame
    - harfbuzz
    - freetype2
    - flac
    - opus-tools
    - mujs
    - libjpeg
    - shaderc (with spirv-headers, spirv-tools, glslang)
    - vulkan-header
    - vulkan
    - spirv-cross
    - fribidi
    - libxml2
    - amf-headers
    - dav1d
    - libplacebo (with glad)
    - fontconfig
    - libjxl (with brotli, highway)
    - libva
    - rav1e

- Zip
    - expat (2.5.0)
    - bzip (1.0.8)
    - zlib (1.2.13)
    - vorbis (1.3.7)
    - ogg (1.3.5)
    - lzo (2.10)
    - libiconv (1.17)
    - gmp (6.2.1)
    - libsdl2 (2.28.0)


## Setup Build Environment

Debian Bookworm

    apt-get install build-essential checkinstall bison flex gettext git mercurial subversion ninja-build gyp cmake yasm nasm automake pkgconf libtool libtool-bin gcc-multilib g++-multilib clang libgmp-dev libmpfr-dev libmpc-dev libgcrypt-dev gperf ragel texinfo autopoint re2c asciidoc python3-pip docbook2x unzip p7zip-full meson python3-jinja2 rst2pdf

Make sure you have git configured at least (otherwise patch will not work):

    git config --global user.name ""
    git config --global user.email ""


## time consumption

- 4 cores (network download including, you will be little faster)

    - ninja gcc
        - real    24m39.861s
        - user    54m4.054s
        - sys     3m52.794s

    - ninja mpv
        - TODO


## Building Software

To set up the build environment, create a directory to store build files in:

    mkdir build64
    cd build64

Once you’ve changed into that directory, run CMake, e.g.

    cmake -DTARGET_ARCH=x86_64-w64-mingw32 -G Ninja ..

add `-DGCC_ARCH=x86-64-v3` to command-line if you want to compile gcc with new `x86-64-v3` instructions. Other value like `native`, `znver3` should work too in theory.

First, you need to build toolchain. By default, it will be installed in `install` folder. This take ~20 minutes on my 4-core machine.

    ninja gcc

After it done, you're ready to build mpv and all its dependencies:

    ninja mpv

This will take a while (about ~10 minutes on my machine).

## Building Software (Second Time)

To build mpv for a second time:

    ninja update

After that, build mpv as usual:

    ninja mpv

This will also build all packages that `mpv` depends on.

## Available Commands

| Commands                   | Description |
| -------------------------- | ----------- |
| ninja package              | compile a package |
| ninja clean                | remove all stamp files in all packages. |
| ninja download             | Download all packages' sources at once without compiling. |
| ninja update               | Update all git repos. When a package pulls new changes, all of its stamp files will be deleted and will be forced rebuild. If there is no change, it will not remove the stamp files and no rebuild occur. Use this instead of `ninja clean` if you don't want to rebuild everything in the next run. |
| ninja package-fullclean    | Remove all stamp files of a package. |
| ninja package-liteclean    | Remove build, clean stamp files only. This will skip re-configure in the next running `ninja package` (after the first compile). Updating repo or patching need to do manually. Ideally, all `DEPENDS` targets in `package.cmake` should be temporarily commented or deleted. Might be useful in some cases. |
| ninja package-removebuild  | Remove 'build' directory of a package. |
| ninja package-removeprefix | Remove 'prefix' directory. |
| ninja package-force-update | Update a package. Only git repo will be updated. |

`package` is package's name found in `packages` folder.

## Acknowledgements

This project was originally created and maintained [lachs0r](https://github.com/lachs0r/mingw-w64-cmake) and [shinchiro] https://github.com/shinchiro/mpv-winbuild-cmake. 

Since then, it heavily modified to suit my own need.
