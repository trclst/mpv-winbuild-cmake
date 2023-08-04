ExternalProject_Add(gmp
    URL https://ftp.gnu.org/gnu/gmp/gmp-6.3.0.tar.xz
    URL_HASH SHA256=fd4829912cddd12f84181c3451cc752be224643e87fac497b69edddadc49b4f2
    DOWNLOAD_DIR ${SOURCE_LOCATION}
    CONFIGURE_COMMAND ${EXEC} <SOURCE_DIR>/configure
        CC_FOR_BUILD=cc
        --host=${TARGET_ARCH}
        --prefix=${MINGW_INSTALL_PREFIX}
        --enable-static
        --disable-shared
    BUILD_COMMAND ${MAKE}
    INSTALL_COMMAND ${MAKE} install
    LOG_DOWNLOAD 1 LOG_UPDATE 1 LOG_CONFIGURE 1 LOG_BUILD 1 LOG_INSTALL 1
)

cleanup(gmp install)
