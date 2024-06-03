FROM ubuntu:24.04

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    file \
    git \
    gcc \
    gdb \
    g++ \
    make \
    libxft-dev \
    libxpm-dev \
    locales \
    unzip \
    vim \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN git config --global core.filemode false

# Set the locale
RUN sed -i 's/# \(en_US\.UTF-8 .*\)/\1/' /etc/locale.gen && \
    locale-gen
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8  
ENV TZ "Asia/Tokyo"

ENV DISPLAY host.docker.internal:0.0
