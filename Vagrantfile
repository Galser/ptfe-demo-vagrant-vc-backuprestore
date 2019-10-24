# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "galser/bionic64-for-ptfe"
  config.vm.hostname = "ptfe-dvc"
  config.vm.network "private_network", ip: "192.168.56.22"
  
  config.vm.provision "file", source: "delete_all.sh", destination: "$HOME/delete_all.sh"

  config.vm.provider "virtualbox" do |v|
    v.name = "ptfe-demo-validcert" # for VirtualBoix identification
    v.memory = 4096
    v.cpus = 2    
  end  

end
