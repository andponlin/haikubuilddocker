# Building Haiku Using Docker

[Haiku](https://www.haiku-os.org/) is a desktop operating system that can be cross-compiled from another system.  This can be built from a [Docker](https://www.docker.org) which is a virtualization system that functions on a number of different platforms.  This might not be the fastest way to build this project, but is helpful if your local toolset is not working for some reason.  This project is a simple docker image recipie for creating a virtual machine that is able to build Haiku off sources that are located on the native host.

## Requirements

* An understanding of the [Haiku build process](https://www.haiku-os.org/guides/building)
* Docker installed on the host system
* [Haiku Source](https://www.haiku-os.org/guides/building/get-source-git) (buildtools + haiku) closed in the same directory on the host system
* Internet connection

## Build the Docker Image

From the top level of this project;

```
docker image build -t "haiku:build" .
```

This may take some time.

## Run a Build

Assuming that the Haiku source is cloned on the host machine into ```/mnt/haiku-src/``` with paths present as ```/mnt/haiku-src/haiku``` and ```/mnt/haiku-src/buildtools``` then the following command should see a build carried out and the resultant build products written to ```/mnt/haiku-src/haiku/generated_x86_gcc2```.

```
docker run --rm -v /mnt/haiku-src:/haiku-source haiku:build 
```

If you wish to control the build target and the target architecture, you can issue a command such as;

```
docker run --rm -e HAIKUARCH=x86_64 -e HAIKUTARGET='HaikuDepot' -v /mnt/haiku-src:/haiku-source haiku:build 
```
