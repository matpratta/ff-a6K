@ECHO OFF

rem Prepare our path

SET "BASE=%~d0%~p0"
SET "EXEC=ff-a6K-prores-1080"

rem Run it

"%BASE%%EXEC%" "%~1" 1