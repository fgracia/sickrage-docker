FROM debian:jessie

MAINTAINER Frederic GRACIA <gracia.frederic@gmail.com>

# Configuring APT cacher
RUN sh -c "echo 'Acquire::http { Proxy \"http://aptcacher.cloud.iscfrance.lan.bdx.sqli.com:3142\"; };' > /etc/apt/apt.conf.d/02proxy"

# Installing packages
RUN apt-get update && \
    apt-get install -y build-essential \
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

# Switching to /opt directory for app installation
WORKDIR /opt

# Cloning SickRage repository
RUN git clone https://github.com/SickRage/SickRage.git

# Copying startup script
COPY ./startup.sh /startup.sh
RUN chmod +x /startup.sh

# Exposing app port
EXPOSE 8081

# Running app
CMD ["/startup.sh"]
