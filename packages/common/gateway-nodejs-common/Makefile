start:
	echo "Starting gateway common NodeJS and all components"; \
	make startKeycloak; \
	make startContainer;

startContainer:
	echo "Starting gateway-nodejs-common"; \
	cd ../../../ ; \
	docker build --build-arg ms=gateway-nodejs-common --build-arg package=common -t gateway-nodejs-common -f ./packages/common/gateway-nodejs-common/Dockerfile . ; \
	docker run -d -it --network host gateway-nodejs-common;

startKeycloak: 
	echo "Starting keycloak"; \
	docker-compose -f ../keycloak/docker-compose.yml up -d;