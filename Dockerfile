FROM tiangolo/uvicorn-gunicorn-fastapi:python3.11 AS builder

WORKDIR /app

RUN apt-get update

RUN apt -y install iputils-ping lsof vim
RUN apt -y install default-mysql-client python3-pymysql alembic

COPY requirements.txt ./
COPY . .

RUN pip install -r requirements.txt

# for these scripts, see the docs: https://github.com/tiangolo/uvicorn-gunicorn-fastapi-docker
RUN chmod +x prestart.sh

# for easier alembic debugging, just show tables in pizza test db
RUN echo "alias show-pizza-tables=\"mysql -uroot -ppassword -hpizza_db -e 'show tables' pizza\"" >> /etc/bash.bashrc