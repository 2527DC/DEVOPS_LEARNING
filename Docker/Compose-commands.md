Here’s the plain text version (no markdown formatting):

---

Docker Compose Commands

1 -> docker-compose up                  : it will execute the docker compose file and create the container
2 -> docker-compose down                : it will remove the containers
3 -> docker-compose up -d               : run in background mode
4 -> docker-compose up --pull=never     : run the container using the local image only (no image pull from registry)
5 -> docker-compose build               : builds the image only
6 -> docker-compose up --build          : builds and runs the container
7 -> docker-compose build --no-cache    : forcefully rebuilds the image even if it is present
(can use "up" instead of "build" if you also want to run containers)
8 -> docker-compose start               : starts already created containers which are in stopped state
9 -> docker-compose stop                : used to stop the running containers

10 -> RUN_TIME_ARG=value docker-compose up / build / others
--- here the RUN_TIME_ARG is a user-defined variable used as a runtime argument passed to docker compose

Docker Commands on Scenarios

1 -> how to enter into a container when the container is already running
docker exec -it container_name shell_name
Example: docker exec -it web bash

2 -> how to run a container in interactive mode
docker run -it image_name

3 -> Attach to an already running container
If the container is already running in the background (detached mode), use:
docker attach <container_name_or_id>

```
 To detach safely (without stopping the container):  
 Press Ctrl + P followed by Ctrl + Q  
```

---
