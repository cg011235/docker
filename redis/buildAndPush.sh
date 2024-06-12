#!/bin/bash

git_token=$1
[ -z "$git_token" ] && echo "Must specify argument <git_token>" && exit 1
image_name='redis'
git_user='cg011235'
docker_user='cg011235'
tag='latest'

echo "$git_token" | docker login ghcr.io -u ${git_user} --password-stdin
docker build -t ${image_name}:${tag} .
docker tag ${image_name}:${tag} ghcr.io/${git_user}/${image_name}:${tag}
docker push ghcr.io/${git_user}/${image_name}:${tag}

docker login
docker tag ${image_name}:${tag} ${docker_user}/${image_name}:${tag}
docker push ${docker_user}/${image_name}:${tag}
