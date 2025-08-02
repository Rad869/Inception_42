
all:
	docker build -t myimage:1 .
	docker run -d --name c1 -p 443:443  myimage:1

fclean:
	docker rm -f c1
	docker image rm $$(docker images -a -q)

exec :
	docker exec -ti c1 bash
	