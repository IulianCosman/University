#1

#lista=[[4,3,10],
#       [1,2,10],
#       [1,1,8]]

def pz(x):
    s=0
    for i in range(1, x//2+1):
        if not x%i:
            s+=i
    if x==s:
        return True
    else:
        return False


def L5_1(lista):
    cnt=0
    for i in range(len(lista)):
        s=0
        for j in range(len(lista[1])):
            s+=lista[j][i]
        if pz(s):
            cnt+=1
    return cnt==len(lista[1])

#print(L5_1(lista))

#2

#lista=[[4,3,1],
#      [1,2,1],
#      [0,5,1]]

def L5_2(lista):

    res=[ ]
    for i in range(len(lista)):
        s=0
        for j in range(len(lista)):
            if i!=j:
                s+=lista[i][j]
        if s==lista[i][i]:
            res.append(True)
        else:
            res.append(False)
    return res

#print(L5_2(lista))

#3

#lista=[[1,2,3],
#       [6,5,4],
#       [7,8,9]]

def L5_3(lista):
    for i in range(len(lista)):
        for j in range(len(lista[1])):
            if not i%2 and j!=len(lista[1])-1:
                if lista[i][j]>lista[i][j+1]:
                    return False
            if i%2 and j!=len(lista[1])-1:
                if lista[i][j]<lista[i][j+1]:
                    return False
    for i in range(len(lista)-1):
        if lista[i][len(lista[1])-1]>lista[i+1][len(lista[1])-1]:
            return False
    return True

#print(L5_3(lista))

#4

def L5_4():
    f=open('fin.txt','r')
    temp=[]
    res=[]
    l=f.readline()
    while l!='':
        temp=l.split()
        lmax=0
        for i in temp:
            if len(i)>lmax:
                lmax=len(i)
        l=f.readline()
        res.append(lmax)
    return res

#print(L5_4())

#5

def pal(x):
    aux=x
    p=0
    while aux!=0:
        p=p*10+aux%10
        aux=aux//10
    return x==p

def L5_5():
    f=open('gin.txt','r')
    temp=[ ]
    lista=[ ]
    res={ }
    l=f.readline()
    while l!='':
        temp=l.split()
        for i in temp:
            lista.append(int(i))
        l=f.readline()
    for i in lista:
        cnt=0
        if pal(i):
            for j in lista:
                if j==i:
                    cnt+=1
            res[str(i)]=cnt
    print(res)

#L5_5()

def L5_6():
    f = open('gin.txt', 'r')
    g = open('out.txt', 'w')
    temp = []
    lista = []
    al=[ ]
    l = f.readline()
    while l != '':
        temp = l.split()
        for i in temp:
            lista.append(int(i))
        l = f.readline()
    for i in lista:
        if pal(i):
            if i not in al:
                g.write(str(i))
                g.write(' ')
        al.append(i)

#L5_6()
