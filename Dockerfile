FROM registry.access.redhat.com/ubi8:latest

ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en'

RUN dnf update  \
  && dnf install -y java-17-openjdk-devel \
  && dnf install -y git maven rsync \
  && dnf clean all \
  && git --version \
  && curl --version \
  && mvn --version \
  && rsync --version \
  && update-alternatives --set java /usr/lib/jvm/java-17-openjdk-17.0.8.0.7-2.el8.x86_64/bin/java \
  && java --version  \
    # maven installed via dnf defaults to OpenJDK 8
    # && java --version \