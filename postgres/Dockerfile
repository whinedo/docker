FROM ubuntu:14.04
MAINTAINER Docker Education Team <education@docker.com>

ENV PG_VERSION 9.3
RUN locale-gen en_US.UTF-8
RUN apt-get update
RUN apt-get -y install postgresql postgresql-client postgresql-contrib

RUN pg_dropcluster $PG_VERSION main && pg_createcluster --locale en_US.UTF-8 $PG_VERSION main

RUN echo "host    all             all             0.0.0.0/0 trust" >> /etc/postgresql/$PG_VERSION/main/pg_hba.conf
RUN echo "listen_addresses='*'" >> /etc/postgresql/$PG_VERSION/main/postgresql.conf

RUN service postgresql start && \
 su postgres sh -c "createuser -d -r -s docker" && \
 su postgres sh -c "createdb -O docker docker" && \
 su postgres sh -c "psql -c \"GRANT ALL PRIVILEGES ON DATABASE docker to docker;\""

EXPOSE 5432

# TODO: check Add VOLUMEs to allow backup of config, logs and databases
#VOLUME  ["/etc/postgresql", "/var/log/postgresql", "/var/lib/postgresql"]

CMD ["su", "postgres", "-c", "/usr/lib/postgresql/$PG_VERSION/bin/postgres -D /var/lib/postgresql/$PG_VERSION/main/ -c config_file=/etc/postgresql/$PG_VERSION/main/postgresql.conf"]


