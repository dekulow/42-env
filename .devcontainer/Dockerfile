FROM mcr.microsoft.com/devcontainers/base:ubuntu

# Switch user (vscode by default)
USER vscode

# Install necessary packages (env dev 42)
RUN sudo apt-get update && \
	sudo apt install -y --no-install-recommends \
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
	libreadline-dev && \
	sudo apt-get clean

# Install Pipx && norminette && c_formatter_42
RUN sudo apt-get update && sudo apt-get install -y \
	python3-pip \
	python3-venv

RUN pip3 install --user c_formatter_42 norminette
