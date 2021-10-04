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
	docker-compose -f ../../common/localstack/docker-compose.yml up -d; \
	sleep 10; \
	aws --endpoint-url=http://localhost:4566 s3 mb s3://projectsysvictor-tariff-toprocess; \
	aws --endpoint-url=http://localhost:4566 s3 mb s3://projectsysvictor-user-photos; \