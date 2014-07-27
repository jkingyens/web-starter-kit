FROM ubuntu
MAINTAINER jeff.kingyens@gmail.com
RUN apt-get update
RUN apt-get install -y software-properties-common python g++ make
RUN add-apt-repository -y ppa:chris-lea/node.js
RUN echo "deb http://archive.ubuntu.com/ubuntu precise universe" >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y install nodejs
RUN apt-get -y install git
RUN apt-get -y install ruby
RUN apt-get -y install libfreetype6-dev 
RUN apt-get -y install libfontconfig1-dev
RUN gem install sass
RUN npm install -g gulp
ADD package.json /work/
RUN cd work && npm install
ADD . /work
ENV NODE_ENV production
WORKDIR /work
VOLUME /work/dist
CMD gulp build
