FROM lucee/lucee5:latest
MAINTAINER Greg Moser, greg.moser@ten24web.com

RUN apt-get update && apt-get install -y uuid-runtime

# Copy over the Lucee Config Files
COPY lucee/lucee-server.xml /opt/lucee/server/lucee-server/context/lucee-server.xml
COPY lucee/lucee-web.xml.cfm /opt/lucee/web/lucee-web.xml.cfm

# Expose Ports
EXPOSE 8888

# Copy the projects www contents over
COPY www /var/www

COPY scripts/entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

CMD ["catalina.sh", "run"]
