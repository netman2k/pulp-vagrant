# -*- mode: ruby -*-
# vi: set ft=ruby :
MEMORY="2048"

if Gem::Version.new(::Vagrant::VERSION) < Gem::Version.new('1.5')
  Vagrant.require_plugin('vagrant-hostmanager')
end

Vagrant.configure('2') do |config|

  if ENV.key? 'VAGRANT_BOX'
    config.vm.box = ENV['VAGRANT_BOX']
  else
    config.vm.box = 'centos/7'
  end

  config.vm.provision "shell", path: "init.sh"
  
  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true
  config.hostmanager.manage_guest = true

  config.vm.define :pulp do |server|
    server.vm.hostname = 'pulp'
    server.vm.network :private_network, :ip => '192.168.1.21'
    server.hostmanager.aliases = %w(master)
    server.vm.provider "virtualbox" do |vb|
      vb.memory = MEMORY
    end
  end
  config.vm.define :node1 do |server|
    server.vm.hostname = 'node1'
    server.vm.network :private_network, :ip => '192.168.1.22'
#    server.vm.provider "virtualbox" do |vb|
#      vb.memory = MEMORY
#    end
  end
  config.vm.define :node2 do |server|
    server.vm.hostname = 'node2'
    server.vm.network :private_network, :ip => '192.168.1.23'
#    server.vm.provider "virtualbox" do |vb|
#      vb.memory = MEMORY
#    end
  end
end
