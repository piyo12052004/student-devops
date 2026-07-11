docker network create --driver bridge mongonetwork

docker image pull mongo-express:latest

docker container create --name mongodb --network mongonetwork --env MONGO_INITDB_ROOT_USERNAME=piyo --env MONGO_INITDB_ROOT_PASSWORD=piyo mongo:7.0

docker container create --name mongoexpress --network mongonetwork --publish 8081:8081 ME_CONFIG_MONGODB_URL="mongodb://piyo:piyo@mongodb:27017/" mongo-express:latest

docker container start mongodb

docker container start mongoexpress

docker network disconnect mongonetwork mongodb

docker network connect mongonetwork mongodb