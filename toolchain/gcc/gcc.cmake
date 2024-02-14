ExternalProject_Add(gcc
    DEPENDS
        mingw-w64-headers
    URL https://gcc.gnu.org/pub/gcc/snapshots/13-20231223/gcc-13-20231223.tar.xz
    # https://mirrorservice.org/sites/sourceware.org/pub/gcc/snapshots/12-20221217/sha512.sum
    URL_HASH SHA512=f3b066b27003a7c3a83f71d1670f9d662e397388e299ec2e33d674bb1d15b2443fd1608d10052b897f5159584aa3116603da33ace7c906d16e50371af5f8a745
    DOWNLOAD_DIR ${SOURCE_LOCATION}
    CONFIGURE_COMMAND <SOURCE_DIR>/configure
        --target=${TARGET_ARCH}
        --prefix=${CMAKE_INSTALL_PREFIX}
        --libdir=${CMAKE_INSTALL_PREFIX}/lib
        --with-sysroot=${CMAKE_INSTALL_PREFIX}
        --program-prefix=cross-
        --disable-multilib
        --enable-languages=c,c++
        --disable-nls
        --disable-shared
        --disable-win32-registry
        --with-arch=${GCC_ARCH}
        --with-tune=generic
        --enable-threads=posix
        --without-included-gettext
        --enable-lto
        --enable-checking=release
        --disable-sjlj-exceptions
    BUILD_COMMAND make -j${MAKEJOBS} all-gcc
    INSTALL_COMMAND make install-strip-gcc
    STEP_TARGETS download install
    LOG_DOWNLOAD 1 LOG_CONFIGURE 1 LOG_BUILD 1 LOG_INSTALL 1
)

ExternalProject_Add_Step(gcc final
    DEPENDS
        mingw-w64-crt
        winpthreads
        gendef
        rustup
    COMMAND ${MAKE}
    COMMAND ${MAKE} install-strip
    WORKING_DIRECTORY <BINARY_DIR>
    LOG 1
)

cleanup(gcc final)
