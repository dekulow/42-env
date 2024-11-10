# 42-env

**This repository contains a replication of the 42 school dev environment inside a container.**

## VSCode

Requirements :
- VSX Extension => Dev Containers

```bash
$ git clone git@github.com:dekulow/42-env.git
$ cd 42-env
$ cp .devcontainer <your_project>
```
- Finally open your project with VSCode.
	- Command Palette => Reopen in Container (or) Rebuild and Reopen in Container

## Terminal

```bash
$ git clone git@github.com:dekulow/42-env.git
$ cd 42-env
$ docker build -t 42-env .devcontainer/
$ docker run -ti --rm -v <path_to_your_project>:/home/ubuntu/<project_name> 42-env
```

Notes :
- To change the login42 in the header, go to line 27/28 of the `devcontainer.json` file and change "xxxx" to your login42. 
- Formatting during recording is only active when you save a file manually. If you wish automatic formatting, add the following to the settings section `editor.formatOnSave": false`.

