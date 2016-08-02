FROM ubuntu:14.04
RUN apt-get update && apt-get install -y build-essential
RUN apt-get -y install python2.7
RUN apt-get -y install ftp
RUN mkdir /usr/share/empty
RUN mkdir /var/ftp/
RUN useradd -d /var/ftp ftp
RUN chown root.root /var/ftp
RUN chmod og-w /var/ftp

COPY vsftpd-3.0.3 /home

RUN mkdir /usr/local/sbin/vsftpd
RUN mkdir /usr/local/man/man5
RUN mkdir /usr/local/man/man8

RUN make -C /home/
RUN make install -C /home/
RUN cp /home/vsftpd.conf /etc/

ENTRYPOINT ["/usr/local/sbin/vsftpd/vsftpd"]
