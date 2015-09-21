
cp index.html ~/clientslides
cp index.html ~/masterslides

cd ~/masterslides
nohup gnome-terminal -e "node plugin/multiplex" &

sleep 3

TOKENS=$(curl -s 0.0.0.0:1948/token)
echo "$TOKENS" > /tmp/tmp.json
SECRET=$(jq '.secret' /tmp/tmp.json)
SOCKID=$(jq '.socketId' /tmp/tmp.json)
echo "The secret is $SECRET"
echo "The socket ID is $SOCKID"

sed -i -- "s/%DATSECRET%/$SECRET/g" ~/masterslides/index.html
sed -i -- "s/%DATSECRET%/null/g" ~/clientslides/index.html

sed -i -- "s/%DATID%/$SOCKID/g" ~/masterslides/index.html
sed -i -- "s/%DATID%/$SOCKID/g" ~/clientslides/index.html

MAHIP=$(/sbin/ifconfig wlan1 | grep 'inet:' | cut -d: -f2 | awk '{ print $1}')

sed -i -- "s/%DATURL%/$MAHIP/g" ~/masterslides/index.html
sed -i -- "s/%DATURL%/$MAHIP/g" ~/clientslides/index.html

sed -i -- "s/%DATMASTER%/master/g" ~/masterslides/index.html
sed -i -- "s/%DATMASTER%/client/g" ~/clientslides/index.html

sed -i -- "s/%DATNOTES%/\{ src: 'plugin\/notes-server\/client.js', async: true \},/g" ~/masterslides/index.html
sed -i -- "s/%DATNOTES%//g" ~/clientslides/index.html

cd ~/masterslides
nohup gnome-terminal -e "static" &

cd ~/clientslides
nohup gnome-terminal -e "python -m SimpleHTTPServer" &

cd ~/masterslides
nohup gnome-terminal -e "node plugin/notes-server" &

echo "La IP es: $MAHIP"
