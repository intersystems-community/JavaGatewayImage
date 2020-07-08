# JavaGatewayImage

JavaGateway in a docker image. This image is published as `intersystemscommunity/jgw:latest`.

# Containerising your Java Gateway library

As simple as:

```
FROM openjdk:8 AS builder

ARG APP_HOME=/tmp/app

# Copy your lib sources
COPY src $APP_HOME/src

# Copy Gateway Jars dependencies
COPY --from=intersystemscommunity/jgw:latest /jgw/*.jar $APP_HOME/jgw/

# Compile your java library
# Output the jars to /tmp/app/jar/
# RUN javac/graddle/maven

FROM intersystemscommunity/jgw:latest

COPY --from=builder /tmp/app/jar/*.jar $GWDIR/
```

# Debugging

Uncomment 3 lines in docker-compose to enable remote debugging on port 5005.
