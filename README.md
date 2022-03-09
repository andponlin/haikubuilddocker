# Updated and revisited at: 2022.03.08

This repository was improved over the time to include Makefile to make it easier for the whole process to complete, some build scripts and parameters where updated also.

# Diclaimer

[Haiku](https://www.haiku-os.org/) is a desktop operating system that can be cross-compiled from another system.  This can be built from a [Docker](https://www.docker.org) which is a virtualization system that functions on a number of different platforms.  This might not be the fastest way to build this project, but is helpful if your local toolset is not working for some reason.  This project is a simple docker image recipie for creating a virtual machine that is able to build Haiku off sources that are located on the native host.

## Requirements

* Docker installed on the host system
* Internet connection

## Build the Docker Image then haiku

From the top level of this project;

```
make build_builder
make sync
make
```

The generated images will be in haiku/generated_<ARCH>/

This may take some time.

## More build options

You can build x86_64 version of haiku:
```
make build_x64
```
Clean generated images and binaries:
```
make clean
```
Enter the build environment:
```
make enter
```

You can also edit Makefile to set cpus variable (number of cpu cores you have) which will affect the build process.
