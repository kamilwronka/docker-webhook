REPO_NAME=$1;
IMAGE_TAG=$2;
IMAGE_NAME=$3;

sudo docker pull $REPO_NAME:$IMAGE_TAG
sudo docker stop $REPO_NAME
sudo docker rm $REPO_NAME
sudo docker run --network host --name $IMAGE_NAME -d -p 80:80 $REPO_NAME