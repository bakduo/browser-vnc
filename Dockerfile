#FROM ubuntu:focal
From node:16.18.1

LABEL maintainer="bakduo"

ENV TZ=America/Argentina/Buenos_Aires \
    DEBIAN_FRONTEND=noninteractive

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install git, supervisor, VNC, & X11 packages
RUN set -ex; \
    apt-get update; \
    apt-get install -y \
      bash \
      locales \
      sudo \
      openbox \
      openbox-lxde-session \
      openbox-menu \
      git \
      net-tools \
      vim \
      bzip2 \
      zip \
      wget \
      curl \
      unzip \
      firefox-esr \
      net-tools \
      novnc \
      supervisor \
      x11vnc \
      xterm \
      python3-pip \
      xvfb

ENV LANG en_US.UTF-8 \
    LC_ALL en_US.UTF-8

RUN locale-gen en_US.UTF-8

COPY --chown=root sudo-app.conf /etc/sudoers.d/service-node

RUN chmod 0440 /etc/sudoers.d/service-node

WORKDIR /home/node

USER node

RUN mkdir /home/node/conf.d /home/node/log /home/node/dist /home/node/uploads /home/node/firefox

ENV HOME=/home/node \
    TERM=xterm \
    DEBIAN_FRONTEND=noninteractive \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    LC_ALL=C.UTF-8 \
    DISPLAY=:0.0 \
    DISPLAY_WIDTH=1024 \
    DISPLAY_HEIGHT=768 \
    RUN_XTERM=yes \
    RUN_LXDE=yes \
    PATH=/home/node/firefox:$PATH

COPY --chown=node . .

RUN NODE_ENV=production npm shrinkwrap && npm ci && npm install

COPY --chown=node . .

RUN chmod 755 /home/node/entrypoint.sh /home/node/.vnc/xstartup

VOLUME [ "/home/node/dis","/home/node/firefox"]

EXPOSE 8080

CMD ["/home/node/entrypoint.sh"]