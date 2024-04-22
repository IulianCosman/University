#Erstellen Sie ein Shell-Skript, das eine Datei als Befehlszeilenargument bekommt. Das Skript zeigt in der Standardausgabe die Zeilen der Datei an, in denen sich das Wort "in" befindet und auch alle Wörter, die mit dem Präfix "in" beginnen. Wörter sind durch Leerzeichen abgetrennt.

#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "One argument is needed."
    exit 1
fi

filename=$1

grep -i "\<in" $1
