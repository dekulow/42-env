# 42-env [🇺🇸](#) | [🇫🇷](README.fr.md)
**A faithful replication of the 42 school development environment within a container.**

*42-env provides a standardized development environment that matches the 42 Paris school setup, ensuring consistency across different host machines.*


## Requirements

- Docker installed on your system
- VS Code with Dev Containers extension (for VS Code integration)
- [XQuartz](https://formulae.brew.sh/cask/xquartz#default) (for macOS/Apple Silicon users running GUI applications)

## Setup Options

### Option 1: VS Code Dev Container

The simplest way to use 42-env is through VS Code's Dev Containers feature:

1. Clone this repository:
   ```bash
   git clone git@github.com:shiftwavedev/42-env.git
   ```

2. Copy the .devcontainer directory to your project:
   ```bash
   cp -r 42-env/.devcontainer /path/to/your_project/
   ```

3. Open your project in VS Code
   
4. When prompted, select "Reopen in Container" or use the Command Palette (F1 or ⌘⇧P on Mac):
   - Type "Dev Containers: Reopen in Container"

VS Code will build the container and open your project with all the 42 environment tools and settings ready to use.

<details>
<summary><strong>💻 Running GUI Applications in VS Code</strong></summary>
<br>

For projects requiring MLX or other graphical applications:

1. Install XQuartz on your host system (if using macOS):
   ```bash
   brew install --cask xquartz
   ```

2. Before starting your VS Code session, open a terminal and run:
   ```bash
   xhost +localhost
   ```

3. In `.devcontainer/devcontainer.json`, ensure these settings are present:
   ```json
   "containerEnv": {
     "DISPLAY": "host.docker.internal:0"
   }
   ```

4. When you're done your session, you can restore security settings with:
   ```bash
   xhost -localhost
   ```
</details>

### Option 2: Terminal/Command Line

If you prefer working in a terminal:

1. Clone this repository:
   ```bash
   git clone git@github.com:shiftwavedev/42-env.git
   ```

2. Build the Docker image:
   ```bash
   docker build -t 42-env 42-env/.devcontainer/
   ```

3. Run a container with your project mounted:
   ```bash
   docker run -ti -v /path/to/your_project:/app 42-env
   ```

   All 42 tools (gcc, norminette, etc.) are available in your PATH.

<details>
<summary><strong>💻 Running GUI Applications in Terminal</strong></summary>
<br>

To use MLX or other graphical applications from a terminal-launched container:

1. Install XQuartz on your host system (if using macOS):
   ```bash
   brew install --cask xquartz
   ```

2. Before starting your container, open a terminal and run:
   ```bash
   xhost +localhost
   ```

3. Launch the container with the DISPLAY environment variable:
   ```bash
   docker run -ti -e DISPLAY=host.docker.internal:0 -v /path/to/your_project:/app 42-env
   ```

4. When you're done, you can restore security settings with:
   ```bash
   xhost -localhost
   ```
</details>

## License

This project is distributed under the [MIT License](LICENSE).