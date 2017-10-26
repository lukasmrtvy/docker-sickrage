# docker-sickrage

## Info:
Based on Alpine:latest

## Usage:
`docker pull lukasmrtvy/docker-sickrage ; docker rm -f sickrage; docker run -d --restart always --network my-bridge --name sickrage -p 8081:8081 -v sickrage:/config/sickrage lukasmrtvy/docker-sickrage`
