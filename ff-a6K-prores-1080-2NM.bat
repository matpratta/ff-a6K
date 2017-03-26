@ECHO OFF
echo "Converting into 1080p ProRes422 (2)..."

SET "dest_path=%~p1"
SET "dest_file=PR-NM-%~n1.mov"

echo "%~n1 -> %dest_file%"

SET "dest_file=%dest_path%%dest_file%"

ffmpeg -hide_banner -loglevel panic -stats -i %1 -c:v prores -profile:v 2 -c:a copy -s 1920x1080 %dest_file%