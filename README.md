# react_postgres_app

## Dependencies

You may either install [Docker](https://docs.docker.com/desktop/setup/install/windows-install/), or decide to have
everything on the host system. This includes

- a [postgres](https://www.postgresql.org/download/windows/) database
- the [postgREST](https://docs.postgrest.org/en/v13/tutorials/tut0.html) server for a RESTful API to the Postgres database

Additionally, you need [npm](https://nodejs.org/en/download/) to be installed (independently of Docker).

## Starting the app

### On the host

- run your postgres server on port *8888*
- restore the [dump](db_scripts/pg_dumpall.sql) to have the necessary users and tables available
- start postgrest with the correct config: `postgrest Docker/postgrest.conf`

- `npm install`
- `npm start`

### In Docker

- run the compose file: `docker compose -f Docker/compose.yml up -d`
- `npm install`
- `npm start`