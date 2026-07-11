#  /home/jupiter/Documents/backup_data_docker
docker container stop mongovolume

docker container create --name nginxbackup --mount "type=bind,source=/home/jupiter/Documents/backup_data_docker,destination=/backup_data_docker" --mount "type=volume,source=mongodata,destination=/data" nginx:latest
docker container start nginxbackup
docker container exec -i -t nginxbackup /bin/bash
tar cvf /backup_data_docker/backup.tar.gz /data
docker container stop nginxbackup
docker container rm nginxbackup
docker container start mongovolume

docker container run --rm --name ubuntubackup --mount "type=bind,source=/home/jupiter/Documents/backup_data_docker,destination=/backup_data_docker" --mount "type=volume,source=mongodata,destination=/data" ubuntu:latest tar cvf /backup_data_docker/backup.tar.gz /data
docker container start mongovolume