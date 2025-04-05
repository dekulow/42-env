FROM ubuntu:22.04

ARG VERSION_MAKE=4.3
ARG VERSION_LIB_READLINE=8.1
ARG VERSION_VALGRIND=3.18.1

# Update of the package list and install utilities
RUN apt-get update && \
    apt-get install --no-install-recommends -y \
    sudo \
    git \
    pkg-config \
    binutils \
    fish \
    gnupg \
    curl \
    wget \
    cmake \
    meson \
    build-essential \
    software-properties-common \
    xorg \
    libxext-dev \
    libbsd-dev \
    python3 \
    python3-pip \
    python3-venv \
    openssh-server

# Add LLVM-TOOLCHAIN repositories
RUN apt-get update && \
    export DEBIAN_FRONTEND=noninteractive && \
    wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add - && \
    add-apt-repository "deb http://apt.llvm.org/focal/ llvm-toolchain-focal-12 main" && \
    add-apt-repository ppa:ubuntu-toolchain-r/test

# Install LLVM-TOOLCHAIN and GCC
RUN apt-get update && \
    export DEBIAN_FRONTEND=noninteractive && \
    apt-get install --no-install-recommends -y \
    clang \
    clang-12 \
    clang-14 \
    clangd \
    gdb \
    lldb-12 \
    gcc-10=10.5.0-1ubuntu1~22.04 \
    g++-10=10.5.0-1ubuntu1~22.04 \
    gcc-11=11.4.0-1ubuntu1~22.04 \
    g++-11=11.4.0-1ubuntu1~22.04

# Changes the symbolic links for LLVM-TOOLCHAIN and GCC (and others)
RUN update-alternatives --install /usr/bin/clang clang /usr/bin/clang-12 100 \
    && update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-12 100 \
    && update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-10 100 \
    && update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-10 100 \
    && update-alternatives --install /usr/bin/cc cc /usr/bin/clang-12 100 \
    && update-alternatives --install /usr/bin/c++ c++ /usr/bin/clang++-12 100

# Setup and install Make
RUN wget https://ftp.gnu.org/gnu/make/make-${VERSION_MAKE}.tar.gz && \
    tar -xvzf make-${VERSION_MAKE}.tar.gz && \
    cd make-${VERSION_MAKE} && \
    ./configure && \
    make && \
    sudo make install && \
    cd .. && \
    rm -rf make-${VERSION_MAKE}

# Setup and install library Readline
RUN wget https://ftp.gnu.org/gnu/readline/readline-${VERSION_LIB_READLINE}.tar.gz && \
    tar -xzvf readline-${VERSION_LIB_READLINE}.tar.gz && \
    cd readline-${VERSION_LIB_READLINE} && \
    ./configure --enable-shared && \
    make && \
    sudo make install && \
    sudo ldconfig && \
    cd .. && \
    rm -rf readline-${VERSION_LIB_READLINE}*

# Setup and install Valgrind
RUN wget https://sourceware.org/pub/valgrind/valgrind-${VERSION_VALGRIND}.tar.bz2 && \
    tar -xjf valgrind-${VERSION_VALGRIND}.tar.bz2 && \
    cd valgrind-${VERSION_VALGRIND} && \
    ./configure && \
    make && \
    make install && \
    sudo ldconfig && \
    cd .. && \
    rm -rf valgrind-${VERSION_VALGRIND}*

# Setup and install library MLX
RUN git clone https://github.com/42paris/minilibx-linux.git && \
    cd minilibx-linux && \
    make && \
    sudo cp mlx.h /usr/local/include && \
    sudo cp libmlx.a /usr/local/lib && \
    cd .. && \
    rm -rf minilibx-linux

# Setup virtual env python and install norminette
RUN python3 -m venv /opt/venv && \
    chown -R $USER:$USER /opt/venv
ENV PATH="$PATH:/opt/venv/bin"
RUN python3 -m pip install --upgrade pip setuptools && \
    python3 -m pip install norminette

# Cleanup packages
RUN apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*

# Remove welcome message Fish
RUN fish -c "set -U fish_greeting"

# Setup openssh-server
RUN mkdir /var/run/sshd && \
    echo "root:password" | chpasswd && \
    echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config

WORKDIR /app

CMD ["/usr/sbin/sshd", "-D"]
