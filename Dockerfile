# What we are trying to do is build a docker image for our application image will be built on python:3 
FROM python:3.8               

ENV PYTHONDONTWRITEBYTECODE=1

ENV PYTHONUNBUFFERED=1

# Creatign code directory
RUN mkdir /code

# Sets our Working directory to code folder which will created in the container
WORKDIR /code

# COPY requirements.txt /code/ ###
# We will copy the whole directory in the code folder NOTE: (.) means current directory
COPY . /code/

# Installing the Dependencies
RUN pip3 install --upgrade pip setuptools wheel
RUN pip install -r requirements.txt