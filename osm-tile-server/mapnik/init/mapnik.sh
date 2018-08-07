cd tools/carto
# ./get-shapefiles.sh
##update nodejs
apt -f install -y
apt purge nodejs-legacy nodejs -y
apt install nodejs npm -y
npm install millstone carto -y
npm install -g carto -y
echo "installing is done"
echo "prepare the xml style"
carto project.mml > style.xml
cat > done.txt
ln -s /usr/lib/mapnik/3.0/input tools/carto/
