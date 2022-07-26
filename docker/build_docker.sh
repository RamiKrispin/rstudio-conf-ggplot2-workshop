#!/bin/bash

echo "Build the docker"

if [[ $1 = "" ]] ; then
  echo "No tag argument, using default setting"
  tag="rkrispin/ggplot2_workshop:dev.0.0.0.9000"
  echo "Tag was set as $tag"
else
  tag=$1
fi


docker build . --progress=plain -t $tag

if [[ $? = 0 ]] ; then
echo "Pushing docker..."
docker push $tag
else
echo "Docker build failed"
fi