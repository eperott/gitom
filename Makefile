all: docker-image helm-lint

clean: helm-clean

docker-image: docker-image-build docker-image-push

docker-image-build:
	docker build --tag registry.guck.se/gitom:0.3.0 docker/
	docker tag registry.guck.se/gitom:0.3.0 registry.guck.se/gitom:latest

docker-image-push:
	docker push registry.guck.se/gitom:0.3.0
	docker push registry.guck.se/gitom:latest

docker-run:
	docker run --detach --rm --name=gitom -p 2222:22 registry.guck.se/gitom:0.3.0

docker-exec:
	docker exec -it gitom ash

docker-stop:
	docker stop gitom

helm/gitom/Chart.lock: helm/gitom/Chart.yaml
	helm dependency update helm/gitom

helm-update: helm/gitom/Chart.lock

helm-clean:
	rm -f helm/gitom/charts/* helm/gitom/Chart.lock

helm-lint: helm/gitom/Chart.lock
	helm lint helm/gitom

helm-package: docker-image helm-lint
	helm package helm/gitom

helm-install: docker-image helm-lint
	helm upgrade --install gitom helm/gitom -f test/test.yaml

# TODO: Push chart to repo

helm-delete:
	helm delete gitom
