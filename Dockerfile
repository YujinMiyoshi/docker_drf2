FROM python:3.9-slim-buster
LABEL architecture="eugene.earth.solar@gmail.com"

ENV PYTHONUNBUFFERD=1

RUN apt-get update && \
    apt-get -y install gcc libmariadb-dev

COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

RUN mkdir /api
WORKDIR /api
COPY ./api /api

#RUN adduser -D user
RUN useradd -m user

USER user