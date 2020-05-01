REPO_NAME=$1;
IMAGE_TAG=$2;
IMAGE_NAME=$3;

sudo docker pull $REPO_NAME:$IMAGE_TAG
sudo docker stop csgoed-mainpage-cms
sudo docker rm csgoed-mainpage-cms
sudo docker run --name=csgoed-mainpage-cms --network $CSGOED_NETWORK -d -p $CMS_PORT:$CMS_PORT -e CMS_DATABASE_HOST=$CMS_DATABASE_HOST -e CMS_DATABASE_PORT=$CMS_DATABASE_PORT -e CMS_DATABASE_NAME=$CMS_DATABASE_NAME -e CMS_HOST=$CMS_HOST -e CMS_PORT=$CMS_PORT $REPO_NAME