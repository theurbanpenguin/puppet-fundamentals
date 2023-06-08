cd
wget https://apt.puppet.com/puppet-tools-release-bionic.deb
sudo dpkg -i puppet-tools-release-focal.deb
sudo apt-get update
sudo apt-get install -y puppet-bolt
mkdir test
cd test
bolt project init test
bolt task show
bolt plan show
ls -la
mkdir -p modules/agent/{plans,files}
tree modules