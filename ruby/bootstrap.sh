## Use the closest mirror
sudo sed -i "s/http:\/\/us.archive.ubuntu.com\/ubuntu\//mirror:\/\/mirrors.ubuntu.com\/mirrors.txt/g" /etc/apt/sources.list

#Proxy aware
#If need proxy create a file "proxy.config", with the proxy value
#with a valid URI:
#  * http://user:pass@ip:port
#  * http://user@ip:port
#  * http://ip:port
#A easy way to do it with command line
# echo "http://192.168.1.100:8088" > proxy.config

if [ ! -z $1 ]; then

  BASH_FILE=/home/vagrant/.bashrc
  proxy=$1
  echo "Configuring proxy: $proxy"
  if [[ ! -z $proxy   ]]; then
      ## First, the bash environment variable
      echo "export http_proxy=$proxy" >> $BASH_FILE
      echo "export https_proxy=$proxy" >> $BASH_FILE
      ## Config the apt file for the apt-get update
      echo "Acquire::http::proxy \"$proxy\";" >> /etc/apt/apt.conf
      echo "Acquire::https::proxy \"$proxy\";" >> /etc/apt/apt.conf
  fi
fi

## Update the ubuntu/devian box
sudo apt-get update
sudo apt-get install build-essential  -y

## uncomment these line for the lastest ruby version via rvm
#sudo apt-get install curl -y
#curl -L https://get.rvm.io | bash -s stable --ruby

