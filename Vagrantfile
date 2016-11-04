# -*- mode: ruby -*-
# vi: set ft=ruby :

$script = <<SCRIPT
echo "Doing provisioning..."
sudo apt-get update
sudo apt-get -y install clang libicu-dev libpython2.7-dev

wget -q https://swift.org/builds/swift-3.0.1-release/ubuntu1604/swift-3.0.1-RELEASE/swift-3.0.1-RELEASE-ubuntu16.04.tar.gz
wget -q https://swift.org/builds/swift-3.0.1-release/ubuntu1604/swift-3.0.1-RELEASE/swift-3.0.1-RELEASE-ubuntu16.04.tar.gz.sig

wget -q -O - https://swift.org/keys/all-keys.asc | gpg --import -
gpg --keyserver hkp://pool.sks-keyservers.net --refresh-keys Swift
gpg --verify swift-3.0.1-RELEASE-ubuntu16.04.tar.gz.sig || exit 1

tar xzf swift-3.0.1-RELEASE-ubuntu16.04.tar.gz
echo "export PATH=`pwd`/swift-3.0.1-RELEASE-ubuntu16.04/usr/bin:${PATH}" > .profile
. .profile
swift --version || exit 1
date > /etc/vagrant_provisioned_at
echo "Done privisioning :)"
SCRIPT

Vagrant.configure(2) do |config|
    config.vm.box = "ubuntu/xenial64"
    #config.vm.network "forwarded_port", guest: 20080, host: 20080
    config.vm.provider "virtualbox" do |vb|
        vb.gui = false
        vb.memory = "2048"
    end
    config.vm.provision "shell", inline: $script
end
