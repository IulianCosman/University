#In einem Programm vom Typ ".c" ist ein Schreibfehler aufgetreten, und der Parameter einer Funktion muss durch einen bestimmten Wert ersetzt werden. Schreiben Sie ein Skript, das für eine bestimmte Funktion bei jedem Aufruf den Funktionsparameter durch einen bestimmten Wert ersetzt. Das Skript empfängt über den ersten Parameter in der Befehlszeile den Ordner, in dem sich das Programm befindet, über den zweiten Parameter den Namen der Funktion und über den dritten Parameter den Wert, durch den es ersetzt werden muss. Das Skript zeigt in der Standardausgabe die Anzahl der vorgenommenen Ersetzungen an.

#!/bin/bash

if [ $# -ne 3 ]; then
  echo "Sie mussen 3 Parameter eingeben"
  exit 1
fi

ordner="$1"
name="$2"
wert="$3"
cnt=0

for datei in "$ordner"/*.c
do
sed -i "s/\("$name"(\)[^)]*\()\)/\1"$wert"\2/" $datei
done

grep -c ''$name'('$wert')' "$ordner"/*.c
