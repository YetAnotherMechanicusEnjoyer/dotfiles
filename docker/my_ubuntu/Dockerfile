FROM ubuntu:25.10

RUN echo "deb http://old-releases.ubuntu.com/ubuntu/ mantic main restricted universe multiverse" > /etc/apt/sources.list && \
  echo "deb http://old-releases.ubuntu.com/ubuntu/ mantic-updates main restricted universe multiverse" >> /etc/apt/sources.list && \
  echo "deb http://old-releases.ubuntu.com/ubuntu/ mantic-security main restricted universe multiverse" >> /etc/apt/sources.list

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections \
  && apt-get update -y \
  && apt-get install -y --no-install-recommends software-properties-common apt-utils \
  && add-apt-repository -y -s universe \
  && apt-get update \
  && apt-get upgrade -y \
  && apt-get install -y --no-install-recommends \
  avr-libc \
  cargo \
  clangd \
  clang-tools \
  cmake \
  docker-compose \
  docker.io \
  gcovr \
  git \
  libc6 \
  libc-bin \
  liballegro5-dev \
  liballegro-ttf5-dev \
  liballegro-image5-dev \
  libc-bin \
  libc-dev-bin \
  libc-devtools \
  libc6-dbg \
  libconfig++-dev \
  libcsfml-dev \
  libcsfml-doc \
  libcunit1 \
  libcunit1-dev \
  libelf-dev \
  libfreetype-dev \
  libgmp-dev \
  libgmp10 \
  libgmp10-doc \
  libgmp3-dev \
  libgmpxx4ldbl \
  libgudev-1.0-dev \
  libjpeg-turbo8-dev \
  libncurses-dev \
  libopenal-dev \
  libsdl2-dev \
  libsdl2-ttf-dev \
  libsdl2-mixer-dev \
  libsdl2-image-dev \
  libsdl2-gfx-dev \
  libsfml-dev \
  libsfml-doc \
  libuuid1 \
  libvirt-dev \
  libvorbis-dev \
  libx11-doc \
  libx11-xcb-dev \
  libxcb-image0 \
  libxcb-image0-dev \
  libxcb-util-dev \
  libxcb-util0-dev \
  libxcb-util1 \
  libxcursor-dev \
  libxext-dev \
  libxext-doc \
  libxi-dev \
  libxinerama-dev \
  libxrandr-dev \
  locales \
  ltrace \
  liblua5.4-dev \
  lua5.4 \
  luajit \
  ncurses-base \
  net-tools \
  npm \
  nodejs \
  python3 \
  rustc \
  sudo \
  systemd-dev \
  tar \
  tcpdump \
  tmux \
  unzip \
  valgrind \
  neovim \
  vim \
  zip \
  zsh \
  curl \
  && apt-get clean -y

RUN localedef -i en_US -f UTF-8 en_US.UTF-8

ENV LANG=en_US.utf8 LANGUAGE=en_US:en LC_ALL=en_US.utf8 PKG_CONFIG_PATH=/usr/local/lib/pkgconfig

WORKDIR /usr/app
