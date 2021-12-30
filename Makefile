docker-image: docker-image-build docker-image-push

docker-image-build:
	docker build --tag registry.guck.se/gitom docker/

docker-image-push:
	docker push registry.guck.se/gitom

docker-run:
	docker run --detach --rm --name=gitom -p 2222:22 registry.guck.se/gitom

docker-exec:
	docker exec -it gitom ash

docker-stop:
	docker stop gitom
