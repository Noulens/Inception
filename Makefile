SRCS	=	srcs/docker-compose.yml
PATH	=	/home/tnoulens/data

all:	up	

up:
	mkdir -p $(PATH)/mariadb
	mkdir -p $(PATH)/wordpress
	docker compose -f $(SRCS) up

clean:	
	docker compose -f $(SRCS) down

fclean: clean
	rm -rf $(PATH)


prune:	fclean
	docker system prune -f --all --volumes

.PHONY:	all up down ps top clean fclean prune
