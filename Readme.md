# Monorepo Victor Soares (soares-victor)
Solutions and projects.

## How run locally any package and service.
1. Dockerfile eg:
```
$ make startDockerfile package=tariff-comparison ms=ms-user
```

2. Docker Compose eg:
```
$ make startDockerCompose package=common ms=mongodb
```