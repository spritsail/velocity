FROM spritsail/alpine:3.15

ARG VELOCITY_VER=3.1.1
ARG VELOCITY_BUILD=98

LABEL maintainer="Spritsail <velocity@spritsail.io>" \
      org.label-schema.vendor="Spritsail" \
      org.label-schema.name="Velocity" \
      org.label-schema.url="https://github.com/PaperMC/Velocity" \
      org.label-schema.description="Modern Minecraft server network proxy" \
      org.label-schema.version=${VELOCITY_VER} \
      io.spritsail.version.velocity=${VELOCITY_VER}

ADD https://papermc.io/api/v2/projects/velocity/versions/${VELOCITY_VER}/builds/${VELOCITY_BUILD}/downloads/velocity-${VELOCITY_VER}-${VELOCITY_BUILD}.jar /velocity.jar
RUN apk --no-cache add openjdk17-jre-headless nss

WORKDIR /config
VOLUME /config

CMD ["java", "-Xms1G", "-Xmx1G", "-XX:+UseG1GC", "-XX:G1HeapRegionSize=4M", "-XX:+UnlockExperimentalVMOptions", "-XX:+ParallelRefProcEnabled", "-XX:+AlwaysPreTouch", "-XX:MaxInlineLevel=15", "-jar", "/velocity.jar"]
