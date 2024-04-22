from L4_in_out import *
import turtle

def menu():
    """
    kreiert das Menu und gibt die Antwort des Benutzers zuruck
    """

    schreiben_output("1. Textnachricht zeichnen"+"\n"+"2. Neues Wort hinzufügen")
    return lesen_input("Antwort=")

def zeichnen_anweisung(t, anweisung):
    """
    zeichnet eine Anweisung
    """

    if anweisung == "W":
        t.forward(10)
    if anweisung == "S":
        t.backward(10)
    if anweisung == "D":
        t.right(45)
    if anweisung == "A":
        t.left(45)
    if anweisung == "F":
        t.up()
    if anweisung == "G":
        t.down()

def zeichnen(schlussel, worterbuch, p):
    """
    zeichnet ein Zeichen/ einen Buchstabe durch Anweisungen
    """

    max_x = 0    # wir behalten die maximale Position auf die x-Achse, sodass wir Platz zwischen Zeichen lassen konnen
    for anweisung in worterbuch[schlussel]:
        zeichnen_anweisung(p, anweisung)
        if p.xcor() > max_x:
            max_x = p.xcor()
    p.up()       # wir lassen Platz zwischen die Zeichen
    p.setpos(max_x+5, 0)
    p.setheading(0)
    p.down()

def nachricht_zeichnen(nachricht, worterbuch):
    """
    zeichnet jede Zeichne von einer Nachricht
    """

    t = turtle.Pen()
    for i in range(len(nachricht)):
        zeichnen(nachricht[i], worterbuch, t)
    t.hideturtle()
    turtle.exitonclick()

def selbst_zeichnen(schlussel, worterbuch):
    """
    kreiert ein Zeichne mit der Hilfe von dem Benutzer und fugt das Zeichne im Worterbuch ein
    """

    p = turtle.Pen()
    anweisungen = ['W', 'S', 'D', 'A', 'F', 'G', '']
    list = []
    anweisung = 'W'
    while anweisung != '':
        anweisung = lesen_input("Anweisung=")
        if anweisung in anweisungen:
            zeichnen_anweisung(p, anweisung)
            list.append(anweisung)
        else:
            schreiben_output("Anweisung existiert nicht")
    worterbuch[schlussel] = list

def nachricht_uberprufen(nachricht, worterbuch):
    """
    uberpruft, ob eine Nachricht gezeichnet werden kann
    """

    for i in range(len(nachricht)):
        if nachricht[i] not in worterbuch:
            schreiben_output("Nachricht nicht moglich zu zeichnen")
            return False
    return True

def zeichen_uberprufen(zeichen, worterbuch):
    """
    uberpruft, ob ein Zeichne nicht schon existiert
    """

    if zeichen in worterbuch:
        schreiben_output("Uberschreiben")
        return False
    return True

def L4_1(worterbuch):
    """
    zeichnet eine Nachricht, die von dem Benutzer angegeben wird, falls es moglich ist
    """

    antwort = lesen_input("Nachricht=")
    if nachricht_uberprufen(antwort, worterbuch):
        nachricht_zeichnen(antwort, worterbuch)


def L4_2(worterbuch):
    """
    kreiert eine Zeichne, die von dem Benutzer angegeben wird, falls es moglich ist
    """

    zeichen = lesen_input("Zeichen=")
    if zeichen_uberprufen(zeichen, worterbuch):
        selbst_zeichnen(zeichen, worterbuch)
