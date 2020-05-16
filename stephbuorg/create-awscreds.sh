#!/bin/bash

echo AWS_ACCESS_KEY_ID:
read AWS_ACCESS_KEY_ID_IN

echo AWS_SECRET_ACCESS_KEY:
read AWS_SECRET_ACCESS_KEY_IN

echo AWS_HOSTED_ZONE_ID:
read AWS_HOSTED_ZONE_ID_IN

kubectl create secret generic secret-aws \
--from-literal=AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID_IN \
--from-literal=AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY_IN \
--from-literal=AWS_HOSTED_ZONE_ID=$AWS_HOSTED_ZONE_ID_IN \
--output='yaml'