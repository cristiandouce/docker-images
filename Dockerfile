# Ubuntu
#
# VERSION               0.0.1

FROM ubuntu
MAINTAINER C. Douce "cristian@gravityonmars.com"

# Tell dpkg not to ask any questions
ENV DEBIAN_FRONTEND noninteractive

# This forces dpkg not to call sync() after package extraction and speeds up install
RUN echo "force-unsafe-io" > /etc/dpkg/dpkg.cfg.d/02apt-speedup

# We don't need and apt cache in a container
RUN echo "Acquire::http {No-Cache=True;};" > /etc/apt/apt.conf.d/no-cache

# Make sure the package repository is up to date
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe restricted multiverse" > /etc/apt/sources.list
RUN apt-get update

# Install bunch of packages
RUN apt-get -y install curl