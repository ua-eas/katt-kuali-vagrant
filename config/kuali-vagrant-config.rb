module KualiVagrant  
  module Config  
    DIRECTORIES = {
        :rhubarb_home        => ENV['RHUBARB_HOME']         || "#{ENV['HOME']}/code/rhubarb",
        :ksi_home            => ENV['KSI_HOME']             || "#{ENV['HOME']}/code/ksi",
    	:kfs_eclipse_project => ENV['KFS_ECLIPSE_PROJECT'] 	|| "#{ENV['HOME']}/code/kfs-vagrant-ecliplse-workspace/kfs",
    	:kfs_vagrant_env	 => ENV['KFS_VAGRANT_ENV'] 		|| "#{ENV['HOME']}/env/vagrant/kfs",
    	:kfs_vagrant_config	 => ENV['KFS_VAGRANT_CONFIG'] 	|| "#{ENV['HOME']}/env/vagrant/kfs/config",
    	:kfs_vagrant_work	 => ENV['KFS_VAGRANT_WORK'] 	|| "#{ENV['HOME']}/env/vagrant/kfs/work",
        :kfs_vagrant_work    => ENV['KFS_VAGRANT_WORK']     || "#{ENV['HOME']}/env/vagrant/kfs/servers",
    	:kc_eclipse_project  => ENV['KC_ECLIPSE_PROJECT']	|| "#{ENV['HOME']}/code/kc-eclipse-workspace/kc_custom-3.1.1/",
    	:kc_vagrant_env		 => ENV['KC_VAGRANT_ENV']		|| "#{ENV['HOME']}/env/vagrant/kc",
    	:kc_vagrant_config	 => ENV['KC_VAGRANT_CONFIG']	|| "#{ENV['HOME']}/env/vagrant/kc/config",
    	:kc_vagrant_drivers	 => ENV['KC_VAGRANT_DRIVERS']	|| "#{ENV['HOME']}/env/vagrant/kc/drivers"
    }
  end
end