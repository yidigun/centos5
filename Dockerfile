FROM        centos:5.11
LABEL       "maintainer"="Daekyu Lee <dklee@yidigun.com>" \
            "version"="5.11" \
            "description"="CentOS 5.11 (yum repo set to http://vault.centos.org/5.11/)"

RUN         sed -i -e 's/^#baseurl=/baseurl=/' \
                   -e 's/^mirrorlist=/#mirrorlist=/' \
                   -e 's!http://mirror.centos.org/centos/$releasever/!http://vault.centos.org/5.11/!' \
                /etc/yum.repos.d/*.repo && \
            sed -i -e 's/enabled=1/enabled=0/' \
                /etc/yum.repos.d/libselinux.repo /etc/yum/pluginconf.d/fastestmirror.conf && \
            rpm -ivh --nodeps http://vault.centos.org/5.11/os/x86_64/CentOS/libselinux-python-1.33.4-5.7.el5.x86_64.rpm && \
            yum -y install sudo curl.x86_64 && \
            yum -y clean all
