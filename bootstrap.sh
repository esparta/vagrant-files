# Bootstrap for python3 vagrant provisioning
# it's using Ubuntu 12.04 by default
# config by Espartaco Palma esparta@gmail.com

##firts update 
sudo apt-get update

## minimal config for python3
sudo apt-get install python3 python3-setuptools -y

## Ubuntu 12.04 doesn't have python3-pip
sudo easy_install3 pip

## avoid a warning with distribute
sudo pip install --upgrade distribute
