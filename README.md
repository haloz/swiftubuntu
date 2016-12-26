# swiftubuntu
a vagrantbox Vagrantfile to install a swift development environment on an ubuntu VM.

## versions
* ubuntu 16.04 (from box ubuntu/xenial64)
* swift 3.0.2 (from Apple's binaries page)

## setup
* install Virtualbox and Vagrant
* git clone this repository
* browse to the directory you cloned into and do a ```vagrant up```
* after installation, downloads and updates are done connect to the box using ```vagrant ssh```
* you can now run the swift compiler by just typing ```swift```
* I also right away installed exercism: as binary under '~/exercism'. Just run ```exercism```

## caveats
* permission setting tend to now work, try setting them again: ```sudo chown -R ubuntu:ubuntu /home/ubuntu/*```
* you can't use the swift macros for build, test and the package manager (e.g. ```swift package init```) from vagrant's shared folder (mounted to the VM's /vagrant) as you'll run into file lock errors. You can try to find workarounds like rsyncing the directory with another directory or using a nfs or bindfs way of mounting the directory (instead of virtualbox's boxfs).

