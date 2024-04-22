from S6_write import *

def lista_word(l, w):
    for i in w:
        l.append(i)

def lista_guess(l, n):
    for i in range(n):
        l.append('_')

def list_verify(l):
    if '_' not in l:
        output_done()
        return True
    return False

def list_modify(l1, l2, let):
    for i in range(len(l1)):
        if l1[i]==let:
            l2[i]=let
            l1[i]='_'