FROM ubuntu:18.10
LABEL maintainer="nicolas.boettcher@mail.udp.cl"

RUN sed -i 's/archive/old-releases/g' /etc/apt/sources.list
RUN sed -i '/security/d' /etc/apt/sources.list
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get -yqq update \
    && apt-get clean \
    && apt-get install -yqq python3 python3-pip python3-pyroute2 python3-pycurl pylint3 libjpeg8-dev zlib1g-dev python3-matplotlib python3-libtrace net-tools byobu vim locate git apt-utils 
RUN git clone https://github.com/mami-project/pathspider.git
RUN pip3 install -r pathspider/requirements.txt
RUN pip3 install plot
RUN cd pathspider;python3 setup.py install
CMD /bin/sh

