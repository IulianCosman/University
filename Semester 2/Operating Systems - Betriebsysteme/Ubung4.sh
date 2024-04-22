#Zeigen Sie für jede eingegebene Datei den Namen und die durchschnittliche Anzahl der Wörter pro Datei an. Zeigen Sie auch die durchschnittliche Anzahl von Wörtern für alle eingegebenen Dateien an. Wörter werden durch Leerzeichen getrennt. Die Dateien werden in der Befehlszeile eingegeben. Das Ergebnis wird in der Standardausgabe im folgenden Format angezeigt: für jede Datei wird der erforderliche Name und die erforderliche Nummer angezeigt (für jede Datei wird eine neue Zeile verwendet). Die Daten werden durch Leerzeichen getrennt. Die durchschnittliche Anzahl von Wörtern für alle Dateien wird am Ende in einer neuen Zeile angezeigt.

#!/bin/bash

if [ $# -lt 1 ]; then
	echo "Sie mussen ein oder mehr Parameter eingeben"
	exit 1
fi

for datei in $@
do
	worter=0
	awk '{ ((worter=worter+NF)) } END { print FILENAME, worter/NR }' $datei
done

awk '{ ((worter=worter+NF)) } END { print worter/NR }' $@

