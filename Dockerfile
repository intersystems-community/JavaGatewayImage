FROM eclipse-temurin:8-jre-alpine

ENV GWDIR /jgw
ENV PORT 55555
ENV ISC_PACKAGE_INSTALLDIR /usr/irissys
ENV ISC_JARDIR $ISC_PACKAGE_INSTALLDIR/dev/java/lib/1.8

COPY --from=intersystemsdc/iris-community:latest \
     $ISC_JARDIR/intersystems-jdbc-*.jar \
     $GWDIR/

CMD java -Xrs $JVMARGS -Djava.system.class.loader=com.intersystems.gateway.ClassLoader -classpath "${GWDIR}/*" com.intersystems.gateway.JavaGateway $PORT "" "f118e1c6cec1:IRIS:%Java Server" 0.0.0.0 "" 2>&1