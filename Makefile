SRCS	=	srcs/docker-compose.yml

all:	up

up:
	mkdir -p /home/tnoulens/data/mariadb
	mkdir -p /home/tnoulens/data/wordpress
	docker-compose -f $(SRCS) up --build -d

down:
	docker-compose -f $(SRCS) down

ps:
	docker-compose -f $(SRCS) ps

top:
	docker-compose -f $(SRCS) top

clean:
	docker stop $$(docker ps -qa);\
    docker rm $$(docker ps -qa);\
    docker rmi -f $$(docker images -qa);\
    docker volume rm $$(docker volume ls -q);\
	rm -rf /home/tnoulens/data/mariadb/*;\
	rm -rf /home/tnoulens/data/wordpress/*;\
    docker network rm srcs_docker_network;\

fclean: clean
	docker-compose -f $(SRCS) down --rmi all -v
	rm -rf /home/tnoulens/data/*

prune:
	docker system prune -f --all --volumes

.PHONY:	all up down ps top clean fclean prune
