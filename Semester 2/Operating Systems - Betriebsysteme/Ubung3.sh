#Ersetzen Sie das dritte Wort in jeder Zeile einer Datei durch das erste Wort. Die Wörter werden durch ':' abgetrennt und enthalten nur Buchstaben und Zahlen. Die zu verarbeitende Datei wird durch den ersten Parameter in der Befehlszeile angegeben. Das Ergebnis wird in der Standardausgabe angezeigt. Es wird davon ausgegangen, dass die Datei in allen Zeilen mindestens 3 Wörter enthält.

#!/bin/bash

if [ $# -lt 1 ]; then
        echo "Sie mussen ein Parameter eingeben"
        exit 1
fi

datei=$1

sed 's/\([^:]*\):\([^:]*\):\([^:]*\)/\1:\2:\1/' $datei

