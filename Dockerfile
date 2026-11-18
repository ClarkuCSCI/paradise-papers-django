FROM python:3.12

# Directories for the source code
RUN mkdir -p /usr/src/paradise_papers_search

# Install OS dependencies
RUN apt update && \
  apt install -y apt-transport-https ca-certificates wget && \
  mkdir -p /etc/apt/keyrings && \
  wget -O - https://debian.neo4j.com/neotechnology.gpg.key | gpg --dearmor -o /etc/apt/keyrings/neotechnology.gpg && \
  echo 'deb [signed-by=/etc/apt/keyrings/neotechnology.gpg] https://debian.neo4j.com stable latest' | tee -a /etc/apt/sources.list.d/neo4j.list && \
  apt update && \
  apt install -y neo4j libgeos-dev

# Next, install the Python modules
ADD requirements.txt /usr/src/requirements.txt
RUN pip install -r /usr/src/requirements.txt

WORKDIR /usr/src/paradise_papers_search
ENV PYTHONPATH=/usr/src/paradise_papers_search
ENV DJANGO_SETTINGS_MODULE='paradise_papers_search.settings.dev'
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
