docker volume create mongodata

docker container create --name mongovolume --publish 27019:27017 --mount "type=volume,source=mongodata,destination=/data/db" --env MONGO_INITDB_ROOT_USERNAME=piyo --env MONGO_INITDB_ROOT_PASSWORD=piyo mongo:4.4

docker container stop mongovolume