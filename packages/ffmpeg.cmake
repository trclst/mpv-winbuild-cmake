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
        --disable-network
        --disable-avisynth
        --disable-vapoursynth
        --disable-everything
        --enable-encoder=libx264,ac3,aac,libmp3lame,png,srt,flac,mp2
        --enable-decoder=h264,ac3,aac,eac3,flac,mp3,png,srt,flac,mp2,mjpeg
        --enable-muxer=h264,mp4,mpegts,ac3,dts,eac3,flac,matroska,mp3,srt,mp2,ogg
        --enable-demuxer=h264,aac,ac3,ass,dts,dtshd,matroska,mp3,mpegts,srt,flac,ogg,image2
        --enable-parser=h264,aac,ac3,flac,png
        --enable-protocol=file
        --enable-zlib
        --enable-libxml2
        --enable-gmp
        --enable-libass
        --enable-libfreetype
        --enable-libfribidi
        --enable-libfontconfig
        --enable-libharfbuzz
        --enable-libmp3lame
        --enable-libx264

    BUILD_COMMAND ${MAKE}
    INSTALL_COMMAND ${MAKE} install
    LOG_DOWNLOAD 1 LOG_UPDATE 1 LOG_CONFIGURE 1 LOG_BUILD 1 LOG_INSTALL 1
)

force_rebuild_git(ffmpeg)
cleanup(ffmpeg install)
