#!/bin/bash

if ! gcloud version
then

echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
sudo apt-get install apt-transport-https ca-certificates gnupg
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
sudo apt-get update && sudo apt-get install google-cloud-sdk

fi

if ! gcloud compute instances list
then

gcloud init
gcloud compute instances list

fi

if ! gcloud compute instances list |grep example-instances-3
then

gcloud compute instances create example-farhat-3 --zone=us-central1-a

fi
