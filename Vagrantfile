$script = <<-'SCRIPT'
apt install update -y
apt install upgrade -y
apt install httrack -y
mkdir -p ~/stariwebserver
cp /vagrant/makestatic.bash ~/stariwebserver
cp /vagrant/sites ~/stariwebserver
cd ~/stariwebserver && ./makestatic.bash sites
python -m SimpleHTTPServer 8000 &> /dev/null & 
SCRIPT

Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-18.04"
  config.vm.hostname = "gostatic"
  config.vm.network "public_network"
  config.vm.network "forwarded_port", guest: 8000, host: 8085
  config.vm.provision "shell", inline: $script
  config.vm.provider "virtualbox" do |vb|
   vb.cpus = 2
   vb.memory = 2048
   vb.name = "static"
   #vb.gui = true
  end
end
