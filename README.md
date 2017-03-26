# XAVC-S conversion toolset for FFMPEG

This package's objective is to have a simple way of converting Sony's XAVC-S files to something more edit-friendly, like ProRes422, by using FFMPEG.

## Inspiration

At first I made this because my laptop's NLE simply couldn't handle full-size 4K files and would lag even with 1080p XAVC-S files, due to their encoding, so after some testing I made a 1:1 XAVC-S -> ProRes convert script.
Not enough, I ended up also creating a second batch script so I could just encode overnight (5-yo laptop editing FTW)

## Ok, how do we use it?

Simple, just grab the batch file (the one ending with "-batch") and throw it into the directory with your files (C0001.MP4, etc), then, also grab one of the ProRes format files (like the 1080-3HQ, for 1080p ProRes422 HQ), copy it into your directory and rename it to just "ff-a6K-prores.bat"

Then you run the batch file and just let it do its job, when finished you should have a new "prores" directory with a ton of files renamed like "PR-HQ-C0001.MOV", the PR part tells the file is in ProRes and the HQ part tells the format (Proxy/LT/Normal/HQ)

Have fun!

### Why all these formats? Why not stick with HQ?

Because I wanted to test different formats and have the option to quickly switch them in the future.