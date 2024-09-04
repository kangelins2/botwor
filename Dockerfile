FROM python:3.12-slim-bullseye

WORKDIR /opt/app

COPY main.py .

CMD python main.py