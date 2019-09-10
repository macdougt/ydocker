FROM debian:jessie

# This command is written this way to help minimize the size of the layers
RUN apt-get update && apt-get install -y --no-install-recommends \
	inotify-tools \
	libnotify-bin \
	&& rm -rf /var/lib/apt/lists/*

CMD ["inotifywait","-r","-m","/shared_directory"]
