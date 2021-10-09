ARG OWNER=jupyter
ARG BASE_CONTAINER=$OWNER/tensorflow-notebook
FROM $BASE_CONTAINER:2021-10-07

USER root

RUN apt-get update && apt-get -y upgrade && apt-get install -y mecab libmecab-dev mecab-ipadic mecab-ipadic-utf8 git make curl xz-utils file && apt-get clean all

USER ${NB_UID}

RUN pip install --no-cache-dir mecab-python3 gensim
