FROM spritsail/alpine:3.18

ARG VELOCITY_VER=3.3.0-SNAPSHOT
ARG VELOCITY_BUILD=312

LABEL maintainer="Spritsail <velocity@spritsail.io>" \
      org.label-schema.vendor="Spritsail" \
      org.label-schema.name="Velocity" \
      org.label-schema.url="https://github.com/PaperMC/Velocity" \
      org.label-schema.description="Modern Minecraft server network proxy" \
      org.label-schema.version=${VELOCITY_VER}-${VELOCITY_BUILD} \
      io.spritsail.version.velocity=${VELOCITY_VER}-${VELOCITY_BUILD}

RUN apk --no-cache add openjdk17-jre-headless nss
ADD https://api.papermc.io/v2/projects/velocity/versions/${VELOCITY_VER}/builds/${VELOCITY_BUILD}/downloads/velocity-${VELOCITY_VER}-${VELOCITY_BUILD}.jar

WORKDIR /config

ENV INIT_MEM=1G \
    MAX_MEM=1G \
    SERVER_JAR=/velocity.jar

CMD exec java \
        -Xms"$INIT_MEM" \
        -Xmx"$MAX_MEM" \
        -XX:+UseG1GC \
        -XX:G1HeapRegionSize=4M \
        -XX:+UnlockExperimentalVMOptions \
        -XX:+ParallelRefProcEnabled \
        -XX:+AlwaysPreTouch \
        -XX:MaxInlineLevel=15 \
        -jar "$SERVER_JAR"
