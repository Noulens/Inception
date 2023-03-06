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


fclean: down prune
	sudo rm -rf /home/tnoulens/data/
	rm -f ./srcs/.env

prune:
	docker system prune -f --all --volumes

.PHONY:	all up down ps top clean fclean prune
