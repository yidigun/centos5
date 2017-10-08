# CentOS 5.11 (vault)

CentOS 5 image (docker.io/centos:5) does not suppored any more. (EOL 31 Mar 2017)
So I modify ```/etc/yum.repos.d/CentOS-Base.repo``` to see http://vault.centos.org/5.11/.

And it seems ```libselinux-python``` pacakge has a bug.
When install SELinux aware package, ```yum``` will try to install wrong dependancy.
I fixed this with forced pre-installation of ```libselinux-python.\`uname -m\````.

## Usage

Use in command-line.

```
sudo docker run --rm -it yidigun/centos5 /bin/bash
```

Or, replacement for centos:5 in Dockerfile

```
FROM yidigun:centos5
```
