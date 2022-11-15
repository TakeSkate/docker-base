FROM nginx:alpine

#Change hour
RUN cp /usr/share/zoneinfo/Europe/Madrid /etc/localtime
RUN echo "Europe/Madrid" > /etc/timezone

WORKDIR /var/www