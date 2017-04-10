@ECHO OFF

rem Uncomment for logging -> debug

rem SET "LOGGING=1"

rem Downscaling algorithm

SET "DOWNSCALE=lanczos"

rem Default quality level

SET "Q_NAME=Normal"
SET "Q_PREFIX=NM"
SET "Q_LEVEL=2"

rem Find our quality level

IF "%2" == "1" (
    SET "Q_NAME=Proxy"
    SET "Q_PREFIX=PX"
    SET "Q_LEVEL=0"
)
IF "%2" == "1" (
    SET "Q_NAME=LT"
    SET "Q_PREFIX=LT"
    SET "Q_LEVEL=1"
)
IF "%2" == "2" (
    SET "Q_NAME=Normal"
    SET "Q_PREFIX=NM"
    SET "Q_LEVEL=2"
)
IF "%2" == "3" (
    SET "Q_NAME=HQ"
    SET "Q_PREFIX=HQ"
    SET "Q_LEVEL=3"
)

rem Color out_color_matrix

SET "C_MATRIX=in_color_matrix=bt601:out_color_matrix=bt601"

rem Do stuff

echo "Converting into 1080p ProRes422 (%Q_NAME%)..."

SET "dest_path=%~p1"
SET "dest_file=PR-%Q_PREFIX%-%~n1.mov"

echo "%~n1 -> %dest_file%"

SET "dest_file=%dest_path%%dest_file%"

rem Set FFMPEG options and run it

SET "FF_OPTIONS=-stats -i %1 -c copy -c:v prores -c:a pcm_s16le -map 0 -copyts -profile:v %Q_LEVEL% -filter:v scale=1920:-1:%C_MATRIX%,unsharp -strict -2 -color_range 2 -sws_flags %DOWNSCALE% %dest_file%"

IF "%LOGGING%" == "1" (
    ffmpeg %FF_OPTIONS%
) ELSE (
    ffmpeg -hide_banner -loglevel panic %FF_OPTIONS%
)