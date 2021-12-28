docker-image-build:
	docker build --tag guck.se/git-server docker/

docker-run:
	docker run --detach --rm --name=git-server -p 2222:22 guck.se/git-server:latest

docker-exec:
	docker exec -it git-server ash

docker-stop:
	docker stop git-server
