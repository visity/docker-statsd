FROM      node:0.10

RUN       npm install -g statsd@0.7.2

# Setup config
COPY      statsd-config.js /opt/statsd/config.js

EXPOSE    8125/udp

CMD       statsd /opt/statsd/config.js