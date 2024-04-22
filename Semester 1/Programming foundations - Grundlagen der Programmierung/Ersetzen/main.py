from ersetzen_logik import *

def main():
    """
    ruft die wichtigen Funktionen
    """

    datei = lesen_input("Pfad zur Datei:")
    wort1 = lesen_input("Wort zu ersetzen:")
    wort2 = lesen_input("Ersatzwort:")
    worter = lesen(datei)
    cnt, worter = ersetzen(datei, wort1, wort2, worter)
    schreiben(datei, worter)
    ergebnis(wort1, wort2, cnt)

main()