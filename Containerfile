FROM alpine AS ctx
WORKDIR /
COPY build_files .
RUN chmod +x ./*.sh

FROM quay.io/fedora/fedora-kinoite:latest

ARG INSTALL_LIBREOFFICE=false
ARG INSTALL_GIMP=false
ARG INSTALL_SUNSHINE=false

RUN --mount=type=bind,from=ctx,source=/,target=/ctx --mount=type=cache,dst=/var/cache --mount=type=cache,dst=/var/log --mount=type=tmpfs,dst=/tmp \
    /ctx/build.sh

RUN --mount=type=bind,from=ctx,source=/,target=/ctx --mount=type=cache,dst=/var/cache --mount=type=cache,dst=/var/log --mount=type=tmpfs,dst=/tmp \
    /ctx/runner.sh INSTALL_LIBREOFFICE /ctx/libreoffice.sh

RUN --mount=type=bind,from=ctx,source=/,target=/ctx --mount=type=cache,dst=/var/cache --mount=type=cache,dst=/var/log --mount=type=tmpfs,dst=/tmp \
    /ctx/runner.sh INSTALL_LIBREOFFICE /ctx/gimp.sh

RUN --mount=type=bind,from=ctx,source=/,target=/ctx --mount=type=cache,dst=/var/cache --mount=type=cache,dst=/var/log --mount=type=tmpfs,dst=/tmp \
    /ctx/runner.sh INSTALL_LIBREOFFICE /ctx/sunshine.sh

RUN bootc container lint
