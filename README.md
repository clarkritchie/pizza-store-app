# pizza-store-app

This is just a simple no-op demo app that:
- Starts 2 containers -- one container a Fast API app (see `./app`), the other for Maria DB
- Allows the app container to talk to the database container

See also [uvicorn-gunicorn-fastapi-docker](https://github.com/tiangolo/uvicorn-gunicorn-fastapi-docker) for more doco.

## Usage

- `./run.sh` to start
- `./stop.sh` to stop
- `./etc/test-mysql.sh` to connect to MySQL

## Example

1. Start with `./run.sh`

2. Confirm the two containers are up:

```
❯ docker ps
CONTAINER ID   IMAGE                    COMMAND                  CREATED         STATUS         PORTS                    NAMES
febe38930e89   pizza-store-app-server   "/start.sh"              4 minutes ago   Up 4 minutes   0.0.0.0:80->80/tcp       pizza_app
b5f58fbbca09   mariadb:latest           "docker-entrypoint.s…"   4 minutes ago   Up 4 minutes   0.0.0.0:3306->3306/tcp   pizza_db
```

3. Call app:

```
❯ curl http://localhost
{"message":"more pizza"}
```

4. Get into MySQL

```
❯ mysql -upizza -ppizza -h127.0.0.1 pizza
❯ mysql -uroot --ppassword -h127.0.0.1
```

## Notes

- `prestart.sh` is to allow the Maria DB container to become ready before the application starts.  See also [this link](https://github.com/tiangolo/uvicorn-gunicorn-fastapi-docker#pre_start_path).
