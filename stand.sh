#/usr/bin/env bash
status=$1


function ssh_key_generation()
{
	if [ ! -f 'ssh_keys/id_rsa' ]
	then
		echo "test"
		mkdir ssh_keys
		ssh-keygen -q -t rsa -b 4096 -C "testing" -N "" -f ssh_keys/id_rsa
		cp ssh_keys/* server/ssh_keys/
		cp ssh_keys/* client/ssh_keys/
	fi

}

function start()
{ 
	ssh_key_generation
	docker-compose build
	docker-compose up -d
}
function stop()
{ 
	docker-compose down
}

if [[ "$status" == "start" ]];
then
	start
fi

if [[ "$status" == "stop" ]];
then
	stop
fi
