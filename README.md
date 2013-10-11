## Synopsis

Kuali Vagrant is a project designed to standardize the developer workstation setup for the kuali applications technical team at the UofA. The plan is to use Vagrant http://www.vagrantup.com/ and KSI https://github.com/ua-eas/ksi to easily deploy local development instances of our Kuali applications while exactly mirroring the deployed environements. 

## Examples

Kuail Vagrant makes it extremely easy to setup a local development environment that exactly (well as close as we can get to exactly) mimics deployment environemnts (PRD, DEV, TST, etc.). With a single command, you can build a complete environment based on KSI.

### Provision a new development environment:

The following command will spin up a new virtualbox vm. It uses the same build scritps we use in the dev, tst, stg, sup, and prd environments so you can be sure this is a close to production as possible.

`$ vagrant up`

### SSH to your vm and start KC or KFS

`$ vagrant ssh`

`[kualiadm@kuali-local ~]$ /etc/opt/kuali/kualictl tomcat_kc start`

`[kualiadm@kuali-local ~]$ /etc/opt/kuali/kualictl tomcat_kfs start`


### Shutdown your development vm:

The following command will shutdown and completely remove the vm from your machine. We can do this because provisioning a new environment is trivial at this point. It also ensures you always have the latest build configuration in your local dev environment.

`$ vagrant destroy`

## Motivation

Some of the major driving forces for this effort are:

1. The current developer workstation setup is tedious and very time consuming. It sometimes takes days of configuration and troubleshooting to get an dev workstation setup.

2. We have seen several issues crop up lately that are hard to track down because we are not replicating the environment our apps are deployed too. Subtle things like different javamail.jar files, different builds of tomcat, and several other factors have made it very hard to replicate and track down issues.

### Installation

Follow [these instructions](https://github.com/ua-eas/katt-kuali-vagrant/wiki/Installation) to get up and running with Kuali Vagrant.

### Override Default Configuration (Optional)

You are able to override several of the default directory locations with environment variables. Here is a list of directory locations you can override:

`$RHUBARB_HOME` - The location where you have the rhubarb project cloned. It defaults to $HOME/code/rhubarb

`$KFS_ECLIPSE_PROJECT` - The location where you have the kfs project checked out. It defaults to $HOME/code/kfs-ecliplse-workspace/kfs

`$KFS_VAGRANT_ENV` - The location where your vagrant environment base directory resides for kfs. It defaults to $HOME/env/vagrant/kfs

`$KFS_VAGRANT_ECONFIG` - The directory that contains your kfs specific configuration (kfs-build.properties, etc.). It defaults to $HOME/env/vagrant/kfs/config

`$KFS_VAGRANT_WORD` - The directory where your KFS work folder (ie. mock P: Drive) resides. Note that this also doubles as the $BATCH_HOME location on your app server virtual machine. It defaults to $HOME/vagrant/kfs/work

`$KC_ECLIPSE_PROJECT` -  The directory where you have the kc_custom-3.1.1 project checked out. It defaults to $HOME/code/kc-eclipse-workspace/kc_custom-3.1.1/

`$KC_VAGRANT_ENV` - The location where your vagrant environment base directory resides for kc. It defaults to $HOME/env/vagrant/kc

`$KC_VAGRANT_CONFIG` - The directory that contains your kc specific configuration (kc-config.xml, kc-security.xml, etc.). It defaults to $HOME/env/vagrant/kc/config

`$KC_VAGRANT_DRIVERS` - The directory that contains your jdbc driver

## Contributors

Josh Shaloo https://github.com/joshuofa

## License

Please see [LICENSE.md](LICENSE.md).