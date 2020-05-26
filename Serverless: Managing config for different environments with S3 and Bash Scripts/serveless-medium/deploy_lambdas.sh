#!/bin/sh
env=$1

#Safety Checks
if [ -z "$env" ] || ([ "$env" != "dev" ] && [ "$env" != "staging" ])
then
      echo "Please provide arguments: Usage: ./lambda-deploy.sh [ENV_TO_DEPLOY]"
      echo "Supported environments: dev / staging"
      exit 1
fi

echo "Deployment started for enviromment: " $env

#Creating necessary variables
fileName="env.${env}.json"
sourceLocation="s3://serverless-medium-creds/${fileName}"

# Downloading the config file from S3
echo "downloading file from s3"
aws s3 cp $sourceLocation $fileName

#Deploying the lambdas via serverless
echo "Deploying Lambdas"
serverless deploy --stage $env
echo "Lambdas deployed"

#Once done, we should delete the config file from local
echo "deleting config file from local"
rm $fileName


echo "Deployment complete for environment: " $env
exit 0
