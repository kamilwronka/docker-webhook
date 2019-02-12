sudo docker pull kamilwronka7/mmorpg-game-core-backend:latest
sudo docker stop mmorpg-game-core-backend
sudo docker rm mmorpg-game-core-backend
sudo docker run --network host --name mmorpg-game-core-backend -d -p 4000:4000 kamilwronka7/mmorpg-game-core-backend