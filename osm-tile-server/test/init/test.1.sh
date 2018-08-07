cd ~
wget -c https://github.com/gravitystorm/openstreetmap-carto/archive/v2.41.0.tar.gz
tar xvf v2.41.0.tar.gz
rm v2.41.0.tar.gz
wget -c https://download.geofabrik.de/central-america/belize-latest.osm.pbf

if [ $rebuild == 1 ]; then
    apt install osm2pgsql -y
    PGPASSWORD=postgres psql -c "CREATE USER osm;" -d gis -h postgis-db -U postgres
    PGPASSWORD=postgres psql -c "CREATE DATABASE gis ENCODING UTF8 OWNER osm;" -d gis -h postgis-db -U postgres
    PGPASSWORD=postgres psql -c "CREATE EXTENSION postgis;" -d gis -h postgis-db -U postgres
    PGPASSWORD=postgres psql -c "CREATE EXTENSION hstore;" -d gis -h postgis-db -U postgres

	osm2pgsql --slim -h postgis-db -d gis -C 2000 --hstore -S openstreetmap-carto-2.41.0/openstreetmap-carto.style belize-latest.osm.pbf
    git clone https://github.com/openstreetmap/mod_tile.git
    cd mod_tile/
    ./autogen.sh
    ./configure
    make
    make install
    make install-mod_tile
    cd ..
    cd openstreetmap-carto-2.41.0/
    ./get-shapefiles.sh
    # carto project.mml > style.xml
    less style.xml
fi
cp /usr/local/bin/style.xml /root/openstreetmap-carto-2.41.0/style.xml
# sed -i 's+XML=/home/jburgess/osm/svn.openstreetmap.org/applications/rendering/mapnik/osm-local.xml+XML=/root/openstreetmap-carto-2.41.0/style.xml+g' /usr/local/etc/renderd.conf
# sed -i 's+HOST=tile.openstreetmap.org+HOST=postgis-db+g' /usr/local/etc/renderd.conf
# sed -i 's+plugins_dir=/usr/lib/mapnik/input+plugins_dir=/usr/lib/mapnik/3.0/input/+g' /usr/local/etc/renderd.conf
# cp /root/mod_tile/debian/renderd.init /etc/init.d/renderd
# chmod a+x /etc/init.d/renderd
# sed -i 's+DAEMON=/usr/bin/$NAME+/usr/local/bin/$NAME+g' /etc/init.d/renderd
# sed -i 's+DAEMON_ARGS=""+DAEMON_ARGS="-f -c /usr/local/etc/renderd.conf"+g' /etc/init.d/renderd
# sed -i 's+RUNASUSER=www-data+RUNASUSER=root+g' /etc/init.d/renderd
# mkdir -p /var/lib/mod_tile
# service renderd force-reload
# chown root:root /llvar/lib/mod_tile
# cp /usr/local/etc/renderd.conf /etc/renderd.conf


tail -F anything