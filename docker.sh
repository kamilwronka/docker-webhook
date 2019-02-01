sudo docker pull kamilwronka7/messenger-backend:latest
sudo docker stop messenger-backend
sudo docker rm messenger-backend
sudo docker run --name messenger-backend -d -p 80:4000 kamilwronka7/messenger-backend