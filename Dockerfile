FROM php:5.4.44-apache

LABEL maintainer "miguelwill@gmail.com"

RUN a2enmod rewrite
RUN a2enmod ssl

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt install -y --force-yes postfix --no-install-recommends && rm -r /var/lib/apt/lists/*

COPY apache2.conf /etc/apache2/apache2.conf

#Expose ports for services
EXPOSE 80/tcp 443/tcp


WORKDIR /

COPY main.sh /


ENTRYPOINT ["/main.sh"]
CMD ["DEFAULT"]
