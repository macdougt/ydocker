While considering how to demonstrate docker and push my view of its utility to our dev community, 
I realized that I am promoting docker as a means to showcase and share technologies whether ours
or borrowed. However, I am trying to share docker itself, so what better way then to use docker.

Enter docker-in-docker. Using the following `Dockerfile`:

``` Dockerfile
FROM docker:stable-dind

RUN mkdir -p /holdStuff
COPY superset.tar /holdStuff/superset.tar
COPY superset /superset

COPY start.sh /holdStuff/start.sh
CMD ["/holdStuff/start.sh"]
```

and `start.sh`:

``` sh
#!/usr/bin/env sh

echo "Starting dockerd"

dockerd-entrypoint.sh &

sleep 3 # Wait for dockerd settle
echo "Done waiting"

#docker pull tylerfowler/superset
ls -al /holdStuff
docker load -i /holdStuff/superset.tar
docker run -d -v `pwd`/superset:/superset -w /superset --name super_container -p 8088:8088 tylerfowler/superset

sleep 864000
```

I can automate my earlier [tutorial](tutorial.md).
