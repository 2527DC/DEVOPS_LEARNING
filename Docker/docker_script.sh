# /bin/bash

# this is the script to run the containers in the productionh 
# where this will  stop or remove the running container  and pull the updated one 
# and run the container 

DOCKER_REPO=chethan@miroService
docker compose down --rmi all

docker compose up 