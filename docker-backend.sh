sudo docker pull kamilwronka7/mmorpg-backend:latest
sudo docker stop mmorpg-backend
sudo docker rm mmorpg-backend
sudo docker run --network host --name mmorpg-backend -d -p 4000:4000 kamilwronka7/mmorpg-backend