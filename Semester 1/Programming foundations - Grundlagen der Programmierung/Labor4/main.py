from L4_logik import *

def main():
    """
    ruft die wichtigen Funktionen
    """

    wortb = {}
    lesen(wortb)
    antwort = menu()
    if int(antwort) == 1:
        L4_1(wortb)
    elif int(antwort) == 2:
        L4_2(wortb)
    else:
        schreiben_output("Wahl existiert nicht")
    schreiben(wortb)

main()



