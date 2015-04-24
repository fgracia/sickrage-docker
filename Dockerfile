FROM debian:wheezy

MAINTAINER Frederic GRACIA <gracia.frederic@gmail.com>

RUN apt-get update && \
	apt-get install -y python \
	python-cheetah \
	git-core
RUN apt-get clean

WORKDIR /opt
RUN git clone https://github.com/SiCKRAGETV/SickRage.git

COPY ./startup.sh /startup.sh
RUN chmod +x /startup.sh

EXPOSE 8081

VOLUME ["/opt/SickRage", "/data"]

CMD ["/startup.sh"]