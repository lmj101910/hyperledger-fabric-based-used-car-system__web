cd ./basic-network

./teardown.sh

./start.sh
./install-cc.sh
./start-ca.sh

cd ../application/server

node server.js