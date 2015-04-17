FROM debian:latest

MAINTAINER Frederic GRACIA <gracia.frederic@gmail.com>

RUN apt-get update
RUN apt-get install -y python
RUN apt-get install -y python-cheetah
RUN apt-get install -y git-core
RUN apt-get clean

WORKDIR /opt
RUN git clone https://github.com/SiCKRAGETV/SickRage.git

ADD ./startup.sh /startup.sh
RUN chmod +x /startup.sh

EXPOSE 8081

VOLUME ["/opt/SickRage", "/data"]

ENTRYPOINT ["/startup.sh"]