FROM debian:jessie
MAINTAINER Jahroots "jahroots@gmail.com"

### Install Applications DEBIAN_FRONTEND=noninteractive  --no-install-recommends
RUN apt-get update && apt-get clean
RUN apt-get install -y python-crypto python-pycurl tesseract-ocr git openssh-server supervisor
RUN mkdir -p /var/run/sshd
RUN mkdir -p /var/log/supervisor

### Checkout pyload sources
RUN git clone https://github.com/pyload/pyload.git /opt/pyload

### Add PyLoad Config Dir
ADD pyload /opt/.pyload

### Configure ssh
RUN echo 'root:screencast' |chpasswd

### supervisord.conf
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

VOLUME ["/opt/downloads"]
EXPOSE 22 8000 7227
CMD ["/usr/bin/supervisord","-c","/etc/supervisor/conf.d/supervisord.conf"]
