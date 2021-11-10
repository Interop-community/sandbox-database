FROM mysql:5.7
COPY sandman.sql /
COPY oic.sql /
COPY sandman_n_oic.sh /docker-entrypoint-initdb.d/abc.sh
RUN chmod +x /docker-entrypoint-initdb.d/abc.sh
COPY ./schema-scripts/ /docker-entrypoint-initdb.d/
COPY ./healthcheck/wait-for-db.sh /wait-for-db.sh


RUN chmod +x /wait-for-db.sh


