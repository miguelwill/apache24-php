FROM php:5.3.29-apache

LABEL maintainer "miguelwill@gmail.com"
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt install -y --force-yes postfix mysql-client --no-install-recommends && rm -r /var/lib/apt/lists/*


RUN a2enmod rewrite
#RUN a2enmod ssl
#RUN a2dissite 000-default

#Expose ports for services
EXPOSE 80/tcp 443/tcp

WORKDIR /

COPY main.sh /
COPY apache2.conf /etc/apache2/apache2.conf

ENTRYPOINT ["/main.sh"]
CMD ["DEFAULT"]
