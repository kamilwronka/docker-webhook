REPO_NAME=$1;
IMAGE_TAG=$2;

sudo docker pull kamilwronka7/$REPO_NAME:$IMAGE_TAG
sudo docker stop $REPO_NAME
sudo docker rm $REPO_NAME
sudo docker run --network host --name $REPO_NAME -d -p 4000:4000 kamilwronka7/$REPO_NAME