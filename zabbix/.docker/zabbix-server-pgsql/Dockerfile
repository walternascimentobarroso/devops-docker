# Image and version
FROM zabbix/zabbix-server-pgsql:6.0-alpine-latest

# Set user for install dependencies
USER root

# Install dependencies and cleanup
RUN apk update \
    && apk add --no-cache dpkg wget zabbix-agent \
    && wget -O /tmp/zabbix-release.deb https://repo.zabbix.com/zabbix/6.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_latest%2Bubuntu22.04_all.deb \
    && dpkg -i /tmp/zabbix-release.deb \
    && rm -f /tmp/zabbix-release.deb \
    && rm -rf /var/cache/apk/*

# Clean up unnecessary files
RUN rm -f /tmp/zabbix-release.deb

# Configure Zabbix agent
RUN cd /etc/zabbix/ \
    && mv zabbix_agentd.conf zabbix_agentd.conf.original \
    && echo "##### Zabbix Agent #####" >> zabbix_agentd.conf \
    && cat zabbix_agentd.conf.original | grep -Ev '^#|^$' >> zabbix_agentd.conf \
    && sed -i 's/127.0.0.1/zabbix-server/g' zabbix_agentd.conf \
    && sed -i 's/Hostname=Zabbix server/Hostname=zabbix-server/g' zabbix_agentd.conf \
    && echo "Timeout=15" >> zabbix_agentd.conf \
    && echo "DebugLevel=3" >> zabbix_agentd.conf