FROM node:14-alpine AS base

# Envs = Service / package
ARG ms
ARG package
ENV ms ${ms}
ENV package ${package}

WORKDIR /
FROM base AS dependencies

# Copy only libs necessary
COPY libs/javascript/error /libs/javascript/error
COPY libs/javascript/logger /libs/javascript/logger

COPY packages/${package}/${ms} /
RUN yarn install
CMD ["yarn", "--cwd", "/packages/${package}/${ms}/" ,"start"]