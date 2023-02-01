ARG JMETER_VERSION=5.5

FROM mayank1211/jmeter-base:$JMETER_VERSION
LABEL maintainer="mayank.patel1211.mp@gmail.com"

ENV SSL_DISABLED false

EXPOSE 1099 50000

ENTRYPOINT $JMETER_HOME/bin/jmeter-server \
    -Dserver.rmi.localport=50000 \
    -Dserver_port=1099 \
    -Jserver.rmi.ssl.disable=true