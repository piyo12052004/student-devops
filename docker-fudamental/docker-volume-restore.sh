docker volume create mongorestore
docker container run --rm --name ubuntubackup --mount "type=bind,source=/Users/khannedy/Developments/Youtube/belajar-docker-dasar/backup,destination=/backup" --mount "type=volume,source=mongodata,destination=/data" ubuntu:latest basg -c "cd /data && tar xvf /backup/backup.tar.gz --strip 1"

buat container untuk database nya 
jalan kan container nya untuk running 