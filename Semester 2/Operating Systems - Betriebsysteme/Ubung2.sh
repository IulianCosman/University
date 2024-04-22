#Zeigen Sie in der Standardausgabe die Namen der Dateien an, die ein bestimmtes Wort enthalten. Die Dateien und das Wort werden als Parameter in der Befehlszeile angegeben. Der erste Parameter ist immer der Dateiname. Zeigen Sie auch die Anzahl dieser Dateien an. Die Dateinamen werden einzeln in einer Zeile angezeigt. Die Wörter werden als durch Leerzeichen getrennt betrachtet.

#!/bin/bash

if [ $# -lt 2 ]; then
        echo "Sie mussen 2 oder mehr Parameter eingeben."
        exit 1
fi

wort=$1
shift
cnt=0

for datei in $@
do
        if datei_name=$(grep -l $wort $datei); then
                ((cnt++))
        fi
        echo "$datei_name"
done
echo "$cnt"
