SRCS	=	srcs/docker-compose.yml
ENV		=	/home/tnoulens/.env

all:	up

up:
	cp $(ENV) ./srcs/
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
	rm -f ./srcs/.env;
	docker-compose -f $(SRCS) down \
    docker rm $$(docker ps -qa) \
    docker rmi -f $$(docker images -qa) \
    docker volume rm $$(docker volume ls -q) \
	sudo rm -rf /home/tnoulens/data/mariadb/ \
	sudo rm -rf /home/tnoulens/data/wordpress/

fclean: clean
	docker-compose -f $(SRCS) down --rmi all -v
	rm -rf /home/tnoulens/data/
	rm -f ./srcs/.env

prune:
	docker system prune -f --all --volumes

.PHONY:	all up down ps top clean fclean prune
