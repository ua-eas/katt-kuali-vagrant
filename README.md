## Synopsis

Kuali Vagrant is a project designed to standardize the developer workstation setup for the kuali applications technical team at the UofA. The plan is to use Vagrant http://www.vagrantup.com/ and KSI https://github.com/ua-eas/ksi to easily deploy local development instances of our Kuali applications while exactly mirroring the deployed environements. 

## Code Example

Commig soon

## Motivation

Some of the major driving forces for this effort are:

1. The current developer workstation setup is tedious and very time consuming. It sometimes takes days of configuration and troubleshooting to get an dev workstation setup.

2. We have seen several issues crop up lately that are hard to track down because we are not replicating the environment our apps are deployed too. Subtle things like different javamail.jar files, different builds of tomcat, and several other factors have made it very hard to replicate and track down issues.

## Installation

### VirtualBox
This project requires that you have VirtualBox installed. https://www.virtualbox.org/

### Setup KC

#### The local environment

Setup a directory for KC in your $HOME which will contain all of the kc configuration for vagrant.

`mkdir p $HOME/env/kc-vagrant/config`

#### Eclipse

##### Checkout Source



##### web.xml

You need up update the file $KC_ECLIPSE_PROJECT/src/main/webapp/WEB-INF/web.xml in eclipse. By defualt, this web.xml has settings at lines 41 and 53 which redirect to http://localhost:8080 after webauth authentication. You need to change this to http:localhost:8181 as this is how you will access the vagrant application from your local machine. Port 8181 is configured in the Vagrantfile to foreward to 8216 on the vm (the ksi http port for kc).

#### Build

#### Override Default Configuration (Optional)

You are able to override several of the default directory locations with environment variables. Here is a list of directory locations you can override:

`$RHUBARB_HOME` - The location where you have the rhubarb project cloned. It defaults to $HOME/code/rhubarb
`$KFS_ECLIPSE_PROJECT` - The location where you have the kfs project checked out. It defaults to $HOME/code/kfs-ecliplse-workspace/kfs
`$KFS_VAGRANT_ENV` - The location where your vagrant environment base directory resides. It defaults to $HOME/env/vagrant/kfs
`$KFS_VAGRANT_ECONFIG` - The directory that contains your kfs specific configuration (kfs-build.properties, etc.). It defaults to $HOME/env/vagrant/kfs/config
`$KFS_VAGRANT_WORD` - The directory where your KFS work folder (ie. mock P: Drive) resides. Note that this also doubles as the $BATCH_HOME location on your app server virtual machine. It defaults to $HOME/vagrant/kfs/work
`$KC_ECLIPSE_PROJECT` -  The directory where you have the kc_custom-3.1.1 project checked out. It defaults to $HOME/code/kc-eclipse-workspace/kc_custom-3.1.1/
`` - 

#####




## Contributors

Josh Shaloo https://github.com/joshuofa

## License

Please see [LICENSE.md](LICENSE.md).