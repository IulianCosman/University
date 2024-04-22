from S6_func import *
from S6_read import *
from S6_write import *

def main():

    word="surprise"
    list=[]
    guess=[]
    letters=[]
    lista_word(list, word)
    lista_guess(guess, len(word))
    output_hangman(guess)
    lives=6
    while lives>0:
        output_lives(lives)
        letter=input_letter()
        letters.append(letter)
        if letter not in list:
            lives-=1
        else:
            list_modify(list, guess, letter)
        output_hangman(guess)
        if list_verify(guess):
            lives=-1
    if lives==0:
        output_false()
    output_file(letters, word)

main()