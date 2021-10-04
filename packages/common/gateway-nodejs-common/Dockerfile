FROM node:14-alpine AS base

# Envs = Service / package
ARG ms
ARG package
ENV ms ${ms}
ENV package ${package}

WORKDIR /
FROM base AS dependencies

COPY packages/${package}/${ms} /
RUN yarn install
CMD ["yarn", "--cwd", "/packages/${package}/${ms}/" ,"start"]