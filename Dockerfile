FROM python:3.10.0a7-buster

WORKDIR /mini-app

COPY /mini-app .

RUN pip install -r requirements.txt

ENV FLASK_APP=hello.py

EXPOSE 5000

CMD ["flask", "run", "--host=0.0.0.0"]




