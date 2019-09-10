Again a small Dockerfile can do interesting work.

``` Dockerfile
FROM ubuntu
# Note other micro base images might be used
# This image and its containers are meant to show how to run a GUI application
# from inside a container on OSX, XQuartz(https://www.xquartz.org/) must be installed

RUN apt-get update && apt-get install -y x11-apps
CMD ["xeyes"]
```
Steps to run a GUI application from inside a container on OSX, note: [XQuartz](https://www.xquartz.org/) must be installed.

Running the following commands from the directory with the [Dockerfile](docker_sets/xeyes/Dockerfile):

``` bash
docker build -t gui_image .
open -a XQuartz
export IP=$(ifconfig en0| grep inet | awk '$1=="inet" {print $2}') # assumes en0 is the principal ethernet interface
xhost + $IP
docker run -i -t -e DISPLAY=$IP:0 -v /tmp/.X11-unix:/tmp/.X11-unix gui_image xeyes
```
