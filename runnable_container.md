A small Dockerfile can do interesting work.

``` Dockerfile
FROM debian:jessie

RUN apt-get update && apt-get install -y --no-install-recommends \
	inotify-tools \
	libnotify-bin \
	&& rm -rf /var/lib/apt/lists/*

CMD ["inotifywait","-r","-m","/shared_directory"]
```

Running the following:

``` bash
docker run -it inotify_image 
```
creates a container that will listen to its /shared_directory

In contrast, the container made by the following command:

``` bash
docker run -it -v $PWD:/shared_directory inotify_image 
```
will listen to the host's current working directory.

[github reference](docker_sets/inotify)
