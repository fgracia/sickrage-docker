FROM debian:jessie

MAINTAINER Frederic GRACIA <gracia.frederic@gmail.com>

# Installing packages
RUN apt-get update && \
    apt-get install -y \
    python \
    python-pip \
    python-dev \
    libffi-dev \
    libssl-dev \
    python-cheetah \
    git-core \
    wget \
    unrar-free

# Cleaning APT cache
RUN apt-get clean

WORKDIR /root

# Creating data directory (for future app config files)
RUN mkdir /data

# App installation
ADD tmp /opt/SickRage

# Copying startup script
COPY ./startup.sh /startup.sh
RUN chmod +x /startup.sh

# Exposing app port
EXPOSE 8081

# Running app
CMD ["/startup.sh"]
