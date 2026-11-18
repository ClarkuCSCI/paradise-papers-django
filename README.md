# paradise-papers-django
A simple Django web app for searching the Paradise Papers dataset backed by Neo4j.

[Welcome to Paradise Paper Search App’s Django + Neomodel Tutorial!](https://neo4j-examples.github.io/paradise-papers-django/)

## Setup with Docker

First create an [sandbox database](https://sandbox.neo4j.com/), make sure to select **Paradise Papers by ICIJ** under **Pre-Built Data**, copy the credentials: username, password and bolt URL, you are going to need that later.

Next, clone [the paradise-papers-django repo](https://github.com/ClarkuCSCI/paradise-papers-django). Unless otherwise specified, all commands mentioned below should be run within the root directory of this repository.

Configure the database connection by following these steps:

1. Copy `dot_env_example` to `.env`
2. On UNIX-based systems, run `chmod 600 .env` to prevent other users from reading your `.env` file
3. Edit `.env`, replacing: `<username>`, `<password>`, and `<address>` with the values from the "Connection details" tab on sandbox.neo4j.com

Start the Django container by running:
```
docker compose up
```

Next, configure the Django admin interface by running:
```
docker compose exec django python manage.py migrate
docker compose exec django python manage.py createsuperuser
```

Finally, load the search interface (<http://127.0.0.1:8000/>). There is also an admin interface (<http://127.0.0.1:8000/admin>). However, the admin interface for Neo4j data [isn't as powerful as it is for relational data](https://github.com/neo4j-contrib/django-neomodel#warnings).
