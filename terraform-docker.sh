#!/bin/bash

SHARED=$(pwd)/src/:/app/
ARG0=$2

function bake(){
   docker network create --subnet=119.18.0.0/16 myTFNetDocker
   pip install localstack
   docker build -t diegopacheco/terraformdocker . --network=host
}

function run(){
   #docker run -v $SHARED --rm -ti diegopacheco/terraformdocker /bin/sh -c "cd /app/ && /terraform apply"
   docker run -v $SHARED --net myTFNetDocker --ip 119.18.0.102 --rm -ti diegopacheco/terraformdocker
   sudo rm -rf src/terraform.tfstate
}

function localstack(){
   docker run -it -e LOCALSTACK_HOSTNAME="localhost" -p 8080:8080  \
          --name localstack --rm \
          --net myTFNetDocker --ip 119.18.0.101 \
          -p 443:443 -p 4567-4583:4567-4583 -p 4590-4593:4590-4593 \
          -v "/tmp/localstack:/tmp/localstack" \
          -v "/var/run/docker.sock:/var/run/docker.sock" \
          -e DOCKER_HOST="unix:///var/run/docker.sock" \
          -e HOST_TMP_FOLDER="/tmp/localstack" "localstack/localstack"
}

function help(){
  echo "Terraform-Docker: by Diego Pacheco"
  echo "bake        : bake the docker image"
  echo "run         : run whats inside src/main.tf with terraform apply"
  echo "localstack  : run docker image with localstack a.k.a fake local aws :-)"
}

case $1 in
     "bake")
          bake
          ;;
      "run")
          run
          ;;
      "localstack")
          localstack
          ;;
      *)
          help
esac
