container_name=tamarin
if [ $# -ge 1 ]; then
    container_name=$1
fi

port=$(sudo docker port $container_name | cut -d ':' -f 2)
ssh -L 3001:localhost:3001 root@localhost -p $port
