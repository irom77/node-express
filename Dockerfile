FROM node:argon

MAINTAINER Irek Romaniuk

# Create user nodexp in group nodexp
RUN groupadd -r nodexp \
    && useradd -m -r -g nodexp nodexp

WORKDIR /home/nodexp

# Install app dependencies
COPY package.json /home/nodexp
RUN npm install

# Bundle app source
COPY . /home/nodexp

EXPOSE 3000
CMD [ "npm", "start" ]

# $ docker run -p 8080:3000 -d irom77/node
# $ curl -i http://localhost:8080
