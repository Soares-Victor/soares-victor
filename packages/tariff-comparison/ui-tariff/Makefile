start:
	echo "Starting ui-tariff..."; \
	make startContainer;

startContainer:
	echo "Starting ui-tariff"; \
	cd ../../../ ; \
	docker build --build-arg ms=ui-tariff --build-arg package=tariff-comparison \
 	-t ui-tariff \
 	-f ./packages/tariff-comparison/ui-tariff/Dockerfile . ; \
	docker run -d -it --network host ui-tariff;