FROM debian:buster-slim
ARG DEBIAN_FRONTEND=noninteractive

# This is a container for minimal chrony module - a Network Time Protocol Server.
#
# Volumes:
#  * /etc/chrony.conf - default configuration file for chronyd
# Exposed ports:
#  * 123 - Network Time Protocol (NTP) - used for time synchronization
# Linux capabilities:
#  * SYS_TIME - Set system clock

LABEL MAINTAINER Karsten Hopp, Red Hat <karsten@redhat.com>

# Enviroment variables
ENV NAME="chronyd" RELEASE=1 ARCH=x86_64 VERSION=0


COPY apt_packages /tmp/apt_packages
COPY fs-add/ /

RUN apt-get update \
    && xargs -a /tmp/apt_packages apt-get install -y \
    && apt-get clean 

# Specify it during `docker run` as parameter: "-p <host_port>:<container_port>"
EXPOSE 123

# VOLUME instruction creates unnamed volume and mounts it to the provided path,
# you can override this behavior by mounting
# a selected host directory into container: "-v <host_directory>:<container_directory>"
VOLUME /etc/chrony.conf:/etc/chrony.conf:ro

# Specify username which will be used during running container
USER 0

# Command which will start service during command `docker run`
ENTRYPOINT ["/usr/local/bin/start_chrony.sh"]


