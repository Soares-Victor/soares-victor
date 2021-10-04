FROM mongo as mongodb

# Envs = Service / package
ARG ms
ARG package
ENV ms ${ms}
ENV package ${package}

WORKDIR /

VOLUME "/packages/${package}/${ms}/init/mongo-init.js:/docker-entrypoint-initdb.d/mongo-init.js:ro"