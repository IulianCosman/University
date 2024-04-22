#1

import random

class Die:
    def __init__(self, sides=6):
        self.sides=sides

    def roll(self):
        return random.randint(1, self.sides)

def main():
    d = Die(10)  # d=Die()
    r = d.roll()
    while r != 6:
        print(r)
        r = d.roll()

#main()

#2

class Bruch:
    def __init__(self, n, m):
        self.n=n
        self.m=m

    def ext(self, k):
        self.n*=k
        self.m*=k

    def sim(self, k):
        self.n//=k
        self.m//=k

    def ext_new(self, k):
        return Bruch(self.n*k, self.m*k)

    def print1(self):
        print(str(self.n)+'/'+str(self.m))

    def print_fancy(self):
        print(f'{self.n}/{self.m}')

    def print_old(self):
        print('%d/%d'%(self.n,self.m))

def main2():
    b=Bruch(1,2)
    b.ext(10)
    print(b.n, b.m)
    g=b.ext_new(10)
    print(g.n, g.m)
    print(b.n, b.m)
    g.print1()
    g.print_fancy()
    g.print_old()

#main2()

#3

class Auto:
    def __init__(self, b, f, m):
        self.b=b
        self.f=f
        self.m=m

class Statistics:
    def __init__(self):
        self.autos=[]

    def add_auto(self, auto):
        self.autos.append(auto)

    def aaf(self, f):
        c=0
        for auto in self.autos:
            if auto.f==f:
                c+=1
        return c

    def amm(self, m):
        b=0
        c=0
        for auto in self.autos:
            if auto.m==m:
                c+=1
                b+=auto.b

        return b//c

def main3():
    s=Statistics()
    a=Auto(2000, 'n', 'x')
    q=Auto(1000, 'g', 'x')
    s.add_auto(a)
    s.add_auto(q)
    print(s.amm('x'))

#main3()

#5
import turtle
from math import sqrt

class Dreieck:
    def __init__(self, p1, p2, p3):
        self.p1=p1
        self.p2=p2
        self.p3=p3

    def z(self):
        t=turtle.Pen()
        t.up()
        t.setpos(self.p1)
        t.down()
        t.setpos(self.p2)
        t.setpos(self.p3)
        t.setpos(self.p1)

    def p(self):
        l1 = sqrt((self.p1[0] - self.p2[0]) ** 2 + (self.p1[1] - self.p2[1]) ** 2)
        l2 = sqrt((self.p3[0] - self.p2[0]) ** 2 + (self.p3[1] - self.p2[1]) ** 2)
        l3 = sqrt((self.p1[0] - self.p3[0]) ** 2 + (self.p1[1] - self.p3[1]) ** 2)
        return l1+l2+l3

    def m(self):
        s = turtle.Pen()
        s.up()
        s.setpos(self.p1)
        s.down()
        s.setpos(-self.p2[0], -self.p2[1])
        s.setpos(-self.p3[0], -self.p3[1])
        s.setpos(self.p1)
        s.up()
        s.setpos(self.p1)
        s.down()
        s.setpos(self.p2[0], -self.p2[1])
        s.setpos(self.p3[0], -self.p3[1])
        s.setpos(self.p1)
        s.up()
        s.setpos(self.p1)
        s.down()
        s.setpos(-self.p2[0], self.p2[1])
        s.setpos(-self.p3[0], self.p3[1])
        s.setpos(self.p1)
        turtle.exitonclick()



def main5():
    P1=(0,0)
    P2=(250, 40)
    P3=(300, 260)
    d=Dreieck(P1, P2, P3)
    d.z()
    print(d.p())
    d.m()

#main5()