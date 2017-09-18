FROM alpine:latest

ENV PYTHONIOENCODING="UTF-8"

ENV UID 1000
ENV USER htpc
ENV GROUP htpc

RUN addgroup -S ${GROUP} && adduser -D -S -u ${UID} ${USER} ${GROUP}  && \
    apk update && apk upgrade && apk add --no-cache --update git python && \
    mkdir -p /opt && \
    cd /opt && \ 
    git clone https://github.com/SickRage/SickRage && \
    cd SickRage && \
    VERSION=`git log -n 1 --pretty=format:"%H %cd"`

EXPOSE 8081

WORKDIR /opt

VOLUME /${USER}/.sickrage/

LABEL name=couchpotato
LABEL version=${VERSION}
LABEL url=https://api.github.com/repos/SickRage/SickRage/commits/master

USER ${USER}

ENTRYPOINT ["python", "sickrage/SickBeard.py", "--nolaunch", "--datadir=/${USER}/.sickrage/"]
