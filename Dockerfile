FROM tiangolo/uvicorn-gunicorn-fastapi:python3.11 AS builder

WORKDIR /app

RUN apt-get update
RUN apt -y install default-mysql-client iputils-ping lsof

COPY requirements.txt ./
COPY . .

RUN pip install -r requirements.txt

# for these scripts, see the docs: https://github.com/tiangolo/uvicorn-gunicorn-fastapi-docker
RUN chmod +x prestart.sh