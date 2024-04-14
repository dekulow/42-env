# Dev environment 42

**This repository contains a replication of the 42 school dev environment.**


## VSCode

### With devcontainer
Requirements :
- VSX Extension => Dev Containers

```bash
$ git clone git@github.com:dekulow/42-env.git
$ cd 42-env
$ mv ./devcontainer/* <your_project>
```
- Finally open your project with VSCode.
	- Command Palette => Reopen in Container (or) Rebuild and Reopen in Container

### With nix
Requirements :
- VSX Extension => Nix Environment Selector

```bash
$ git clone git@github.com:dekulow/42-env.git
$ cd 42-env
$ mv ./nix/* <your_project>
```
- Finally open your project with VSCode.
	- Command Palette => Nix-Env: Select environment


## Terminal

### With Docker

```bash
$ git clone git@github.com:dekulow/42-env.git
$ cd 42-env
$ docker build -t 42-env ./devcontainer/.devcontainer/
$ docker run -ti --rm -v ./:/home/student 42-env
```

### With nix

```bash
$ git clone git@github.com:dekulow/42-env.git
$ cd 42-env/nix
$ nix-shell
```

Note (vscode part) : All the extensions automatically added with devcontainer are listed here as recommendations and must be installed manually.

⚠️ : c_formatter_42 does not work with nix (error with clang-format-linux)
