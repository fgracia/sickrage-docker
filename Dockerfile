FROM debian:wheezy

MAINTAINER Frederic GRACIA <gracia.frederic@gmail.com>

RUN apt-get update && \
	apt-get install -y python \
	python-dev \ 
	libffi-dev \
	libssl-dev \
	python-cheetah \
	git-core \
	wget
RUN apt-get clean

WORKDIR /root
RUN wget https://bootstrap.pypa.io/get-pip.py
RUN python get-pip.py

RUN wget https://bitbucket.org/pypa/setuptools/raw/bootstrap/ez_setup.py
RUN python2 ez_setup.py
RUN pip install --upgrade ndg-httpsclient pyasn1 cffi cryptography pycparser

WORKDIR /opt
RUN git clone https://github.com/SiCKRAGETV/SickRage.git

COPY ./startup.sh /startup.sh
RUN chmod +x /startup.sh

EXPOSE 8081

VOLUME ["/opt/SickRage", "/data"]

CMD ["/startup.sh"]
