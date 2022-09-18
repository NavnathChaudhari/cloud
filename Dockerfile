FROM centos:latest
MAINTAINER cnavnath36@gmail.com
RUN yum install httpd -y \
  zip \
 unzip \
ADD https://www.free-css.com/assets/files/free-css-templates/download/page283/moto.zip /var/www/html/
WORKDIR /var/www/html
RUN unzip kindle.zip
RUN cp -rvf markups-kindle/* .
RUN rm -rf _MACOSX markups-kindle kindle.zip 
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
