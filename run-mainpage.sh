REPO_NAME=$1;
IMAGE_TAG=$2;
IMAGE_NAME=$3;

sudo docker pull $REPO_NAME:$IMAGE_TAG
sudo docker stop csgoed-mainpage
sudo docker rm csgoed-mainpage
sudo docker run --network=$CSGOED_NETWORK -p $MAINPAGE_PORT:$MAINPAGE_PORT -d -e MAINPAGE_API_URL=$MAINPAGE_API_URL -e MAINPAGE_PORT=$MAINPAGE_PORT --name=csgoed-mainpage $REPO_NAME