/sbin/ldconfig -v
cat <<EOF>> /etc/apache2/mods-available/mod_tile.load
LoadModule tile_module /usr/lib/apache2/modules/mod_tile.so
EOF
ln -s /etc/apache2/mods-available/mod_tile.load /etc/apache2/mods-enabled/
tail -F anything
