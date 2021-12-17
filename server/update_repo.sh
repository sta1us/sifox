#!/usr/bin/env bash
echo "update repo start"
while true;
do
        if [ -f /tmp/need_update ]
        then
                rm -f /tmp/need_update
                echo "Update repo"
                /usr/bin/createrepo --update /var/www/repo
        fi
        sleep 1
done
