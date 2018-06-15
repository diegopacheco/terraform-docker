#!/bin/bash

cd /app/
/terraform init
/terraform apply \
  -auto-approve  \
  -input=false
