# Monorepo Victor Soares (soares-victor)
Solutions and projects.

## How run locally any package and service.
* Dockerfile eg:
```
$ make startDockerfile package=tariff-comparison ms=ms-user
```

* Docker Compose eg:
```
$ make startDockerCompose package=common ms=mongodb
```

* Create projects from templates:

Check if you are at /soares-victor
```
$ pwd
```
then
```
$ make createProjectFromTemplate
```