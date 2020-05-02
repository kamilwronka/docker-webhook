REPO_NAME=$1;
IMAGE_TAG=$2;
IMAGE_NAME=$3;

sudo docker pull $REPO_NAME:$IMAGE_TAG
sudo docker stop $FRONTEND
sudo docker rm $FRONTEND
sudo docker run --name=$FRONTEND --network $CSGOED_NETWORK -dit kamilwronka7/csgoed-frontend