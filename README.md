# 42-env

**This repository contains a replication of the 42 school dev environment inside a container.**

## VSCode

Requirements :
- (Apple Silicon only) [xquartz](https://formulae.brew.sh/cask/xquartz#default)
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

> **For projects requiring a graphical interface (apple silicon only) :**
>
> Before launching your program, go to your Mac's terminal and authorize xhost access to localhost with this command: `xhost +localhost`.
>
> If you get the error message `xhost: unable to open display ‘/private/tmp/com.apple.launchd.Dpz5F9kJ8Y/org.xquartz:0`. Restart your Mac and run the command before launching your container.
>
> Similarly, for security reasons, it's a good idea to remove permissions when you no longer need them. You can do this with the command `xhost -localhost`.

Notes :
- To change the login42 in the header, go to line 27/28 of the `devcontainer.json` file and change "xxxx" to your login42. 
- Formatting during recording is only active when you save a file manually. If you wish automatic formatting, add the following to the settings section `editor.formatOnSave": false`.

