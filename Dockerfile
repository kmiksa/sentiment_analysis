FROM python:3.9.5
ENV PYTHONUNBUFFERED 1
ADD requirements.txt .
RUN apt-get update && apt-get install gcc -y
RUN pip install -r requirements.txt

ADD overrides.json .
ADD . sentiment-analysis
COPY overrides.json /usr/local/share/jupyter/lab/settings/overrides.json

ENV PROJECT_DIR /sentiment-analysis
WORKDIR $PROJECT_DIR