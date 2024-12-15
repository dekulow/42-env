# 42-env

**A replication of the 42 school dev environment within a container.**

## Setup

### VSCode

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

### Terminal

Requirements :
- (Apple Silicon only) [xquartz](https://formulae.brew.sh/cask/xquartz#default)

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

## **FAQ**
- **How to change the login42 in the header?**

	Go to line 27/28 of the `devcontainer.json` file and change "xxxx" to your login42.
- **How to enable automatic formatting?**

	Add the following to the settings section in your VSCode: `"editor.formatOnSave": true`.

- **Why use `--platform=linux/amd64` ?**

	Using `c_formatter_42` requires `/lib64/ld-linux-x86-64.so.2`. However, the only way to get it at present is to specify a particular plaform type (x86). This [solution](https://stackoverflow.com/questions/71040681/qemu-x86-64-could-not-open-lib64-ld-linux-x86-64-so-2-no-such-file-or-direc/71611002#71611002) is temporary and I know how counterproductive it can be. It's the only solution we've found so far (in a limited time). **Note that the container can be used on any architecture.**


