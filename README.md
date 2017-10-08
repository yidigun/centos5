# CentOS 5.11 (vault)

Since 31 Mar 2017, CentOS 5 is not supported any more.
If you run a container using ```centos:5``` image, ```yum``` will not work.

### Yum repository

* Disable fastmirror plugin.
* Set ```baseurl``` of repos to http://vault.centos.org/5.11/. (base, extras, updates)

### ```libselinux-python``` packaging bug

it seems ```libselinux-python``` pacakge has a bug.
When install SELinux aware package, ```yum``` will try to install wrong dependancy.
To fix this, I have to install ```libeselinux-python``` package with ```--nodeps```.

```
rpm -ivh --nodeps http://vault.centos.org/5.11/os/x86_64/CentOS/libselinux-python-1.33.4-5.7.el5.`uname -m`.rpm
```

## Usage

Use in command-line.

```
sudo docker run --rm -it yidigun/centos5 /bin/bash
```

Or, replacement for centos:5 in Dockerfile

```
FROM yidigun:centos5
```
