FROM node:18 as frontend

WORKDIR /usr/src/frontend/

COPY frontend/package.json .
COPY frontend/package-lock.json .
RUN npm i

COPY frontend/ .
RUN npm run build

FROM python:3.8-slim-bullseye

# apt
RUN apt-get update -y && apt-get upgrade -y && apt-get install -y \
    curl
RUN apt-get clean && rm -rf /var/lib/apt/lists/* && rm -rf /var/cache/apt

ADD requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt --disable-pip-version-check --no-cache-dir

WORKDIR /usr/src/django_be/
COPY . .
COPY --from=frontend /usr/src/frontend/dist /frontend/

