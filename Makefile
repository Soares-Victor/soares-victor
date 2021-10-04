startContainer: 
	echo "Starting $(ms)"; \
	docker build --build-arg ms=$(ms) --build-arg package=$(package) -t $(ms) -f ./packages/$(package)/$(ms)/Dockerfile . ; \
	docker run -d -it --network host $(ms);