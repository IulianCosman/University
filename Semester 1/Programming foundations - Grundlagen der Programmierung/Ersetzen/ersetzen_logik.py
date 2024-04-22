from ersetzen_in_out import *

def ersetzen(datei, wort1, wort2, worter):
    """
    ersetzt wort1 mit wort2 an alle Stelle und rechnet und gibt die Anzahl der Ersetzungen zuruck
    """

    cnt = 0
    while wort1 in worter:
        worter = worter.replace(wort1, wort2, 1)
        cnt += 1
    return cnt, worter

def ergebnis(wort1, wort2, cnt):
    """
    schreibt eine entsprechende Nachricht, ob die Ersetzung moglich war
    """

    if cnt!=0:
        schreiben_output("Ersetz '" + wort1 + "' durch '" + wort2 + "' an " + str(cnt) + " Stellen")
    else:
        schreiben_output("Wort wurde nicht gefunden")