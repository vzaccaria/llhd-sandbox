FROM    ubuntu:xenial

ENV DEBIAN_FRONTEND noninteractive
ENV SHELL /bin/zsh
ENTRYPOINT /bin/zsh

RUN echo "retry n. 1"
RUN apt-get update && apt-get install -y locales

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN apt-get update 

RUN apt-get install -y \
    curl \
    wget \
    zsh \
    stow \
    git \
    libglu1-mesa \
    ispell \
    screen \
    silversearcher-ag \
    software-properties-common \
    tmux \
    unzip \
    nodejs \
    build-essential \
    autoconf \
    automake \
    python-dev \
    libtool \
    pkg-config \
    libssl-dev \
    vim



WORKDIR /root
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y
ENV PATH=/root/.cargo/bin:$PATH
RUN git clone --depth 1 --branch v0.11.0 https://github.com/fabianschuiki/moore.git
WORKDIR /root/moore
RUN git submodule init
RUN git submodule update
RUN cargo build
RUN cargo test --all
