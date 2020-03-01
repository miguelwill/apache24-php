FROM php:5.3.29-apache

LABEL maintainer "miguelwill@gmail.com"
ENV DEBIAN_FRONTEND noninteractive

COPY apache2.conf /etc/apache2/apache2.conf

RUN a2enmod rewrite ssl

RUN apt-get update && apt install -y --force-yes postfix mysql-client --no-install-recommends && rm -r /var/lib/apt/lists/*

#Expose ports for services
EXPOSE 80/tcp 443/tcp

WORKDIR /

COPY main.sh /

ENTRYPOINT ["/main.sh"]
CMD ["DEFAULT"]
