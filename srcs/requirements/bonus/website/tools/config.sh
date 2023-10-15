#! bin/bash

sleep 5

ftp -n -v ftp-server_container<<EOF
	ascii
	user $FTP_USER $FTP_PASS
	prompt
	put index.html
	quit
EOF
