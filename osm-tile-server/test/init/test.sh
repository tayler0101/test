# while [ ! -f osm-tile-server/map/done.txt ]
# do
#   echo -e "\e[44;5mwaiting for mapnik to be done\e[0m"
#   sleep 10
# done
# # carto
# wget https://codeload.github.com/gravitystorm/openstreetmap-carto/tar.gz/v${CARTO_VERSION}
# tar xvf v${CARTO_VERSION}
# rm v${CARTO_VERSION}


# mv /usr/local/bin/get-shapefiles.sh openstreetmap-carto-${CARTO_VERSION}/get-shapefiles.sh 
# cd openstreetmap-carto-${CARTO_VERSION}/
# ./openstreetmap-carto-${CARTO_VERSION}/get-shapefiles.sh

# #render tools
# # cd tools
# # rm -r mod_tile
# # cd /
# git clone https://github.com/openstreetmap/mod_tile.git
# cd mod_tile
# sed -i ${textToReplace}${MAX_ZOOM}${param} renderd.conf
# ./autogen.sh
# ./configure
# make
# make install
# make install-mod_tile
# cd /
# # mapnik

# # apt -f install -y
# # apt purge nodejs-legacy nodejs -y

# # cd /openstreetmap-carto-${CARTO_VERSION}/
# carto /openstreetmap-carto-${CARTO_VERSION}/project.mml > /openstreetmap-carto-${CARTO_VERSION}/style.xml
# # cd /
# #openstreetmap-carto-4.13.0

# #render toos

# echo -e "\e[44;5mStart configuring the render the tools\e[0m"
# # echo -e "\e[0m"
# sed -i 's+XML=/home/jburgess/osm/svn.openstreetmap.org/applications/rendering/mapnik/osm-local.xml+XML=/openstreetmap-carto-4.13.0/style.xml+g' /usr/local/etc/renderd.conf
# sed -i 's+HOST=tile.openstreetmap.org+HOST=postgis-db+g' /usr/local/etc/renderd.conf
# sed -i 's+plugins_dir=/usr/lib/mapnik/input+plugins_dir=/usr/lib/mapnik/3.0/input/+g' /usr/local/etc/renderd.conf
# cp /mod_tile/debian/renderd.init /etc/init.d/renderd
# chmod a+x /etc/init.d/renderd
# sed -i 's+DAEMON=/usr/bin/$NAME+/usr/local/bin/$NAME+g' /etc/init.d/renderd
# sed -i 's+DAEMON_ARGS=""+DAEMON_ARGS="-c /usr/local/etc/renderd.conf"+g' /etc/init.d/renderd
# sed -i 's+RUNASUSER=www-data+RUNASUSER=root+g' /etc/init.d/renderd
# mkdir -p /var/lib/mod_tile
# # chown root:root /llvar/lib/mod_tile
# # cp /usr/local/etc/renderd.conf /etc/renderd.conf
# /sbin/ldconfig -v

# # apache
# cat <<EOF>> /etc/apache2/mods-available/mod_tile.load
# LoadModule tile_module /usr/lib/apache2/modules/mod_tile.so
# EOF
# ln -s /etc/apache2/mods-available/mod_tile.load /etc/apache2/mods-enabled/
# service apache2 restart
tail -F anything