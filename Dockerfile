# syntax=docker/dockerfile:1

FROM openjdk:17.0.2-jdk-buster

LABEL version="1.19.2"
LABEL homepage.group=Minecraft
LABEL homepage.name="LITV3 - 2.10 [MC1.19.2"
LABEL homepage.icon="https://media.forgecdn.net/avatars/486/700/637788903766308158.png"
LABEL homepage.widget.type=minecraft
LABEL homepage.widget.url=Life-in-the-Village-3:25565
RUN apt-get update && apt-get install -y curl unzip && \
 adduser --uid 99 --gid 100 --home /data --disabled-password minecraft

COPY launch.sh /launch.sh
RUN chmod +x /launch.sh

USER minecraft

VOLUME /data
WORKDIR /data

EXPOSE 25565/tcp

CMD ["/launch.sh"]

ENV MOTD " Server Powered by Docker"
ENV LEVEL world
ENV JVM_OPTS "-Xms4096m -Xmx8192m"