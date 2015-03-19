#vagrant rkhunter


Vagrant.configure(2) do |config|


###############################################################################
# Base box                                                                    #
###############################################################################
  config.vm.box = "vStone/centos-6.x-puppet.3.x"

###############################################################################
# Global provisioning settings                                                #
###############################################################################
  config.vm.synced_folder 'hiera', '/var/lib/hiera'

  config.vm.provision "puppet" do |puppet|
    puppet.manifests_path = "puppet/environments/development/manifests/"
    puppet.module_path = "puppet/modules"
    puppet.manifest_file = ""
    puppet.options = "--environment development"
    puppet.hiera_config_path = "puppet/hiera.yaml"
  end

###############################################################################
# VM definitions                                                              #
###############################################################################
    config.ssh.insert_key = false

    config.vm.hostname = "thruk"

  ###                           ATTENTION!!                           ###
  ###forwarded_port and private_network is not needed for rkhunter yet###
  ###they where added to get open port in node to test vm.            ###
    config.vm.network "forwarded_port", guest: 80, host: 8080
    config.vm.network "forwarded_port", guest: 8000, host: 8000

    config.vm.network "private_network", ip: "192.168.33.44"
end
