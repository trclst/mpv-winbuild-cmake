ExternalProject_Add(libsodium
    URL https://github.com/jedisct1/libsodium/archive/1.0.19.tar.gz
    URL_HASH SHA256=1d281a8a5e299a38e5c16ff60f293bba0796dc0fda8e49bc582d4bc1935572ed
    DOWNLOAD_DIR ${SOURCE_LOCATION}
    CONFIGURE_COMMAND ${EXEC} <SOURCE_DIR>/autogen.sh && CONF=1 <SOURCE_DIR>/configure
        --host=${TARGET_ARCH}
        --prefix=${MINGW_INSTALL_PREFIX}
        --enable-static
        --disable-shared
    BUILD_COMMAND ${MAKE} CFLAGS='-D_FORTIFY_SOURCE=0'
    INSTALL_COMMAND ${MAKE} install
    BUILD_IN_SOURCE 1
    LOG_DOWNLOAD 1 LOG_UPDATE 1 LOG_CONFIGURE 1 LOG_BUILD 1 LOG_INSTALL 1
)

cleanup(libsodium install)
