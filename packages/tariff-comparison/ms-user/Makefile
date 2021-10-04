start:
	echo "Starting ms-user and all components"; \
	make startMongoDb; \
	make startContainer;

startContainer:
	echo "Starting ms-user"; \
	cd ../../../ ; \
	docker build --build-arg ms=ms-user --build-arg package=tariff-comparison -t ms-user -f ./packages/tariff-comparison/ms-user/Dockerfile . ; \
	docker run -d -it --network host ms-user;

startMongoDb:
	echo "Starting mongodb"; \
	docker-compose -f ../../common/mongodb/docker-compose.yml up -d;