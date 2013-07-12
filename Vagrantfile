# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "centos-6.4-puppet"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  config.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/centos-64-x64-vbox4210.box"
  config.vm.hostname = "treasure2013.local"

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network :forwarded_port, guest: 80, host: 8080
  config.vm.network :private_network, ip: "192.168.56.110" 

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network :private_network, ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network :public_network

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider :virtualbox do |vb|
    vb.name = "Treasure2013"
  end

  #   # Don't boot with headless mode
  #   vb.gui = true
  #
  #   # Use VBoxManage to customize the VM. For example to change memory:
  #   vb.customize ["modifyvm", :id, "--memory", "1024"]
  # end
  #
  # View the documentation for the provider you're using for more
  # information on available options.

  # Enable provisioning with Puppet stand alone.  Puppet manifests
  # are contained in a directory path relative to this Vagrantfile.
  # You will need to create the manifests directory and a manifest in
  # the file base.pp in the manifests_path directory.
  #
  # An example Puppet manifest to provision the message of the day:
  #
  # # group { "puppet":
  # #   ensure => "present",
  # # }
  # #
  # # File { owner => 0, group => 0, mode => 0644 }
  # #
  # # file { '/etc/motd':
  # #   content => "Welcome to your Vagrant-built virtual machine!
  # #               Managed by Puppet.\n"
  # # }
  #
  config.vm.provision :puppet, :options => '--modulepath="/vagrant/puppet/modules" --templatedir="/vagrant/puppet/modules/base/templates" --execute "include base"' do |puppet|
     puppet.manifests_path = "./puppet/modules/base/manifests"
     puppet.manifest_file  = "init.pp"
  end
  config.vm.provision :puppet, :options => '--modulepath="/vagrant/puppet/modules" --templatedir="/vagrant/puppet/modules/mysql/templates" --execute "include mysql"' do |puppet|
     puppet.manifests_path = "./puppet/modules/mysql/manifests"
     puppet.manifest_file  = "init.pp"
  end
  config.vm.provision :puppet, :options => '--modulepath="/vagrant/puppet/modules" --templatedir="/vagrant/puppet/modules/php/templates" --execute "include php"' do |puppet|
     puppet.manifests_path = "./puppet/modules/php/manifests"
     puppet.manifest_file  = "init.pp"
  end
  config.vm.provision :puppet, :options => '--modulepath="/vagrant/puppet/modules" --templatedir="/vagrant/puppet/modules/pear/templates" --execute "include pear"' do |puppet|
     puppet.manifests_path = "./puppet/modules/pear/manifests"
     puppet.manifest_file  = "init.pp"
  end
  config.vm.provision :puppet, :options => '--modulepath="/vagrant/puppet/modules" --templatedir="/vagrant/puppet/modules/testrunner/templates" --execute "include testrunner"' do |puppet|
     puppet.manifests_path = "./puppet/modules/testrunner/manifests"
     puppet.manifest_file  = "init.pp"
  end
  config.vm.provision :puppet, :options => '--modulepath="/vagrant/puppet/modules" --templatedir="/vagrant/puppet/modules/demogroup/templates" --execute "include demogroup"' do |puppet|
     puppet.manifests_path = "./puppet/modules/demogroup/manifests"
     puppet.manifest_file  = "init.pp"
  end
  config.vm.provision :puppet, :options => '--modulepath="/vagrant/puppet/modules" --templatedir="/vagrant/puppet/modules/demouser/templates" --execute "include demouser"' do |puppet|
     puppet.manifests_path = "./puppet/modules/demouser/manifests"
     puppet.manifest_file  = "init.pp"
  end
  config.vm.provision :puppet, :options => '--modulepath="/vagrant/puppet/modules" --templatedir="/vagrant/puppet/modules/group-a/templates" --execute "include group-a"' do |puppet|
     puppet.manifests_path = "./puppet/modules/group-a/manifests"
     puppet.manifest_file  = "init.pp"
  end
  config.vm.provision :puppet, :options => '--modulepath="/vagrant/puppet/modules" --templatedir="/vagrant/puppet/modules/group-b/templates" --execute "include group-b"' do |puppet|
     puppet.manifests_path = "./puppet/modules/group-b/manifests"
     puppet.manifest_file  = "init.pp"
  end
  config.vm.provision :puppet, :options => '--modulepath="/vagrant/puppet/modules" --templatedir="/vagrant/puppet/modules/group-c/templates" --execute "include group-c"' do |puppet|
     puppet.manifests_path = "./puppet/modules/group-c/manifests"
     puppet.manifest_file  = "init.pp"
  end
  config.vm.provision :puppet, :options => '--modulepath="/vagrant/puppet/modules" --templatedir="/vagrant/puppet/modules/group-d/templates" --execute "include group-d"' do |puppet|
     puppet.manifests_path = "./puppet/modules/group-d/manifests"
     puppet.manifest_file  = "init.pp"
  end
  config.vm.provision :puppet, :options => '--modulepath="/vagrant/puppet/modules" --templatedir="/vagrant/puppet/modules/group-e/templates" --execute "include group-e"' do |puppet|
     puppet.manifests_path = "./puppet/modules/group-e/manifests"
     puppet.manifest_file  = "init.pp"
  end
  config.vm.provision :puppet, :options => '--modulepath="/vagrant/puppet/modules" --templatedir="/vagrant/puppet/modules/httpd/templates" --execute "include httpd"' do |puppet|
     puppet.manifests_path = "./puppet/modules/httpd/manifests"
     puppet.manifest_file  = "init.pp"
  end
  config.vm.provision :puppet, :options => '--modulepath="/vagrant/puppet/modules" --templatedir="/vagrant/puppet/modules/sshd/templates" --execute "include sshd"' do |puppet|
     puppet.manifests_path = "./puppet/modules/sshd/manifests"
     puppet.manifest_file  = "init.pp"
  end
  config.vm.provision :puppet, :options => '--modulepath="/vagrant/puppet/modules" --templatedir="/vagrant/puppet/modules/iptables/templates" --execute "include iptables"' do |puppet|
     puppet.manifests_path = "./puppet/modules/iptables/manifests"
     puppet.manifest_file  = "init.pp"
  end
  config.vm.provision :puppet, :options => '--modulepath="/vagrant/puppet/modules" --templatedir="/vagrant/puppet/modules/other/templates" --execute "include other"' do |puppet|
     puppet.manifests_path = "./puppet/modules/other/manifests"
     puppet.manifest_file  = "init.pp"
  end

  # Enable provisioning with chef solo, specifying a cookbooks path, roles
  # path, and data_bags path (all relative to this Vagrantfile), and adding
  # some recipes and/or roles.
  #
  # config.vm.provision :chef_solo do |chef|
  #   chef.cookbooks_path = "../my-recipes/cookbooks"
  #   chef.roles_path = "../my-recipes/roles"
  #   chef.data_bags_path = "../my-recipes/data_bags"
  #   chef.add_recipe "mysql"
  #   chef.add_role "web"
  #
  #   # You may also specify custom JSON attributes:
  #   chef.json = { :mysql_password => "foo" }
  # end

  # Enable provisioning with chef server, specifying the chef server URL,
  # and the path to the validation key (relative to this Vagrantfile).
  #
  # The Opscode Platform uses HTTPS. Substitute your organization for
  # ORGNAME in the URL and validation key.
  #
  # If you have your own Chef Server, use the appropriate URL, which may be
  # HTTP instead of HTTPS depending on your configuration. Also change the
  # validation key to validation.pem.
  #
  # config.vm.provision :chef_client do |chef|
  #   chef.chef_server_url = "https://api.opscode.com/organizations/ORGNAME"
  #   chef.validation_key_path = "ORGNAME-validator.pem"
  # end
  #
  # If you're using the Opscode platform, your validator client is
  # ORGNAME-validator, replacing ORGNAME with your organization name.
  #
  # If you have your own Chef Server, the default validation client name is
  # chef-validator, unless you changed the configuration.
  #
  #   chef.validation_client_name = "ORGNAME-validator"
end
