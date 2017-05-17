FROM debian:latest
MAINTAINER Jason McGillivray (mcgillivray.jason@gmail.com)
add . /opt/quake2
RUN useradd -m -s /bin/bash quake2 \
  && chown -R quake2:quake2 /opt/quake2 \
  && apt-get update \
  && apt-get install wget -y \
  && wget http://skuller.net/q2pro/nightly/q2pro-server_linux_amd64.tar.gz -O- | tar zxvf - -C /opt/quake2
expose 27910
workdir /opt/quake2
user quake2
CMD ./q2proded +exec server.cfg +set dedicated 1 +set deathmatch 1
