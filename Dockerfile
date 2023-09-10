FROM alpine:3.15.4
MAINTAINER Muhammad Ahsan khan

# Install openvpn
RUN apk --no-cache --no-progress upgrade && \
    apk --no-cache --no-progress add bash curl ip6tables iptables openvpn nodejs npm \
                 tini tzdata && \
    addgroup -S vpn && \
    rm -rf /tmp/* && \
    apk add shadow



WORKDIR /app
COPY package*.json ./
COPY . /app
RUN npm -v
RUN npm install --loglevel verbose
EXPOSE 3000
#CMD [ "node", "app.js"]

COPY openvpn.sh /usr/bin/
RUN chmod 755 /usr/bin/openvpn.sh
COPY ./vpn /vpn


HEALTHCHECK --interval=60s --timeout=15s --start-period=120s \
             CMD curl -LSs 'https://api.ipify.org'

VOLUME ["vpn"]

ENTRYPOINT ["/sbin/tini", "--", "/usr/bin/openvpn.sh"]
