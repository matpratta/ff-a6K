@ECHO OFF
echo "Loading batch converter..."

REM Enable delayed expansion (allows us to count up current file number)
SETLOCAL ENABLEDELAYEDEXPANSION

REM XAVC-S pattern here
SET "pattern=*C*.MP4"

REM Inicialize counters
SET /a C_TOTAL=0
SET /a C_CURRT=0

REM Sum up total amount of files
for %%# in ("%pattern%") do (
    set /a C_TOTAL+=1
)

REM Batch convert each of the files
echo "Batch converting %C_TOTAL% XAVC-S files into ProRes422..."

for %%# in ("%pattern%") do (
    @ECHO OFF
    SET /a C_CURRT+=1
    echo "----- [!C_CURRT!/%C_TOTAL%] -----"
    ff-a6K-prores.bat "%%~#"
)

echo "Finished converting."

REM Create directory for output
echo "Creating output directory..."
mkdir prores

REM Move all files
echo "Moving files..."

move /y "PR-*" "./prores/"

REM Informative text
echo "All files starting with PR are ProRes422 files, they are located under the prores subdirectory."
echo "Finished."

pause