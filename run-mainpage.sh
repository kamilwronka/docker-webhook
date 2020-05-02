REPO_NAME=$1;
IMAGE_TAG=$2;
IMAGE_NAME=$3;

sudo docker pull $REPO_NAME:$IMAGE_TAG
sudo docker stop $MAINPAGE
sudo docker rm $MAINPAGE
sudo docker run --name=$MAINPAGE --network=$CSGOED_NETWORK -d -e MAINPAGE_API_URL=$MAINPAGE_API_URL -e MAINPAGE_PORT=$MAINPAGE_PORT kamilwronka7/csgoed-mainpage