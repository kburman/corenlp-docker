FROM openjdk:8-alpine

ARG VERSION=2018-10-05

EXPOSE 9000

RUN wget https://nlp.stanford.edu/software/stanford-corenlp-full-${VERSION}.zip \
    && unzip stanford-corenlp-full-${VERSION}.zip \
    && rm stanford-corenlp-full-${VERSION}.zip
WORKDIR /stanford-corenlp-full-${VERSION}

ENV CLASSPATH /stanford-corenlp-full-${VERSION}/*
CMD java -Xmx8g edu.stanford.nlp.pipeline.StanfordCoreNLPServer