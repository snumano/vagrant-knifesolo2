# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.vm.network :forwarded_port, guest: 80, host: 8080

  src_dir = './sandbox'
  doc_root = '/vagrant_data'
  config.vm.synced_folder src_dir, doc_root

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider :virtualbox do |vb|
  #   # Don't boot with headless mode
  #   vb.gui = true
  #
  #   # Use VBoxManage to customize the VM. For example to change memory:
  #   vb.customize ["modifyvm", :id, "--memory", "1024"]
  # end
  #
  # View the documentation for the provider you're using for more
  # information on available options.

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["./cookbooks", "./site-cookbooks"]

    chef.add_recipe "apt"
    chef.add_recipe "nginx"
    chef.add_recipe "mysql::server"
    chef.add_recipe "mysql"
    chef.add_recipe "database::mysql"
    chef.add_recipe "myapp"

    chef.json = {
      "mysql" => {
        "server_root_password"   => "password",
        "server_repl_password"   => "password",
        "server_debian_password" => "password"
      }
    }
  end
end
