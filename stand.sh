#/usr/bin/env bash
status=$1


function ssh_key_generation()
{
	if [ ! -f 'ssh_keys/id_rsa' ]
	then
		echo "Genarate keys pair"
		mkdir ssh_keys
		mkdir server/ssh_keys/
		mkdir client/ssh_keys/
		ssh-keygen -q -t rsa -b 4096 -C "testing" -N "" -f ssh_keys/id_rsa
		cp ssh_keys/* server/ssh_keys/
		cp ssh_keys/* client/ssh_keys/
	fi

}

function start()
{ 
	ssh_key_generation
	echo "Build images"
	docker-compose build
	echo "Start containers"
	docker-compose up -d
}
function stop()
{ 
	echo "Stop containers"
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
