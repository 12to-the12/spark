default: all
all: assemble-script upload build test-containers

# uploads the fully linked shell script to my fileserver
upload:
	rsync -avPh ./dist/spark pc:/mnt/hdd/fileshare/PUBLISH/spark

build:
	docker build ./environments/debian/ -t debian-test
	docker build ./environments/ubuntu/ -t ubuntu-test
	docker build ./environments/raspbian/ -t raspbian-test
	docker build ./environments/fedora/ -t fedora-test

test-containers: assemble-script upload
	docker container run -it debian-test
	docker container run -it ubuntu-test
	docker container run -it raspbian-test
	docker container run -it fedora-test


test-local: assemble-script
	chmod +x ./dist/spark
	sudo ./dist/spark

assemble-script: clean
	find ./src/* ! -name main -exec cat {} + > ./dist/spark
	cat ./src/main >> ./dist/spark

clean:
	rm ./dist/*
