# 4

def str_find(target, source):  # cauta un subsir intr-un sir si returneaza pozitia
    poz = 0
    cnt = 0
    for i in range(len(target) + 1):
        if cnt == len(source):
            # print(poz+1)
            # break
            return poz + 1
        if target[i] == source[cnt]:
            if cnt == 0:
                poz = i
            cnt += 1
        else:
            poz = 0
            cnt = 0


i = str_find("testing", "ing")


# print(i)

# 5

def f(sir, index):  # modifica elementele din sir + index
    temp = ' '
    for i in range(len(sir)):
        c = chr(ord(sir[i]) + index)
        temp = temp + c
    return temp


x = f("abc", 1)

#print(x)

