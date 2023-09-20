ExternalProject_Add(ffmpeg
    DEPENDS
        bzip2
        gmp
        lame
        libass
        libpng
        fontconfig
        harfbuzz
        x264
        libxml2
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
        --disable-everything
        --enable-encoder=libx264
        --enable-decoder=h264
        --enable-muxer=h264,mp4
        --enable-demuxer=h264
        --enable-parser=h264
        --enable-protocol=file
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
        --disable-libopus
        --disable-libsoxr
        --disable-libspeex
        --disable-libvorbis
        --disable-libbs2b
        --disable-libvpx
        --disable-libwebp
        --enable-libx264
        --disable-libx265
        --disable-libaom
        --disable-librav1e
        --disable-libdav1d
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
        --disable-libjxl
        --disable-libplacebo
        --disable-libshaderc
        --disable-libzvbi
        --disable-libaribcaption
        --disable-cuda
        --disable-cuvid
        --disable-nvdec
        --disable-nvenc
        --disable-amf
        --disable-doc
        --disable-vaapi
        --disable-vdpau
        --disable-videotoolbox
        --disable-decoder=libaom_av1
        --disable-network
    BUILD_COMMAND ${MAKE}
    INSTALL_COMMAND ${MAKE} install
    LOG_DOWNLOAD 1 LOG_UPDATE 1 LOG_CONFIGURE 1 LOG_BUILD 1 LOG_INSTALL 1
)

force_rebuild_git(ffmpeg)
cleanup(ffmpeg install)
