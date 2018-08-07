rm osm-tile-server/map/done.txt
# rm -f osm-tile-server/map/*
# mkdir osm-tile-server
# mkdir osm-tile-server/map
# wget -c -O osm-tile-server/map/map.osm.pbf ${OSM_MAP_URL}
# wget -c -O osm-tile-server/map/openstreetmap-carto.style https://raw.githubusercontent.com/gravitystorm/openstreetmap-carto/master/openstreetmap-carto.style
# ls -la osm-tile-server/map
# PGPASSWORD=${POSTGRES_PASSWORD} osm2pgsql -c --slim -C 2000 -H postgis-db -d ${POSTGRES_DB} --username ${POSTGRES_USER} \
#  -S osm-tile-server/map/openstreetmap-carto.style osm-tile-server/map/map.osm.pbf
# tail -F anything
cat > osm-tile-server/map/done.txt