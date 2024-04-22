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

def lesen(datei):
    """
    liest alle Worter von einer Datei und fugt sie in eine Liste ein (wann das Program beginnt)
    """

    pfad = open(datei, 'r')
    worter = pfad.read()
    pfad.close()
    return worter

def schreiben(datei, worter):
    """
    schreibt alle Worter aus einer Liste in einer Datei (wann das Program beendet)
    """

    pfad = open(datei, 'w')
    pfad.write(worter)
    pfad.close()