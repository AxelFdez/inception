#! bin/bash

sleep 6

ftp -n -v ftp-server_container<<EOF
	ascii
	user $FTP_USER $FTP_PASS
	prompt
	put adminer.php
	quit
EOF
