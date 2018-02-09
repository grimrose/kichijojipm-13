FROM openjdk:alpine

ENV PLANTUML_VERSION 1.2018.0

ENV LANG ja_JP.UTF-8

RUN echo "@testing http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

WORKDIR /app

RUN apk update \
    && apk upgrade \
    && apk add --no-cache graphviz curl fontconfig font-ipa@testing \
    && curl -L https://sourceforge.net/projects/plantuml/files/${PLANTUML_VERSION}/plantuml.${PLANTUML_VERSION}.jar/download -o plantuml.jar

ENTRYPOINT ["java", "-Djava.awt.headless=true", "-jar", "plantuml.jar"]

CMD ["-h"]
