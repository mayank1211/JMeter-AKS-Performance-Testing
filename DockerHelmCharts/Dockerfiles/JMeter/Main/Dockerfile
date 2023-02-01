ARG JMETER_VERSION=5.5

FROM mayank1211/jmeter-base:$JMETER_VERSION
LABEL maintainer="mayank.patel1211.mp@gmail.com"

ENV SSL_DISABLED false
ENV WORKER_SVC_NAME jmeter-worker

ENV TESTS_DIR /tests
ENV SLEEP 5
ENV USE_WORKERS false

RUN apt-get update

COPY jmeter.properties /opt/apache-jmeter-$JMETER_VERSION/bin/

EXPOSE 60000