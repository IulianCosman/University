def lesen_input(nachricht):
    """
    liest eine Nachricht
    """

    return input(nachricht)

def schreiben_output(nachricht):
    """
    schreibt eine Nachricht
    """

    print(nachricht)

def lesen(worterbuch):
    """
    liest alle Zeichen von einer Datei und fugen sie in dem Worterbuch ein (wann das Program beginnt)
    """

    pfad = open("Zeichen.txt", 'r')
    line = pfad.readline()
    while line != '':
        schlussel = line.strip()
        line = pfad.readline()
        list = line.split()
        worterbuch[schlussel] = list
        line = pfad.readline()
    pfad.close()

def schreiben(worterbuch):
    """
    schreibt alle Zeichen aus dem Worterbuch in einer Datei (wann das Program beendet)
    """

    pfad = open("Zeichen.txt", 'w')
    for schlussel in worterbuch:
        pfad.write(schlussel)
        pfad.write('\n')
        for i in worterbuch[schlussel]:
            pfad.write(i)
            pfad.write(' ')
        pfad.write('\n')
    pfad.close()
