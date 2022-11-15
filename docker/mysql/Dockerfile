FROM mysql:5.7
# Shell por defecto /bin/bash
SHELL ["/bin/bash", "-c"]
# Change hour
RUN cp /usr/share/zoneinfo/Europe/Madrid /etc/localtime
RUN echo "Europe/Madrid" > /etc/timezone
# Copiado de scripts para autolanzamiento
# ADD ./scripts /docker-entrypoint-initdb.d/
# RUN chmod a+x /docker-entrypoint-initdb.d/*.sh

WORKDIR /var/www
