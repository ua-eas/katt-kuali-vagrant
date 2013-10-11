#!/usr/bin/env bash

# ======================== Install some prerequisites ======================= #

#yum -y install gcc libyaml libyaml-devel zlib-devel libtool wget

yum -y install gcc openssl openssl-devel zlib-devel libtool wget

# wget http://pyyaml.org/download/libyaml/yaml-0.1.4.tar.gz
# tar xzvf yaml-0.1.4.tar.gz
# cd yaml-0.1.4
# ./configure --prefix=/usr/local
# make
# make install

yum clean all

chown -R kualiadm:kuali /var/opt/kuali 

#create a mock kfs work directory
mkdir -p /mosaic/data/uazkf/dev
chmod 777 /mosaic/data/uazkf/dev

#Add ksi profile.sh to kualiadm user
echo ". /etc/opt/kuali/__control__/profile.sh" >> /home/kualiadm/.bash_profile

#Make sure this user has the ability to ssh to the box
su - kualiadm -c 'touch /home/kualiadm/.ssh/authorized_keys'
su - kualiadm -c 'curl https://github.com/joshuofa.keys >> ~/.ssh/authorized_keys'


# ============================ KSI ========================================== #

#Clone KSI

# ### JOSH TMP COMMENT OUT TO NOT CHECKOUT KSI
# echo 'Cloning ksi from github'
# su - kualiadm -c 'cd $HOME; git clone https://github.com/ua-eas/ksi.git'

# #Checkout the development branch... change this to use a different
# #ksi feature branch if you want to test ksi
# echo 'Checking out development branch of ksi'
# su - kualiadm -c 'cd $HOME/ksi; git checkout development'

# echo 'Installing JDK'
# su - kualiadm -c 'cd $HOME/ksi; ./ksi.sh -s kuali -e dev -c jdk -v 1.6.0_37 -i 3 -a install 2>&1 | tee ksi.log'
# su - kualiadm -c 'cd $HOME/ksi; mv ksi.log /opt/kuali/__build__/logs/jdk/install.jdk-1.6.0_37.log'

# echo 'Installing Oracle Client'
# su - kualiadm -c 'cd $HOME/ksi; ./ksi.sh -s kuali -e dev -c oraclient -v 11.2.0.3 -i 4 -a install 2>&1 | tee ksi.log'
# su - kualiadm -c 'cd $HOME/ksi; mv ksi.log /opt/kuali/__build__/logs/oraclient/install.oraclient-11.2.0.3.log'

# echo 'Installing Tomcat'
# su - kualiadm -c 'cd $HOME/ksi; ./ksi.sh -s kuali -e dev -c tomcat -v 7.0.32 -i 5 -a install 2>&1 |tee ksi.log'
# su - kualiadm -c 'cd $HOME/ksi; mv ksi.log /opt/kuali/__build__/logs/tomcat/install.tomcat-7.0.32.log'

# echo 'Installing Tomcat settings for KC'
# su - kualiadm -c 'cd $HOME/ksi; ./ksi.sh -s kuali -e dev -c tomcat -v 7.0.32 -i 5 -a mkinst kc 2>&1 |tee ksi.log'
# su - kualiadm -c 'cd $HOME/ksi; mv ksi.log /opt/kuali/__build__/logs/tomcat/mkinst.tomcat_kc-7.0.32.log'

# echo 'Installing Tomcat settings for KFS'
# su - kualiadm -c 'cd $HOME/ksi; ./ksi.sh -s kuali -e dev -c tomcat -v 7.0.32 -i 5 -a mkinst kfs 2>&1 |tee ksi.log'
# su - kualiadm -c 'cd $HOME/ksi; mv ksi.log /opt/kuali/__build__/logs/tomcat/mkinst.tomcat_kfs-7.0.32.log'

# echo "Add the ksi profile.sh to kualiadm's .bash_profile"
# su - kualiadm -c 'echo ". /etc/opt/kuali/__control__/profile.sh" >> $HOME/.bash_profile'

# -- Ruby and Rhubarb -- #
echo "Installing Ruby 1.9.3-p194"
# su - kualiadm -c 'cd $HOME/ksi; ./ksi.sh -s kuali -e dev -c ruby -v 1.9.3-p194 -i 3 -a install 2>&1 |tee ksi.log'
# su - kualiadm -c 'cd $HOME/ksi; mv ksi.log /opt/kuali/__build__/logs/ruby/install.ruby-1.9.3-p194.log'

# echo 'Installing bundler gem'
# su - kualiadm -c 'gem install bundler'

# #### END JOSH TMP COMMENT OUT

# -- Rhubarb -- #

#Note, Rhubarb should now be installed on your local machine. See the RHUBARB_HOME env variable in the Vagrantfile
# echo 'Cloning rhubarb from github'
# su - kualiadm -c 'cd /opt/kuali; git clone https://github.com/ua-eas/katt-kfs-rhubarb.git rhubarb'

#Checkout the development branch... change this to use a different
#rhubarb feature branch if you want to test rhubarb
# echo 'Checking out development branch of rhubarb'
# su - kualiadm -c 'cd /opt/kuali/rhubarb; git checkout development'

# echo 'Installing all requisite gems (listed in Gemfile) for rhubarb'
# su - kualiadm -c 'cd /opt/kuali/rhubarb; bundler install'

# #Make sure BATCH_HOME and the kfs work directory are linked
# mkdir -p /mosaic/data/uazkf/dev
# chmod -R 777 /mosaic/data
# ln -s /home/kualiadm/env/kfs/opt/work/dev/kfs /mosaic/data/uazkf/dev

# TODO: Add this user's rsa public key to the authorized keys for rhubarb/capistrano local deployment
# http://www.capistranorb.com/documentation/getting-started/authentication-and-authorisation/
# This can be grabbed with CURL or WGET from github. We just need to check here what the github user is. We can set
# an environment variable for this. Or if the env variable does not exist, ask for it from the user at this point.

echo 'Setting up kbatch user to use rhubarb'
su - kbatch -c 'echo "export BATCH_HOME=/mosaic/data/uazkf/dev/" >> $HOME/.bashrc'
su - kbatch -c 'echo "PATH=$PATH:/opt/kuali/rhubarb/bin" >> $HOME/.bash_profile'
su - kbatch -c 'echo ". /etc/opt/kuali/__control__/profile.sh" >> $HOME/.bash_profile'

echo 'Check that kbatch is setup properly'
echo 'kbatch should use ruby in /opt/kuali/ruby'
su - kbatch -c 'which ruby'
echo 'kbatch should report a 1.9.3 ruby.'
su - kbatch -c 'ruby -v'
echo 'kbatch should understand the batch_log command.'
su - kbatch -c 'which batch_log'


# ============================ End KSI ========================================== #


# ========= Some after the fact tweaks because this is not a deployed environment ===== #
#Not sure why the local maven build for KC does not include the jdbc jar.. This is a 
#hack for now until I can figure out the maven local build stuff.
cp /home/kualiadm/env/kc/drivers/ojdbc14.jar /var/opt/kuali/tomcat/kc/lib/

# overwrite the hosts file that comes with the image
mv /etc/hosts /etc/hosts.orig
cp /vagrant/app-server/hosts /etc/hosts

# replace the ksi generated server.xml.. the proxy and secure settings will be wrong. 
# Note: If testing ksi, you will need to check the server.xml.ksi instead of server.xml
#       to make sure ksi created that file properly.
mv /var/opt/kuali/tomcat/kc/conf/server.xml /var/opt/kuali/tomcat/kc/conf/server.xml.ksi
cp /vagrant/app-server/local-server.xml /var/opt/kuali/tomcat/kc/conf/server.xml

# Copy the kfs-build.properties file into kualiadm's $HOME
su - kualiadm -c 'cp /home/kualiadm/env/kfs/config/* /home/kualiadm/'