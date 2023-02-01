FROM openjdk:11-jre-slim
LABEL maintainer="mayank.patel1211.mp@gmail.com"

ARG JMETER_VERSION=5.5
# JMETER CMD PLUGIN
ARG CMD_RUNNER_VERSION=2.3
# JMETER InfluxDB Backend Listner
ARG INFLUXDB_BACKEND_LISTENER=2.6
# JMETER Custom Thread Groups MANAGER
ARG CUSTOM_THREAD_GROUP_VERSION=2.9

ENV JMETER_HOME /opt/apache-jmeter-$JMETER_VERSION
ENV PATH $JMETER_HOME/bin:$PATH
ENV HEAP -Xms1g -Xmx3g -XX:MaxMetaspaceSize=256m

RUN apt-get clean && \
    apt-get update && \
    apt-get install --quiet --yes --no-install-recommends unzip curl tar curl vim procps && \
    rm -rf /var/lib/apt/lists/*

# Install Az cli
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash

RUN curl -o $JMETER_HOME.tgz https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-$JMETER_VERSION.tgz -L && \
    tar -xzf $JMETER_HOME.tgz --directory /opt && \
    rm $JMETER_HOME.tgz && \
    curl -o $JMETER_HOME/lib/ext/plugins-manager.jar -L https://jmeter-plugins.org/get/ && \
    curl -o $JMETER_HOME/lib/cmdrunner-${CMD_RUNNER_VERSION}.jar -L https://repo1.maven.org/maven2/kg/apc/cmdrunner/${CMD_RUNNER_VERSION}/cmdrunner-${CMD_RUNNER_VERSION}.jar && \
    curl -o $JMETER_HOME/lib/ext/jmeter-plugins-casutg-${CUSTOM_THREAD_GROUP_VERSION}.jar -L https://repo1.maven.org/maven2/kg/apc/jmeter-plugins-casutg/${CUSTOM_THREAD_GROUP_VERSION}/jmeter-plugins-casutg-${CUSTOM_THREAD_GROUP_VERSION}.jar && \
    curl -o $JMETER_HOME/lib/ext/jmeter-plugin-influxdb2-listener-${INFLUXDB_BACKEND_LISTENER}-all.jar -L https://github.com/mderevyankoaqa/jmeter-influxdb2-listener-plugin/releases/download/v${INFLUXDB_BACKEND_LISTENER}/jmeter-plugin-influxdb2-listener-${INFLUXDB_BACKEND_LISTENER}-all.jar

COPY log4j2.xml /opt/apache-jmeter-$JMETER_VERSION/bin/log4j2.xml
COPY sample.jmx sample.jmx

EXPOSE 60000