REPO_NAME=$1;
IMAGE_TAG=$2;
IMAGE_NAME=$3;

sudo docker pull $REPO_NAME:$IMAGE_TAG
sudo docker stop $CMS
sudo docker rm $CMS
sudo docker run --name=$CMS --network $CSGOED_NETWORK -d -e CMS_DATABASE_HOST=$CMS_DATABASE_HOST -e CMS_DATABASE_PORT=$CMS_DATABASE_PORT -e CMS_DATABASE_NAME=$CMS_DATABASE_NAME -e CMS_HOST=$CMS_HOST -e CMS_PORT=$CMS_PORT kamilwronka7/csgoed-mainpage-cms