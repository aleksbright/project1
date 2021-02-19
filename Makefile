all: sync deploy
sync:
	docker build -t apache .
deploy:
	docker rm -f actualdata
	docker run --name actualdata -dit -p 80:80 apache
