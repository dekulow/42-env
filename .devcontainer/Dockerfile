FROM ubuntu:22.04 AS base

ARG VERSION_MAKE=4.3
ARG VERSION_LIB_READLINE=8.1
ARG VERSION_VALGRIND=3.18.1

WORKDIR /root

RUN apt-get update && \
    export DEBIAN_FRONTEND=noninteractive && \
    # Update of the package list and install utilities
    apt-get install --no-install-recommends -y \
    wget \
    git \
    pkg-config \
    binutils \
    ssh \
    fish \
    libc6-dbg \
    gnupg \
    curl \
    cmake \
    meson \
    build-essential \
    software-properties-common \
    xorg \
    libxext-dev \
    libbsd-dev \
    zlib1g-dev \
    python3 \
    python3-pip \
    python3-venv \
    && \
    # Add LLVM-TOOLCHAIN repositories
    wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add - && \
    add-apt-repository "deb http://apt.llvm.org/focal/ llvm-toolchain-focal-12 main" && \
    add-apt-repository ppa:ubuntu-toolchain-r/test && \
    apt-get install --no-install-recommends -y \
    # Install LLVM-TOOLCHAIN and GCC
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

FROM base AS make_build
# Setup and install Make
RUN wget https://ftp.gnu.org/gnu/make/make-${VERSION_MAKE}.tar.gz && \
    tar -xvzf make-${VERSION_MAKE}.tar.gz && \
    cd make-${VERSION_MAKE} && \
    ./configure && \
    make && \
    make install

FROM base AS readline_build
# Setup and install library Readline
RUN wget https://ftp.gnu.org/gnu/readline/readline-${VERSION_LIB_READLINE}.tar.gz && \
    tar -xzvf readline-${VERSION_LIB_READLINE}.tar.gz && \
    cd readline-${VERSION_LIB_READLINE} && \
    ./configure --enable-shared && \
    make && \
    make install

FROM base AS mlx_build
# Setup and install library MLX
RUN git clone https://github.com/42paris/minilibx-linux.git && \
    cd minilibx-linux && \
    make

FROM base AS final
# Copy the built libraries from the previous stages
COPY --from=make_build /usr/local/bin/make /usr/local/bin/make
COPY --from=readline_build /usr/local/lib/libreadline.* /usr/local/bin/readline
COPY --from=mlx_build /root/minilibx-linux/mlx.h /usr/local/include/mlx.h
COPY --from=mlx_build /root/minilibx-linux/libmlx.a /usr/local/lib/libmlx.a

# Run ldconfig to update the dynamic linker run-time bindings
RUN ldconfig

# Setup and install Valgrind
RUN wget https://sourceware.org/pub/valgrind/valgrind-${VERSION_VALGRIND}.tar.bz2 && \
    tar -xjf valgrind-${VERSION_VALGRIND}.tar.bz2 && \
    cd valgrind-${VERSION_VALGRIND} && \
    ./configure && \
    make && \
    make install && \
    ldconfig && \
    cd .. && \
    rm -rf valgrind-${VERSION_VALGRIND}*

# Setup virtual env python and install norminette
RUN python3 -m venv /opt/venv && \
    chown -R $USER:$USER /opt/venv
ENV PATH="$PATH:/opt/venv/bin"
RUN python3 -m pip install --upgrade pip setuptools && \
    python3 -m pip install norminette

# Remove welcome message Fish
RUN fish -c "set -U fish_greeting"

WORKDIR /app

CMD ["/bin/fish"]
