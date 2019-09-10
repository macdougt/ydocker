# Overview of Docker with Benefits

What is docker?
----------------

Docker is an open platform, written in [Go](https://golang.org/), for developing, shipping, and running applications. Often called a container runtime.

Building blocks
---------------
- Image - An image is a read-only template with instructions for creating a Docker container
> Can encapsulate a set of software, dependencies and configuration and is defined by a Dockerfile (simple instruction set)
- Container - Sandbox for an OS state
> OS level virtualization, are isolated in a host using the two Linux kernel features called namespaces and control groups. Containers are images with a readable/writeable layer [[ref](https://medium.com/@jessgreb01/digging-into-docker-layers-c22f948ed612)]
- Layers - intermediate images
> Layers are reused by multiple images saving disk space and reducing time to build images
- Union file system - logical file system
> Files and directories of separate file systems can be transparently overlaid, forming a single coherent file system
- Dockerfile - Instruction set used to define images
> Simple DSL that has intentionally been left simple

Analogy to JDK
--------------

|Docker world|Java world|
-------------|:-----------|
|engine|JVM|
|Dockerfile|Java file|
|image|class  (classes are hierarchical, so are images)|
|container|object or instance|

Are containers small virtual machines?
--------------------------------------

A container runs natively on Linux and Windows for images based on their respective OS and shares the kernel of the host machine with other containers. For linux based images, OSX and Windows use very light-weight VMs (provided by their hypervisors) to run containers. By contrast, a virtual machine (VM) runs a full-blown “guest” operating system with virtual access to host resources through a hypervisor.

[<img src="https://www.docker.com/sites/default/files/Container%402x.png" width="300">  &nbsp;&nbsp;&nbsp;  <img src="https://www.docker.com/sites/default/files/VM%402x.png" width="300">](https://docs.docker.com/get-started/#containers-and-virtual-machines) 

What is docker engine?
----------------------

[<img src="https://docs.docker.com/engine/images/engine-components-flow.png" width="400">](https://docs.docker.com/engine/docker-overview/#docker-engine)

What is the docker architecture?
--------------------------------
[<img src="https://docs.docker.com/engine/images/architecture.svg" width="400">](https://docs.docker.com/engine/docker-overview/#docker-architecture)

Dimensions of docker
--------------------

- storage
- networking

How does docker deal with stateful applications and try to remain stateless?
----------------------------------------------------------------------------

Docker uses different [storage](https://docs.docker.com/storage) options. Volumes are the most common solution and are stored in a part of the host filesystem which is managed by Docker.

How does docker deal with networking?
-------------------------------------

docker offers multiple networking configurations for different objectives.

Network drivers:

 - bridge (default): used when your applications run in standalone containers that need to communicate.
 - host: for standalone containers, remove network isolation between the container and the Docker host. This option is the fastest in no bridge translation needs to be performed on the incoming packets but the ports exposed on the containers will consume the host's ports.
 - overlay: sits on top of (overlays) the host-specific networks allows containers connected to it to communicate securely.

... there are [more](https://docs.docker.com/network)

What is a docker registry?
--------------------------

docker registry is a server side application that stores and lets you distribute versioned Docker images. It can be used to share images easily and the concept is integrated into docker's full toolchain. [dockerhub](https://hub.docker.com) is the default registry. [dockerstore](https://store.docker.com) is new at the time of writing.

Before writing your own images, consult dockerhub.

What are multi-stage builds?
----------------------------
multi-stage build are a docker build feature that allow orchestration of a complex build in a single Dockerfile. A builder image can be leveraged to create a streamline (e.g. production) image. Encapsulating python demonstrates this concept well. 

What about docker compose?
--------------------------
Compose is a tool for defining and running multi-container Docker applications using a docker-compose file. The compose file also allows the user to put the options for running containers in a file. 

What about docker swarm and kubernetes?
---------------------------------------
Used to automate deployment, scaling, and management of containerized applications, they offer a higher level orchestration of systems made up of containers.

Docker benefits
---------------

1. prototyping 
2. lots of pre canned images ([dockerhub](https://hub.docker.com))
3. instruction set is a forced reminder of how to do things (self documentation)
4. incremental builds (particularly helpful when prototyping and building images based on other images, increases productivity)
5. multistage builds allows for tiny images
6. [micro images](https://www.brianchristner.io/docker-image-base-os-size-comparison) exist to minimize footprint (only deploy what is necessary)
7. reproducible environment (environment standardization)
8. version control with registry (easy rollback or swapping)
9. portable for supported platforms
10. cloud support
11. promotes microservice architecture (scales both horizontally and vertically)
12. no residue on machine (mess something up, start over)
13. you can limit resources available to containers
14. ecosystem - e.g. maven plugins, orchestration tools
15. can create runnable containers
16. new level of sharing/communication

Quick examples to whet the appetite
-----------------------------------

1) [Encapsulate a well known database - custom Dockerfile](encapsulate_db.md)
2) [Create a runnable container](runnable_container.md)
3) [Run a GUI application from inside a container](gui_from_container.md)
4) [Old versus new](superset_before_after.md)

Docker alternatives
-------------------

Click [docker alternatives](https://www.1and1.ca/digitalguide/server/know-how/docker-alternatives-at-a-glance/) to learn about docker alternatives
