
FROM pritunl/archlinux
MAINTAINER Yannick Koechlin <docker@srtnwz.com>


COPY pacman.conf /etc/pacman.conf

RUN pacman-key --populate && \
  pacman-key --refresh-keys && \
  pacman -Sy --noprogressbar --noconfirm && \
  pacman -S --force openssl --noconfirm && \
  pacman -S pacman --noprogressbar --noconfirm && \
  pacman-db-upgrade && \
  pacman -Syyu --noprogressbar --noconfirm

RUN  pacman -S --noprogressbar --noconfirm h2o-future

COPY ./h2o.conf /etc/h2o.conf
EXPOSE 8080

ENTRYPOINT ["/usr/sbin/h2o", "-c", "/etc/h2o.conf"]

