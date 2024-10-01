FROM ubuntu

ARG USERNAME=ubuntu

# Create user
RUN apt-get update \
    && apt install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME


# Install necessary packages (env dev 42)
RUN apt-get update && \
    apt install -y --no-install-recommends \
        build-essential \
        clang \
        llvm \
        libunwind-dev \
        gdb \
        valgrind \
        python3 \
        python3-pip \
        git \
  	    vim \
        ssh \
        fish && \
    apt-get clean

# Switch to user $USERNAME
USER $USERNAME

# Install Pipx && norminette && c_formatter_42
RUN sudo apt-get update && \
	sudo apt install -y python3-setuptools pipx && \
	pipx install  norminette c_formatter_42

WORKDIR /home/${USERNAME}

ENV PATH="$PATH:/home/${USERNAME}/.local/bin"

# Start with Fish Shell
CMD [ "fish" ]
