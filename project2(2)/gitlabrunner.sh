#! /bin/bash

sudo apt-get update
sudo apt-get install -y curl
curl -L https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh | sudo bash
sudo apt-get install -y gitlab-runner 
sudo gitlab-runner register
sudo systemctl start gitlab-runner
sudo systemctl enable gitlab-runner
