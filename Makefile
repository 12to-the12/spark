default: all
all: assemble-script upload build exec

upload:
	rsync -avPh ./dist/spark pc:/mnt/hdd/fileshare/PUBLISH/spark

build:
	docker build . -t mycontainer

exec:
	docker container run -it mycontainer

assemble-script:
	cat ./src/flag_setting_utils > ./dist/spark
	cat ./src/detect_system > ./dist/spark
	cat ./src/main >> ./dist/spark
