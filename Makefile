docker-image: docker-image-build docker-image-push

docker-image-build:
	docker build --tag registry.guck.se/bonk docker/

docker-image-push:
	docker push registry.guck.se/bonk

docker-run:
	docker run --detach --rm --name=git-server -p 2222:22 registry.guck.se/bonk

docker-exec:
	docker exec -it git-server ash

docker-stop:
	docker stop git-server
