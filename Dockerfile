FROM python:3.7.1

LABEL Author="Nosa Omorodion"
LABEL E-mail="japhet.omorodion@gmail.com"
LABEL version="0.0.1b"

ENV FLASK_APP "."
ENV FLASK_ENV "development"
ENV FLASK_DEBUG True

RUN mkdir /app
WORKDIR /app

COPY Pip* /app/

RUN pip install --upgrade pip && \
    pip install pipenv && \
    pipenv install --dev --system --deploy --ignore-pipfile

ADD . /app

EXPOSE 5000
CMD source .env
CMD flask run --host=0.0.0.0
