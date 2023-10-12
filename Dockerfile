FROM node:20 as frontend

WORKDIR /usr/src/frontend/

COPY frontend/package.json .
COPY frontend/pnpm-lock.yaml .
RUN npm i -g pnpm
RUN pnpm install

COPY frontend/ .
RUN pnpm build

FROM python:3.11-slim-bullseye

# apt
RUN apt-get update -y && apt-get upgrade -y && apt-get install -y \
    curl
RUN apt-get clean && rm -rf /var/lib/apt/lists/* && rm -rf /var/cache/apt

ADD requirements.txt /tmp/requirements.txt
RUN --mount=type=cache,target=/root/.cache/pip \
    pip install -r /tmp/requirements.txt --disable-pip-version-check

WORKDIR /usr/src/django_be/
COPY . .
RUN rm -r frontend/
COPY --from=frontend /usr/src/frontend/dist ./frontend/dist
RUN rm -r ./frontend/dist/index.html # using html from template
