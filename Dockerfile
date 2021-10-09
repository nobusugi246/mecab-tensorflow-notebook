ARG OWNER=jupyter
ARG BASE_CONTAINER=$OWNER/tensorflow-notebook
FROM $BASE_CONTAINER:2021-10-07

USER root

RUN apt-get update && apt-get -y upgrade && apt-get install -y mecab libmecab-dev mecab-ipadic mecab-ipadic-utf8 git make curl xz-utils file patch && apt-get clean all
RUN git clone --depth 1 https://github.com/neologd/mecab-ipadic-neologd.git && mecab-ipadic-neologd/bin/install-mecab-ipadic-neologd -n -a -y && rm -rf mecab-ipadic-neologd

USER ${NB_UID}
RUN pip install --no-cache-dir mecab-python3 gensim unidic protobuf -U

USER root
RUN cp /etc/mecabrc /usr/local/etc/

USER ${NB_UID}
