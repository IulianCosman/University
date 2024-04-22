#1 & #2

def add(a,b):                     #adunarea a 2 fractii
    return {'m': a['m'] * b['n'] + a['n'] * b['m'], 'n': b['n'] * a['n']}

def read():                       #citirea unei fractii cu dictionar
    m=int(input("m="))
    n=int(input("n="))
    return {'m':m, 'n':n}

def cmmdc(x,y):
    if x>y:
        while x>y:
            x=x-y
        return x
    else:
        while y>x:
            y=y-x
        return y

def red(a):                         #afiseaza fractia ireductibila in urma adunarii a 2 fractii
    return {'m': a['m']//cmmdc(a['m'],a['n']), 'n': a['n']//cmmdc(a['m'],a['n'])}

#print(red(add(read(), read())))

#3.1

def insert1(l,a):     #adauga elemntul a la final
    l.append(a)

def insert2(l,a,p):   #adauga elementul a la pozitia p
    l.insert(p,a)

#3.2

def delete(l,p):     #sterge elementul de la pozitia p
    l.pop(p)

#3.3

lista=[ {'m':1, 'n':2}, {'m':1, 'n':3}, {'m':2, 'n':3} ]
def summe(l):
    s=l[0]
    for i in range(1,len(l)):
        s=add(l[i],s)
    print(red(s))

#summe(lista)

