start:
	echo "Starting bff common NodeJS and all components"; \
	make startContainer;

startContainer:
	echo "Starting bff-common"; \
	cd ../../../ ; \
	docker build --build-arg ms=bff-common --build-arg package=common -t bff-common -f ./packages/common/bff-common/Dockerfile . ; \
	docker run -d -it --network host bff-common;
