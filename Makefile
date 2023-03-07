SRCS	=	srcs/docker-compose.yml
SRCS_B	=	srcs/bonus/docker-compose.yml
ENV		=	/home/tnoulens/.env

all:	up

bonus:	up_bonus

up_bonus:
	cp $(ENV) ./srcs/
	mkdir -p /home/tnoulens/data/mariadb
	mkdir -p /home/tnoulens/data/wordpress
	mkdir -p /home/tnoulens/data/jekyll
	docker-compose -f $(SRCS_B) up --build -d

up:
	cp $(ENV) ./srcs/
	mkdir -p /home/tnoulens/data/mariadb
	mkdir -p /home/tnoulens/data/wordpress
	docker-compose -f $(SRCS) up --build -d

bdown:
	docker-compose -f $(SRCS_B) down

bps:
	docker-compose -f $(SRCS_B) ps

btop:
	docker-compose -f $(SRCS_B) top

down:
	docker-compose -f $(SRCS) down

ps:
	docker-compose -f $(SRCS) ps

top:
	docker-compose -f $(SRCS) top


fclean: down bdown prune
	sudo rm -rf /home/tnoulens/data/
	rm -f ./srcs/.env

prune:
	docker system prune -f --all --volumes

.PHONY:	all up down ps top clean fclean prune
