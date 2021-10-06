start:
	echo "Starting serviceName..."; \
	make startContainer;

startContainer:
	echo "Starting serviceName"; \
	cd ../../../ ; \
	docker build --build-arg ms=serviceName --build-arg package=packageName \
 	-t serviceName \
 	-f ./packages/packageName/serviceName/Dockerfile . ; \
	docker run -d -it --network host serviceName;