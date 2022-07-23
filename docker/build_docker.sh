#!/bin/bash

echo "Build the docker"

docker build . -t rkrispin/ggplot2_workshop:dev.0.0.0.9000

if [[ $? = 0 ]] ; then
echo "Pushing docker..."
docker push rkrispin/ggplot2_workshop:dev.0.0.0.9000
else
echo "Docker build failed"
fi