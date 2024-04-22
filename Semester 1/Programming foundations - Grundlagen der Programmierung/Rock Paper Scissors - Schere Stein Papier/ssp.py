import random

def zeichnung_lesen(list):
    """
    liest die Datei, die die Zeichnungen enthalt
    """

    pfad = open('ssp.txt', 'r')
    temp = pfad.readlines()
    pfad.close()
    for i in temp:
        list.append(i)

def zeichnen(wahl, zeichnung_list):
    """
    zeichnet eine Zeichnung
    """

    for j in range(len(zeichnung_list)):
        if zeichnung_list[j].strip() == wahl:
            j += 1
            while zeichnung_list[j].strip() != '*':
                print(zeichnung_list[j].strip("\n"))
                j += 1

def gewinner(cnt):
    if cnt >= 2:
        print("Der Benuzer hat gewonnen")
    else:
        print("Der Computer hat gewonnen")


def uberprufen(wahl):
    wahle = ['Schere', 'Stein', 'Papier']
    if wahl not in wahle:
        print("Wahl existiert nicht")
        return False
    return True

def kampfen(wahl1, wahl2):
    if wahl1 == wahl2:
        return 2
    if wahl1 == 'Schere' and wahl2 == 'Papier':
        return 1
    if wahl1 == 'Stein' and wahl2 == 'Schere':
        return 1
    if wahl1 == 'Papier' and wahl2 == 'Stein':
        return 1
    return 0

def spiel(benutzer, runde, zeichnen_list):
    computer = random.choice(['Schere', 'Stein', 'Papier'])
    print("Benutzer hat " + benutzer + " gewahlt")
    zeichnen(benutzer, zeichnen_list)
    print("Computer hat " + computer + " gewahlt")
    zeichnen(computer, zeichnen_list)
    ergebnis = kampfen(benutzer, computer)
    if ergebnis == 2:
        print("Remise")
    elif ergebnis == 1:
        print("Der Benutzer hat Runde " + str(runde) + " gewonnen")
    else:
        print("Der Computer hat Runde " + str(runde) + " gewonnen")
    return ergebnis

def main():
    """
    ruft alle wichtige Funktionen
    """

    runde=1
    cnt=0
    zeichnung_list = [ ]
    zeichnung_lesen(zeichnung_list)
    while runde <= 3 and cnt != 2 :
        print("\n"+"Schere? Stein? Papier?")
        benutzer = input("Antwort=")
        if uberprufen(benutzer):
            ergebnis = spiel(benutzer, runde, zeichnung_list)
            if ergebnis != 2:
                runde += 1
                cnt += ergebnis
    gewinner(cnt)

main()
