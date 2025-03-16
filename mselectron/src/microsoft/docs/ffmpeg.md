# FFmpeg flavours

## Problem

We want to control what codecs we ship with FFmpeg in Electron-based apps.  
Many Microsoft applications don't need any codecs at all, others only need  
a subset of what the upstream (GitHub) Electron has to offer.

Usage of many codecs require an explicit approval from CELA, read more here:  
<https://docs.opensource.microsoft.com/legal/common-issues-and-solutions/codecs/>

## Solution

*When in Rome, do as the Romans do*

Use the same approach as Chromium:
  - build FFmpeg using FFmpeg build system, i.e. `./configure && make`,  
    with the aid of Chromium's "build_ffmpeg.py" script;

  - generate a GN configuration from the resulting build files.

To create new FFmpeg flavours we patch the aforementioned "build_ffmpeg.py".

The "upstream" FFmpeg build is done in the "[electron-util-generate-ffmpeg-configs][]"  
pipeline. As a build artifact it produces a set of files:
- ffmpeg_generated.gni
- chromium/config/{FLAVOUR}/*
- libavcodec
- libavformat
- libavutil

Download the `ffmpeg-generated` artifact and extract the files into the
`src/third_party/ffmpeg` directory in this repo, commit them and the update is
done.

[electron-util-generate-ffmpeg-configs]: https://devdiv.visualstudio.com/DevDiv/_build?definitionId=19595
