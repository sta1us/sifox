#!/usr/bin/env bash

REPO='/var/www/repo'
LOGLIGE='repo.log'

function create_repo()
{
	if [ ! -f $REPO/repodata/repomd.xml ]
	then
		echo "Create repo"
		/usr/bin/createrepo $REPO
	fi
}

function start()
{
	create_repo
	chown -R sta1us $REPO
	echo "Start repository server:"
	echo "Directory: $REPO"
	echo "Log file: $LOGFILE"
	echo "Start SSH Daemon"
	/usr/sbin/sshd -D &
	cd $REPO
	echo "Start WEB Server"

	sudo -u sta1us /usr/bin/bash /home/sta1us/inotify.sh &
	sudo -u sta1us /usr/bin/bash /home/sta1us/update_repo.sh &

	/usr/bin/python3 -m http.server 80
}

start


