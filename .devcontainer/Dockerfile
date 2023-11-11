FROM ubuntu:22.04

# Update system
RUN apt-get update && apt-get dist-upgrade -y

# Install requirements
RUN apt-get install -y \
    git \
    curl

## Install Shell ZSH
RUN apt-get install -y \
    zsh

## Install GCC & Clang
RUN apt-get install -y \
    clang \
    gcc

## Install requirements Norminette
RUN apt-get install -y \
    python3 \
    python3-pip

RUN apt-get clean

## Install ZSH
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

## Install Norminette
RUN python3 -m pip install --upgrade pip setuptools
RUN python3 -m pip install norminette
ENV PATH="$PATH:/home/$USERNAME/.local/bin"
