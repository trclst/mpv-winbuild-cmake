ExternalProject_Add(libuv
    URL https://github.com/libuv/libuv/archive/v1.48.0.tar.gz
    URL_HASH SHA256=8c253adb0f800926a6cbd1c6576abae0bc8eb86a4f891049b72f9e5b7dc58f33
    DOWNLOAD_DIR ${SOURCE_LOCATION}
    CONFIGURE_COMMAND ${EXEC} <SOURCE_DIR>/autogen.sh && CONF=1 <SOURCE_DIR>/configure
        --host=${TARGET_ARCH}
        --prefix=${MINGW_INSTALL_PREFIX}
        --enable-static
        --disable-shared
    BUILD_COMMAND ${MAKE}
    INSTALL_COMMAND ${MAKE} install
    BUILD_IN_SOURCE 1
    LOG_DOWNLOAD 1 LOG_UPDATE 1 LOG_CONFIGURE 1 LOG_BUILD 1 LOG_INSTALL 1
)

cleanup(libuv install)
