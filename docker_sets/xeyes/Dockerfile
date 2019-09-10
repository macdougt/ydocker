FROM ubuntu
# Note other micro base images might be used
# This image and its containers are meant to show how to run a GUI application
# from inside a container on OSX, XQuartz(https://www.xquartz.org/) must be installed

RUN apt-get update && apt-get install -y x11-apps
CMD ["xeyes"]

# The following commands need to be run:
# open -a XQuartz
# export IP=$(ifconfig en0| grep inet | awk '$1=="inet" {print $2}')
# echo $IP
# xhost + $IP
# docker run -i -t -e DISPLAY=$IP:0 -v /tmp/.X11-unix:/tmp/.X11-unix --net=host gui_image xeyes
