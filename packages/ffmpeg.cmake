ExternalProject_Add(ffmpeg
    DEPENDS
        amf-headers
        bzip2
        gmp
        lame
        libass
        libpng
        libvpx
        libwebp
        fontconfig
        harfbuzz
        opus
        vorbis
        x264
        libxml2
        libjxl
        shaderc
        libplacebo
        aom
        rav1e
        dav1d
    GIT_REPOSITORY https://github.com/FFmpeg/FFmpeg.git
    SOURCE_DIR ${SOURCE_LOCATION}
    GIT_CLONE_FLAGS "--filter=tree:0"
    UPDATE_COMMAND ""
    CONFIGURE_COMMAND ${EXEC} <SOURCE_DIR>/configure
        --cross-prefix=${TARGET_ARCH}-
        --prefix=${MINGW_INSTALL_PREFIX}
        --arch=${TARGET_CPU}
        --target-os=mingw32
        --target-exec=wine
        --pkg-config-flags=--static
        --enable-cross-compile
        --enable-runtime-cpudetect
        --enable-gpl
        --enable-version3
        --enable-nonfree
        --enable-postproc
        --disable-avisynth
        --disable-vapoursynth
        --enable-gmp
        --enable-libass
        --disable-libbluray
        --enable-libfreetype
        --enable-libfribidi
        --enable-libfontconfig
        --enable-libharfbuzz
        --disable-libmodplug
        --disable-libopenmpt
        --enable-libmp3lame
        --enable-libopus
        --disable-libsoxr
        --disable-libspeex
        --enable-libvorbis
        --disable-libbs2b
        --enable-libvpx
        --enable-libwebp
        --enable-libx264
        --disable-libx265
        --enable-libaom
        --enable-librav1e
        --enable-libdav1d
        --disable-libdavs2
        --disable-libuavs3d
        --disable-libxvid
        --disable-libzimg
        --disable-mbedtls
        --enable-libxml2
        --disable-libmysofa
        --disable-libssh
        --disable-libsrt
        --disable-libvpl
        --enable-libjxl
        --enable-libplacebo
        --enable-libshaderc
        --disable-libzvbi
        --disable-libaribcaption
        --enable-cuda
        --enable-cuvid
        --enable-nvdec
        --enable-nvenc
        --enable-amf
        --disable-doc
        --disable-vaapi
        --disable-vdpau
        --disable-videotoolbox
        --disable-decoder=libaom_av1
        "--extra-libs='-lstdc++'" # needs by libjxl and shaderc
    BUILD_COMMAND ${MAKE}
    INSTALL_COMMAND ${MAKE} install
    LOG_DOWNLOAD 1 LOG_UPDATE 1 LOG_CONFIGURE 1 LOG_BUILD 1 LOG_INSTALL 1
)

force_rebuild_git(ffmpeg)
cleanup(ffmpeg install)
