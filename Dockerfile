FROM openjdk:8u252-jre

ENV GWDIR /jgw
ENV PORT 55555
ENV ISC_PACKAGE_INSTALLDIR /usr/irissys
ENV ISC_JARDIR $ISC_PACKAGE_INSTALLDIR/dev/java/lib/JDK18

COPY --from=store/intersystems/iris-community:2020.2.0.211.0 \
     $ISC_JARDIR/intersystems-gateway-3.1.0.jar \
     $ISC_JARDIR/intersystems-jdbc-3.1.0.jar \
     $ISC_JARDIR/intersystems-utils-3.1.0.jar \
     $ISC_PACKAGE_INSTALLDIR/dev/java/lib/gson/gson-2.8.5.jar \
     $GWDIR/

CMD java $JVMARGS -Xrs -classpath "$GWDIR/*" com.intersystems.gateway.JavaGateway $PORT 2>&1