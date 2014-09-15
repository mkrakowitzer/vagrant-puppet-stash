vagrant-puppet-stash
===================

Vagrant example on installing stash using puppet

Example
-------
```sh
$ git clone https://github.com/mkrakowitzer/vagrant-puppet-stash.git
$ cd vagrant-puppet-stash
$ sudo gem install librarian-puppet --verbose
$ librarian-puppet install
$ wget -O files/atlassian-stash-3.2.4.tar.gz \
  http://www.atlassian.com/software/stash/downloads/binary/atlassian-stash-3.2.4.tar.gz
```
Download jdk-7u65-linux-x64.tar.gz from here and copy into files directory:

http://www.oracle.com/technetwork/java/javase/downloads/jdk7-downloads-1880260.html
 
```sh
vagrant up stash1 (CentOS 6) (http://192.168.33.10)
vagrant up stash2 (CentOS 5) (http://192.168.33.11)
vagrant up stash3 (Ubuntu 12.04) (http://192.168.33.12)
```

License
-------
The MIT License (MIT)

Author
------------
* Merritt Krakowitzer merritt@krakowitzer.com
