FROM python:3.7-alpine
LABEL architecture="eugene.earth.solar@gmail.com"

ENV PYTHONUNBUFFERD=1

COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

RUN mkdir /api
WORKDIR /api
COPY ./api /api

RUN adduser -D user
USER user