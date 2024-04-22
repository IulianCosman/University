import turtle
import math
from threading import Thread


def r(l1, l2, p):
    p.forward(l1)
    p.left(90)
    p.forward(l2)
    p.left(90)
    p.forward(l1)
    p.left(90)
    p.forward(l2)


def L3_1():
    t = turtle.Pen()
    r(200, 100, t)
    t.left(90)
    t.up()
    t.forward(75)
    t.left(90)
    t.forward(37)
    t.right(90)
    t.down()
    r(50, 25, t)
    t.reset()


def L3_2():
    t = turtle.Pen()
    t.left(90)
    t.pensize(5)
    for i in range(220):
        t.right(1)
        t.forward(1)
    t.setpos(0, -150)
    t.up()
    t.setpos(0, 0)
    t.setheading(90)
    t.down()
    for i in range(220):
        t.left(1)
        t.forward(1)
    t.setpos(0, -150)
    t.reset()


def rr(l1, l2, pp, qq):
    pp.forward(l1)
    qq.forward(l1)
    pp.left(90)
    qq.left(90)
    pp.forward(l2)
    qq.forward(l2)
    pp.left(90)
    qq.left(90)
    pp.forward(l1)
    qq.forward(l1)
    pp.left(90)
    qq.left(90)
    pp.forward(l2)
    qq.forward(l2)


def haus(p, q):
    p.right(90)
    q.right(90)
    rr(200, 100, p, q)
    p.right(135)
    q.right(135)
    p.forward(50 * math.sqrt(2))
    q.forward(50 * math.sqrt(2))
    p.right(90)
    q.right(90)
    p.forward(50 * math.sqrt(2))
    q.forward(50 * math.sqrt(2))
    p.right(45)
    q.right(45)
    p.up()
    q.up()
    p.forward(25)
    q.forward(25)
    p.right(90)
    q.right(90)
    p.forward(20)
    q.forward(20)
    p.down()
    q.down()
    rr(60, 50, p, q)
    p.right(180)
    q.right(180)
    p.up()
    q.up()
    p.forward(75)
    q.forward(75)
    p.right(90)
    q.right(90)
    p.down()
    q.down()
    rr(60, 100, p, q)


def L3_3():
    t = turtle.Pen()
    tt = turtle.Pen()
    tt.up()
    tt.forward(120)
    tt.down()
    haus(t, tt)
    t.reset()
    tt.reset()


def L3():
    print("Wählen Sie eine Zeichnung aus:")
    print("1.Rechteck")
    print("2.Herz")
    print("3.Häuser")
    p = int(input("Zeichnung="))
    if p == 1:
        L3_1()
    if p == 2:
        L3_2()
    if p == 3:
        L3_3()


L3()

