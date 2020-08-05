ARG BASE_IMAGE=python:3.8.5-slim-buster
FROM $BASE_IMAGE as base
WORKDIR /app
ENV PYTHONPATH "${PYTHONPATH}:/app"

##
# Install any runtime depenencies here
ENV RUNTIME_DEPENDENCIES="ffmpeg libmagic-dev libgomp1"

RUN apt-get update \
    && apt-get install -y $RUNTIME_DEPENDENCIES \
    && pip install Cython \
&& rm -rf /var/lib/apt/lists/*

ENV BUILD_DEPENDENCIES="build-essential git pkg-config libatlas-base-dev libblas3 liblapack3 liblapack-dev libblas-dev gfortran libfreetype6-dev"

COPY requirements.txt /app/requirements.txt

# Install any build dpendencies depenencies here
RUN apt-get update \
    && apt-get install -y $BUILD_DEPENDENCIES \
    && python -mpip --no-cache-dir install numpy==1.18.1 \
    && pip install --no-cache-dir -r requirements.txt \
&& apt-get remove -y $BUILD_DEPENDENCIES \
&& apt-get auto-remove -y \
&& rm -rf /var/lib/apt/lists/*
