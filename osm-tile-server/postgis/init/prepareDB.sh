# sed -i "s+peer+trust+g" /etc/postgresql/10/main/pg_hba.conf
# sed -i "s+md5+trust+g" /etc/postgresql/10/main/pg_hba.conf
service postgresql start
psql -c "DROP DATABASE osm;" -U postgres
psql -c "CREATE USER osm;" -U postgres
psql -c "CREATE DATABASE gis ENCODING UTF8 OWNER osm;" -U postgres
psql -c "CREATE EXTENSION postgis;" -d gis -U postgres
psql -c "CREATE EXTENSION hstore;" -d gis -U postgres
tail -F anything