from ftplib import FTP
ftp = FTP('localhost')
ftp.login('ftp', '')
ftp.sendcmd('noop')
