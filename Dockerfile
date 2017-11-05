FROM alpine:latest

ENV PYTHONIOENCODING="UTF-8"

ENV UID 1000
ENV GID 1000
ENV USER htpc
ENV GROUP htpc

ENV SICKRAGE_VERSION  d8c2613583ce8b321a5adc9ff70c52e830f224a8

RUN addgroup -S ${GROUP} -g ${GID} && adduser -D -S -u ${UID} ${USER} ${GROUP}  && \
    apk update && apk upgrade && apk add --no-cache --update curl git python2 tzdata && \
    mkdir -p /opt/sickrage /config/sickrage && \
    curl -sSL https://github.com/SickRage/SickRage/archive/${SICKRAGE_VERSION}.tar.gz | tar xz -C /opt/sickrage --strip-components=1 && \
    chown -R ${USER}:${GROUP} /opt/sickrage /config/  && \
    apk del curl git

EXPOSE 8081

WORKDIR /opt

VOLUME /config/sickrage/

LABEL version=${SICKRAGE_VERSION}
LABEL url=https://api.github.com/repos/SickRage/SickRage/commits/master

USER ${USER}

ENTRYPOINT ["python", "sickrage/SickBeard.py", "--nolaunch", "--datadir=/config/sickrage/"]
