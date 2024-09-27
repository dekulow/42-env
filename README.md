# Dev environment 42

**This repository contains a replication of the 42 school dev environment.**

## VSCode

Requirements :
- VSX Extension => Dev Containers

```bash
$ git clone git@github.com:dekulow/42-env.git
$ cd 42-env
$ mv .devcontainer <your_project>
```
- Finally open your project with VSCode.
	- Command Palette => Reopen in Container (or) Rebuild and Reopen in Container

## Terminal

```bash
$ git clone git@github.com:dekulow/42-env.git
$ cd 42-env
$ docker build -t 42-env .devcontainer/
$ docker run -ti --rm -v ./:/home/ubuntu/<your_project> 42-env
```


Note (vscode part) : All the extensions automatically added with devcontainer are listed here as recommendations and must be installed manually.
