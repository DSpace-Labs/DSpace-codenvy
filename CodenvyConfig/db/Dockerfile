FROM postgres

ENV POSTGRES_DB dspace
ENV POSTGRES_USER dspace
ENV POSTGRES_PASSWORD dspace

RUN echo "create extension pgcrypto;" > /tmp/pgcrypto.txt
CMD psql -U postgres < /tmp/pgcrypto.txt
