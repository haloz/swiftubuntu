# swiftubuntu
a vagrantbox Vagrantfile to install a swift development environment on an ubuntu VM.

## versions
* ubuntu 16.04 (from box ubuntu/xenial64)
* swift 3.0.2 (from Apple's binaries page)

## setup
* install Virtualbox and Vagrant
* git clone this repository
* browse to the directory you cloned into and do a ```vagrant up```

## caveats
* permission setting tend to now work, try setting them again: ```sudo chown -R ubuntu:ubuntu /home/ubuntu/*```
* after installation, downloads and updates are done connect to the box using ```vagrant ssh```
* you can now run the swift compiler by just typing ```swift```
* I also right away installed exercism: as binary under '~/exercism'. Just run ```exercism```
