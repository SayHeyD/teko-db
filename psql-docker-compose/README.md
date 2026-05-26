# PostgreSQL Docker Compose

This repository contains a Docker Compose configuration for running a PostgreSQL database container. Also
contains a pgAdmin4 container for easy database management via a web interface, without the need to install
any additional software.

The data is persisted in a Docker volume by default.

## Start the containers

In this directory:

```shell
docker compose up --detach
```

> `--detach` starts the containers in the background. They will continue to run even after you restart the host

When running this command for the first time, it may take a few seconds for the containers to be downloaded and started.

## Stop the containers

In this directory:

```shell
docker compose down
```

## Remove the containers & volumes

To remove all containers and volumes, which will remove all data:

```shell
docker compose down --volumes
```

## Access via the UI

Open [http://localhost:5050](http://localhost:5050) in your browser. After starting the containers, 
it may take a few seconds for the UI to become available.

## Access via psql

You can also access the database via the psql shell:

```shell
# Command structure
# docker compose exec <container_name> <command>
docker compose exec psql psql -U postgres
```

To exit the psql shell, type `\q` or `exit` and press Enter. This will not stop the containers.

