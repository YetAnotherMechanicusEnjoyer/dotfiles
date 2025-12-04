FROM archlinux/archlinux:latest

RUN pacman-key --init && pacman-key --populate && pacman -Syu --noconfirm && pacman -S \
  base-devel \
  rust \
  git \
  --noconfirm

RUN useradd -m builder -G wheel && echo '%wheel ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/wheel_no_passwd

WORKDIR /home/builder

COPY --chown=builder:builder . .

USER builder

RUN git clone https://aur.archlinux.org/yay-bin.git

WORKDIR /home/builder/yay-bin

RUN makepkg -si --noconfirm

WORKDIR /home/builder
