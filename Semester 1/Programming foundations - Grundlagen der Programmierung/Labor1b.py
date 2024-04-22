def prim(a):
    ok = 1
    for i in range(2, a):
        if not a % i:
            ok = 0
            break
    return ok


def ex_a():
    n = int(input("n= "))
    for i in range(2, n + 1):
        if prim(i) and not n % i:
            cnt = 0
            while not n % i:
                cnt += 1
                n = n / i
            print(i, "->", cnt)


ex_a()


def r_prim(a, b):
    ok = 1
    for i in range(2, min(a, b) + 1):
        if a % i == 0 and b % i == 0:
            ok = 0
            break
    return ok


def ex_b():
    lista = [5, 14, 5, 6, 7, 9, 25, 13, 28, 25, 4, 6, 13, 28, 25, 27, 29, 81, 12, 2, 14, 5, 6, 7, 9, 25, 13, 28]
    temp = []
    result = []
    for i in range(len(lista) - 1):
        if r_prim(lista[i], lista[i + 1]):
            temp.append(lista[i])
        else:
            temp.append(lista[i])
            if len(result) < len(temp):
                result = temp
            temp = []
    if r_prim(lista[-2], lista[-1]):
        temp.append(lista[-1])
    if len(result) < len(temp):
        result = temp
    print(result)


ex_b()


