all:	
	mkdir -p /home/tnoulens/data/mariadb
	mkdir -p /home/tnoulens/data/wordpress

prune:	fclean
	docker system prune -f --all --volumes

.PHONY:	all up down ps top clean fclean prune
