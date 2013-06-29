# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "kuali_box"

  #use the kualiadm user by default
  config.ssh.username = "kualiadm"

  #build the kuali environment
  config.vm.provision :shell, :path => "bootstrap.sh"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  config.vm.box_url = "http://uaz-kf-a09.mosaic.arizona.edu:8008/vagrant/kuali-rh6.4-64.box"

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  config.vm.network :forwarded_port, guest: 8216, host: 8181 # KC http port
  config.vm.network :forwarded_port, guest: 8206, host: 8080 # KFS http port

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  config.vm.synced_folder ENV['KFS_TARGET_WEBROOT'], "/var/opt/kuali/tomcat/kfs/webapps/kfs-dev"
  config.vm.synced_folder ENV['KFS_WORK'], "/home/kualiadm/env/kfs/opt/work/dev/kfs"
  config.vm.synced_folder ENV['KFS_CONFIG'], "/home/kualiadm/env/kfs/config"
  config.vm.synced_folder ENV['KC_TARGET_WEBROOT'], "/var/opt/kuali/tomcat/kc/webapps/kc-dev"
  config.vm.synced_folder ENV['KC_CONFIG'], "/home/kualiadm/kuali/main/dev"
  config.vm.synced_folder ENV['KC_DRIVERS'], "/home/kualiadm/env/kc/drivers"
  config.vm.synced_folder ENV['RHUBARB_HOME'], "/opt/kuali/rhubarb"

end