def L2_1():
    lista = [11, 12, 13, 11]
    temp = []
    for i in lista:
        if i not in temp:
            temp.append(i)
    lista = temp
    print(lista)


# L2_1()

def s(a, b):
    return a % 10 == b // 10 and b % 10 == a // 10


def L2_2():
    lista = [11, 12, 13, 14, 55, 12, 21, 13, 12, 32, 23, 56, 65, 11]
    cnt = 0
    for i in range(len(lista) - 1):
        for j in range(i + 1, len(lista)):
            if s(lista[i], lista[j]):
                cnt += 1
    print(cnt)


# L2_2()

def L2_3():
    n = 0
    lista = [11, 98, 23, 45, 92, 88]
    for i in range(len(lista) - 1):
        for j in range(i + 1, len(lista)):
            if lista[i] < lista[j]:
                lista[i], lista[j] = lista[j], lista[i]
    n = lista[0]
    for i in range(1, len(lista)):
        n = n * 100 + lista[i]
    print(n)


# L2_3()

def en_de(lista, cheie, ed):
    if ed == 1:
        for i in range(1, len(lista)):
            lista[i] += cheie
    else:
        for i in range(1, len(lista)):
            lista[i] -= cheie
    print(lista)


def L2_4():
    lista = [13, 25, 72, 10, 29, 21, 25]
    ed = int(input("Encrypt/ Decrypt="))
    en_de(lista, lista[0], ed)


# L2_4()

def res(a, b, n1, n2):
    if "x" in a:
        a = a.replace("x", str(n1))
    if "y" in a:
        a = a.replace("y", str(n2))
    if "x" in b:
        b = b.replace("x", str(n1))
    if "y" in b:
        b = b.replace("y", str(n2))
    if eval(a) == eval(b):
        return True
    else:
        return False


def L2_5():
    lista = [11, 22, 13, 25, 27, 10, 19, 21, 25, 80]
    formula = input("Formula:")
    el = formula.split("=")
    for i in lista:
        if res(el[0], el[1], i // 10, i % 10) or res(el[0], el[1], i % 10, i // 10):
            print(i)


# L2_5()

def L2_6():
    lista = [11, 12, 23, 42, 22, 43, 56, 56, 64, 42, 23, 43]
    temp = []
    result = []
    for i in range(1, len(lista) - 1):
        if lista[i - 1] % 10 == lista[i] // 10:
            temp.append(lista[i])
        else:
            temp.append(lista[i])
            if len(temp) > len(result):
                result = temp
            temp = []
    if lista[-2] % 10 == lista[-1] // 10:
        temp.append(lista[-1])
    if len(temp) > len(result):
        result = temp
    print(result)


# L2_6()

def kgv(a, b):
    for i in range(2, min(a, b) + 1):
        cnt = 0
        while not a % i and not b % i:
            b //= i
            a //= i
            cnt += 1
        while cnt:
            a = a * i
            cnt -= 1
    return a * b


def L2_7():
    lista = [23, 21, 12, 13, 14, 55, 34, 37, 28]
    fr = int(input("from="))
    to = int(input("to="))
    res = lista[fr]
    for i in range(fr, to):
        res = kgv(res, lista[i + 1])
    print(res)

# L2_7()
