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
- [x] minimal desktop dependencies.

# Configuration Desktop for user container

```
lxde.conf

[program:startlxde]
command=startlxde
autorestart=true
user = node

xvfb.conf

[program:xvfb]
command=Xvfb :0 -screen 0 DISPLAY_WIDTHxDISPLAY_HEIGHTx24 -listen tcp -ac
autorestart=true
user=node

x11vnc.conf

[program:x11vnc]
command=x11vnc -forever -loop -noxdamage -repeat -shared
autorestart=true
user = node

websocket.conf

[program:websockify]
command=websockify --web /usr/share/novnc 8080 localhost:5900
autorestart=true
user = node

etc...

```