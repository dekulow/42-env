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
	python3-venv \
	git \
	vim \
	ssh \
	libreadline-dev \
	xorg \
	libxext-dev \
	libbsd-dev && \
	sudo apt-get clean

RUN pip3 install --user norminette
