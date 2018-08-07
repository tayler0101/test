rm -r tools/carto
mkdir tools/carto
cd tools/carto

wget https://codeload.github.com/gravitystorm/openstreetmap-carto/tar.gz/v${CARTO_VERSION}
tar xvf v${CARTO_VERSION}
mv -f openstreetmap-carto-${CARTO_VERSION}/* ./
rm -r openstreetmap-carto-${CARTO_VERSION}
rm v${CARTO_VERSION}
mv /usr/local/bin/get-shapefiles.sh get-shapefiles.sh 


./get-shapefiles.sh 
# rm data/*.zip data/*.tgz data/*.tar.gz