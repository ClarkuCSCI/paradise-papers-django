FROM python:3.9
MAINTAINER PeStory@clarku.edu

# Directories for the source code
RUN mkdir -p /usr/src/paradise_papers_search

# Install OS dependencies
RUN apt update && \
  apt install -y apt-transport-https ca-certificates curl software-properties-common && \
  curl -fsSL https://debian.neo4j.com/neotechnology.gpg.key | apt-key add - && \
  add-apt-repository "deb https://debian.neo4j.com stable 4.1" && \
  apt update && \
  apt install -y neo4j libgeos-dev

# Next, install the Python modules
ADD requirements.txt /usr/src/requirements.txt
RUN pip install -r /usr/src/requirements.txt

WORKDIR /usr/src/paradise_papers_search
ENV PYTHONPATH=/usr/src/paradise_papers_search
ENV DJANGO_SETTINGS_MODULE='paradise_papers_search.settings.dev'
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
