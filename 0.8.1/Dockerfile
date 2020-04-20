# docker build -t conjecto/rdf-delta:0.8.1 -t conjecto/rdf-delta:latest .
FROM openjdk:8-alpine
MAINTAINER Conjecto <contact@conjecto.com>

RUN apk update \
    && apk add --no-cache bash curl unzip

RUN curl https://repo1.maven.org/maven2/org/seaborne/rdf-delta/rdf-delta-dist/0.8.1/rdf-delta-dist-0.8.1.zip -o /tmp/rdf-delta-dist.zip \
    && unzip /tmp/rdf-delta-dist.zip -d /opt \
    && mv /opt/rdf-delta-* /opt/rdf-delta \
    && rm /tmp/rdf-delta-dist.zip

ENV DELTA_HOME=/opt/rdf-delta
RUN ln -s /opt/rdf-delta/dcmd /usr/local/bin/dcmd 

EXPOSE 1066

ENTRYPOINT ["dcmd"]
CMD ["server", "-mem"]