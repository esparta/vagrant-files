sudo -E gem install jekyll
FPORT="config.vm.network \"forwarded_port\", guest:4000, host: 4000, auto_corret: true"
sed -i "s/#<jekyll>/$FPORT/g" /vagrant/Vagrantfile

