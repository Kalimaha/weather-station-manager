FROM elixir:latest

RUN apt-get update && apt-get install -y postgresql-client

ADD . /app

RUN mix local.hex --force
RUN mix archive.install --force https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez

RUN mix local.rebar --force

WORKDIR /app

EXPOSE 4000

