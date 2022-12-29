Browser vnc
=================

# Summary

It's a image for container for run to Browser with different WebExtension by WebExt

```
docker run --rm --network firefox_default --init -v $(pwd)firefox/dist:/home/node/dist -e DISPLAY_WIDTH=1024 -e DISPLAY_HEIGHT=768 -p8081:8080 -d browser-vnc:v1

```

# Goal

- [x] multi web extension for browser.
- [x] multi network for browser.
- [x] isolation browser for user.
- [x] minimal dependencies.