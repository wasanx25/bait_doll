app     := vimet-admin-kai
server  := vimet-server
version := $(shell git rev-parse --abbrev-ref HEAD | sed -e 's/\//_/')
args    := $(wordlist 2, $(words $(MAKECMDGOALS)), $(MAKECMDGOALS))

$(eval $(args):;@:)

sidekiq_build:
	docker build -t $(app)-sidekiq:master -f Dockerfile.sidekiq .

sidekiq_deploy:
	docker tag $(app)-sidekiq:master gcr.io/$(server)/$(app)-sidekiq:master
	gcloud docker -- push gcr.io/$(server)/$(app)-sidekiq:master

production_build:
	docker build -t $(app):master -f Dockerfile.production .
	docker build -t $(app)-nginx -f config/nginx/Dockerfile config/nginx

production_deploy:
	docker tag $(app):master gcr.io/$(server)/$(app)-production
	gcloud docker -- push gcr.io/$(server)/$(app)-production
	docker tag $(app)-nginx gcr.io/$(server)/$(app)-nginx
	gcloud docker -- push gcr.io/$(server)/$(app)-nginx

production_login:
	docker exec -it $(app)-production /bin/bash

production_start:
	docker run -itd --rm \
		--name $(app)-production \
		$(app):master
	docker run -itd --rm \
		-p 80:80 \
		--volumes-from $(app)-production \
		--name $(app)-nginx \
		$(app)-nginx

production_logs:
	docker logs -f $(app)-production

production_stop:
	docker rm -f $(app)-production
