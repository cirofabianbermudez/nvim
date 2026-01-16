# ffmpeg notes

## Commands using Linux with ffmpeg to shrinking big MP4 video file so smales sizes

3.6 Gb to 556 Mb, great quality
```bash
ffmpeg -i input.mp4 -vcodec h264 -acodec mp2 out.mp4
```

3.6 Gb to 62 Mb, quality "good enough"/acceptable
```bash
ffmpeg -i input.mp4 -s 1280x720 -acodec copy -y output.mp4
```

3.6 Gb to 30 Mb, very shitty quality
```bash
ffmpeg -i input.mp4 -vcodec h264 -b:v 1000k -acodec mp3 output.mp4
```

## References

[GitHub examples](https://gist.github.com/lukehedger/277d136f68b028e22bed)


