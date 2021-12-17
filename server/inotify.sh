#!/usr/bin/env bash

inotifywait -e close_write,delete -msrq --exclude ".repodata|.olddata|repodata" "/var/www/repo" | while read events
do
        touch /tmp/need_update
done

