# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  config.vm.box = "base"
  config.vm.forward_port "http", 80, 8080
  config.vm.customize do |vm|
    vm.memory_size = 256
  end

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "deploy/cookbooks"
    chef.add_recipe "vim.io::default"
  end
end
