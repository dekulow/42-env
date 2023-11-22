FROM debian:buster-slim

ARG USERNAME=student
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Create user
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && apt-get update \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

# Install necessary packages (env dev 42)
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        build-essential \
        clang \
        llvm \
        libunwind-dev \
        gdb \
        valgrind \
        python3 \
        python3-pip \
        git \
        fish && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Upgrade pip and install norminette
RUN python3 -m pip install --upgrade pip setuptools && \
    python3 -m pip install norminette

# Install necessary package (c-format-42 extension)
RUN pip3 install --user c_formatter_42

# Switch to user $USERNAME
USER $USERNAME
