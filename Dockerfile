# escape=`

FROM ubuntu:14.04
RUN apt-get update && apt-get install -y build-essential
RUN apt-get install python2.7
RUN apt-get install ftp