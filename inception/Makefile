NAME = inception

all: build

setup:
	@ sudo mkdir -p /home/guyar/data
	@ sudo mkdir -p /home/guyar/data/wordpress
	@ sudo mkdir -p /home/guyar/data/database
	@ sudo chmod 777 /etc/hosts
	@ sudo echo "127.0.0.1	guyar.42.fr" >> /etc/hosts
	@ sudo echo "127.0.0.1	www.guyar.42.fr" >> /etc/hosts

build: setup
	@ docker-compose -f srcs/docker-compose.yml up -d --build

up:
	@ docker-compose -f srcs/docker-compose.yml up -d

down:
	@ docker-compose -f srcs/docker-compose.yml down

clean:
	@ docker-compose -f srcs/docker-compose.yml down -v --rmi all --remove-orphans

fclean:	clean
	@ sudo docker system prune --volumes --all --force
	@ sudo rm -rf /home/guyar/data
	@ sudo docker network prune --force
	@ echo docker volume rm $(docker volume ls -q)
	@ sudo docker image prune --force

.PHONY: setup build up down clean fclean all