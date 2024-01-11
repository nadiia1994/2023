#! /bin/bash

sudo apt update
sudo apt install apache2 -y
sudo systemctl start apche2
sudo systemctl enable apache2