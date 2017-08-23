FROM alpine:latest

ENV PYTHONIOENCODING="UTF-8"

RUN apk update && apk upgrade && apk add --no-cache --update git python  && \
  rm -rf /var/cache/apk/*

RUN mkdir /opt && \
  cd /opt && \
  git https://github.com/SickRage/SickRage                               

EXPOSE 8081

WORKDIR /opt

ENTRYPOINT ["python", "sickrage/SickBeard.py", "--nolaunch", "--datadir=/home/.sickrage"]

EXPOSE 8081

WORKDIR /opt

ENTRYPOINT ["python", "sickrage/SickBeard.py", "--nolaunch", "--datadir=/home/.sickrage"]
