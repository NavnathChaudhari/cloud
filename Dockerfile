FROM centos
MAINTAINER cnavnath36@gmail.com
CMD yum install sed zip unzip -y
CMD yum install unzip -y
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum install httpd -y
RUN yum install unzip -y
ADD https://www.free-css.com/assets/files/free-css-templates/download/page283/moto.zip /var/www/html/
WORKDIR /var/www/html
RUN unzip moto.zip
RUN rm -rf moto.zip
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
