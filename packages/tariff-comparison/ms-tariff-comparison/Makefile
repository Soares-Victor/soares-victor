start:
	echo "Starting ms-tariff-comparison and mongodb"; \
	make startMongoDb; \
	make startLocalStack; \
	make startContainer;

startContainer:
	echo "Starting ms-tariff-comparison"; \
	cd ../../../ ; \
	docker build --build-arg ms=ms-tariff-comparison --build-arg package=tariff-comparison -t ms-tariff-comparison -f ./packages/tariff-comparison/ms-tariff-comparison/Dockerfile . ; \
	docker run -d -it --network host ms-tariff-comparison;

startMongoDb:
	echo "Starting mongodb"; \
	docker-compose -f ../../common/mongodb/docker-compose.yml up -d;

startLocalStack:
	echo "Starting LocalStack"; \
	cd ../../common/localstack/ ; \
	docker-compose -f docker-compose.yml up -d; \
	sleep 10; \
	make createBucket bucket_name=projectsysvictor-tariff-toprocess ; \
	make createBucket bucket_name=projectsysvictor-user-photos ;