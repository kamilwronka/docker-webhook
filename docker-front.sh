sudo docker pull kamilwronka7/mmorpg-frontend:latest
sudo docker stop mmorpg-frontend
sudo docker rm mmorpg-frontend
sudo docker run --network host --name mmorpg-frontend -d -p 80:80 kamilwronka7/mmorpg-frontend