#Schreiben Sie ein Shell-Skript, das bestimmt, ob drei Zahlen pythagoreisch sind oder nicht. Die Zahlen werden als Parameter in die Befehlszeile eingegeben. Das Ergebnis wird in der Standardausgabe angezeigt: ja - falls die Zahlen pythagoreisch sind, nein - sonst.

#!/bin/bash

if [ $# -ne 3 ]
then
echo "Sie mussen 3 Parameter eingeben."
exit 1
fi

x=$1
y=$2
z=$3

if [ $((x*x + y*y)) -eq $((z*z)) ]
then
echo "ja"
elif [ $((x*x + z*z)) -eq $((y*y)) ]
then
echo "ja"
elif [ $((y*y + z*z)) -eq $((x*x)) ]
then
echo "ja"
else
echo "nein"
fi

