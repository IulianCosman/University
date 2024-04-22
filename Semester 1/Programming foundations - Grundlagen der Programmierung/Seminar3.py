#1

def f(lista, x):                      #cauta daca exista 2 elemente care adunate sa fie o suma data
    for i in range(len(lista)-1):
        for j in range(i+1, len(lista)):
            if lista[i]+lista[j]==x:
                return i, j
    return None
lista=[1, 2, 3, 4]
x=5
p1, p2=f(lista, x)

#print(p1, p2)

#2

def sum(s1, s2):                   #adunarea a 2 numere ca stringuri
    s=' '
    aux=0
    for i in range(len(s1)-1, -1, -1):
        c=int(s1[i])+int(s2[i])
        c=c+aux
        if c>9:
            aux=c//10
            c=c%10
        else:
            aux=0
        s=str(c)+s
    if aux:
        s=str(aux)+s
    return s

#m=sum("80","23")
#print(m)

#3

def rev_v(x):         #inverseaza vocalele pe pozitii
    v='aeiou'
    temp= [ ]
    y=''
    for i in x:
        if i in v:
            temp.append(i)
    for i in range(len(x)):
        if x[i] in v:
            y=y+temp.pop()
        else:
            y=y+x[i]
    print(y)

#rev_v("terminator")

#4

matrix=[
    ['A', 'B', 'C', 'D'],
    ['L', 'E', 'G', 'H'],
    ['Q', 'R', 'T', 'F']
]

word='ALERT'

def pos(matrix, e):             #cauta pozitia unei litere in matrice
    for i in range(len(matrix)):
        for j in range(len(matrix)):
            if matrix[i][j] == e:
                return i, j

    return None, None
def vec(a,b, matrix):           #cauta daca doua litere sunt vecini
    ia,ja=pos(matrix,a)
    ib,jb=pos(matrix,b)
    if ia is None or ja is None or ib is None or jb is None:
        return false

    if ia==ib and (ja==jb-1 or ja==jb+1):
        return True
    if ja==jb and (ia==ib-1 or ia==ib+1):
        return True

    return False

def sol(matrix, word):               #cauta un cuvant in matrice
    cnt=0
    for i in range(len(word)-1):
        if vec(word[i],word[i+1], matrix):
            cnt+=1
    if cnt==len(word)-1:
        return True
    return False

#print(sol(matrix,word))

