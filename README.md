Strange Traffic uses an FTP server to send the regular FTP information accross a FTP connection.  The anonymous login credentials for this FTP server are a username of ftp with no password.

# Installation #

copy vsftpd-3.0.3 to the Docker

run the following commands (you may need to use sudo)


```
#!bash

useradd nobody
mkdir /usr/share/empty
mkdir /var/ftp/
useradd -d /var/ftp ftp
chown root.root /var/ftp
chmod og-w /var/ftp
make
make install
cp vsftpd /usr/local/sbin/vsftpd
cp vsftpd.conf.5 /usr/local/man/man5
cp vsftpd.8 /usr/local/man/man8
cp vsftpd.conf /etc
/usr/local/sbin/vsftpd &
```


The FTP server is now running

# Solution #
The flag is sent as a response to a NOOP command.  Some FTP clients will ignore the message sent by the server and display their own.  As such the easiest way to get the flag is with python.  Using the following will get the flag.

```
#!python

from ftplib import FTP
ftp = FTP('localhost')
ftp.login('ftp', '')
ftp.sendcmd('noop')

```

Which will have the following output


'200 The Flag is MCA-5FA6F6EB'

The packet should also be able to be found using Wireshark; however, some FTP clients don't allow for the user to trigger a NOOP command.