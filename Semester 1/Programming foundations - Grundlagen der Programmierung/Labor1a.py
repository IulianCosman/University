def is_prim(n):
    if n<2:
        return False
    for d in range(2, n):
        if n%d==0:
            return False
    return True


def ex_a():
    n= int(input("n: "))
    for i in range(n):
        if is_prim(i):
            print(i)

#ex_a()

def ex_b1():
    lista= [
                0, 1, 2, 3, 4,
                -1, 10, 12, 14, 20, 30, 101,
                4, 5, 11, 12, 13, 14, 15, 16
            ]
    rezultat= [ ]
    poz=0
    lmax=0
    for i in range(1, len(lista)-1):
         l=0
         for j in range(i+1, len(lista)):
             if lista[j]>lista[j-1]:
                 l=l+1
             else:
                 break
         if l>lmax:
            lmax=l
            poz=i
    #for i in range(poz, poz+lmax+1):
        #rezultat.append(lista[i])
    rezultat=lista[poz:poz+lmax+1]
    print(rezultat)

def ex_b2():
    lista= [
                0, 1, 2, 3, 4,
                -1, 10, 12, 14, 20, 30, 101,
                4, 5, 11, 12, 13, 14, 15, 16
            ]
    l=0
    temp=[]
    rezultat=[]
    for i in range(len(lista)-1):
        if lista[i]<lista[i+1]:
            temp.append(lista[i])
        else:
            temp.append(lista[i])
            if len(temp)>len(rezultat):
                rezultat=temp
            temp= []
    if lista[-2]<lista[-1]:
        temp.append(lista[-1])
    if len(temp)>len(rezultat):
        rezultat=temp
    print(rezultat)
ex_b2()
