ExternalProject_Add(dcadec
    DEPENDS gcc
	DOWNLOAD_COMMAND git clone https://github.com/foo86/dcadec.git --depth 1
    UPDATE_COMMAND ""
    CONFIGURE_COMMAND ""
    BUILD_COMMAND ${MAKE} clean
        COMMAND ${MAKE} CONFIG_WINDOWS=1 LDFLAGS=-lm CC=${TARGET_ARCH}-gcc AR=${TARGET_ARCH}-ar
    INSTALL_COMMAND ${MAKE} CONFIG_WINDOWS=1 LDFLAGS=-lm CC=${TARGET_ARCH}-gcc AR=${TARGET_ARCH}-ar PREFIX=${MINGW_INSTALL_PREFIX} install
    BUILD_IN_SOURCE 1
    LOG_DOWNLOAD 1 LOG_UPDATE 1 LOG_CONFIGURE 1 LOG_BUILD 1 LOG_INSTALL 1
)

force_rebuild_git(dcadec)
