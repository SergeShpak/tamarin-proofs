container_name=tamarin
additional_params=
if [ $# -ge 1 ]; then
    additional_params=$*
fi
docker run -d -P --name $container_name $additional_params tamarin-ssh
