#!/bin/bash
set -ex

RUN_LXDE=${RUN_LXDE:-yes}

RUN_XTERM=${RUN_XTERM:-yes}

case $RUN_LXDE in
  false|no|n|0)
    rm -f /home/node/conf.d/lxde.conf
    ;;
esac

case $RUN_XTERM in
  false|no|n|0)
    rm -f /home/node/conf.d/xterm.conf
    ;;
esac

sed -re "s/DISPLAY_WIDTH/${DISPLAY_WIDTH}/g" -i /home/node/conf.d/xvfb.conf

sed -re "s/DISPLAY_HEIGHT/${DISPLAY_HEIGHT}/g" -i /home/node/conf.d/xvfb.conf

exec sudo supervisord -c /home/node/supervisord.conf