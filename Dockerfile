FROM ubuntu:14.04
MAINTAINER Irek Romaniuk
RUN groupadd -r nodexp \
    && useradd -m -r -g nodexp nodexp
RUN apt-get update \
 && apt-get install -y curl \
 && curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash - \
 && apt-get install -y nodejs \
 && sudo npm install npm -g
#    && sudo npm install -g bower \
#    && curl http://npmjs.org/install.sh | sh \
#    && npm install http-server -g
WORKDIR /home/nodexp
COPY . /home/nodexp
#COPY cmd.sh /
COPY entrypoint.sh /
EXPOSE 8080 3000 3443 8000 8880
USER nodexp
#ONBUILD COPY package.json /home/nodexp
#ONBUILD RUN npm install
#ONBUILD COPY . /home/nodexp
#ENTRYPOINT ["/entrypoint.sh"]
#CMD ["/cmd.sh"]
