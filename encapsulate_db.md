Steps to encapsulate a database - custom Dockerfile
----------------------------------------------------

1) Find an image for your chosen database (e.g. postgres) ```Benefit 1```
> Search dockerhub for '[postgres](https://hub.docker.com/search/?isAutomated=0&isOfficial=0&page=1&pullCount=0&q=postgres&starCount=0)'
> Learn from production [Dockerfiles](https://github.com/docker-library/postgres/blob/0aaaf2094034647a552f0b1ec63b1b0ec0f6c2cc/10/Dockerfile)
2) Run your database (notice that the port has been abstracted)
![alt text](images/postgres1.gif "Screencast for running postgres")
3) Let's do more and add an actual database
![alt text](images/postgres2.gif "Screencast for adding a database")

[Link](docker_sets/postgres_custom) for the Dockerfile and artifacts
