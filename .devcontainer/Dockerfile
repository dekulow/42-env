FROM ubuntu

ARG USERNAME=student
ARG USER_UID=1001
ARG USER_GID=$USER_UID

# Create user
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && apt-get update \
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
        fish && \
    apt-get clean

# Switch to user $USERNAME
USER $USERNAME

# Install Pipx && norminette && c_formatter_42
RUN sudo apt-get update && \
	sudo apt install -y python3-setuptools pipx && \
	pipx install  norminette c_formatter_42

WORKDIR /home/${USERNAME}

ENV PATH="$PATH:/home/student/.local/bin"

# Start with Fish Shell
CMD [ "fish" ]