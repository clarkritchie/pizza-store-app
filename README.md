# pizza-store-app

This is just a simple no-op demo app that:
- Starts 2 containers -- one container a Fast API app (see `./app`), the other for Maria DB
- Allows the app container to talk to the database container

## Usage

- `./run.sh` to start
- `./stop.sh` to stop
- `./etc/test-mysql.sh` to connect to MySQL

## Example

Start with `./run.sh`

```
❯ docker ps
CONTAINER ID   IMAGE                    COMMAND                  CREATED         STATUS         PORTS                    NAMES
febe38930e89   pizza-store-app-server   "/start.sh"              4 minutes ago   Up 4 minutes   0.0.0.0:80->80/tcp       pizza_app
b5f58fbbca09   mariadb:latest           "docker-entrypoint.s…"   4 minutes ago   Up 4 minutes   0.0.0.0:3306->3306/tcp   pizza_db
```

```
❯ curl http://localhost
{"message":"more pizza"
```