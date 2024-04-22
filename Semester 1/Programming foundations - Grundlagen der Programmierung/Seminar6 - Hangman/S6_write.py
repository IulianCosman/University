def output_done():
    print("Felicitari! :)")

def output_false():
    print("Ai pierdut! :(")

def output_lives(x):
    print(x,' vieti ramase')

def output_hangman(l):
    print(' '.join(l))

def output_file(l, w):
    f=open('hangman_out.txt','w')
    temp=[]
    guess=[]
    for j in w:
        temp.append(j)
        guess.append('_')
    for i in range(len(l)):
        f.write(l[i])
        f.write('\n')
        for j in range(len(temp)):
            if temp[j]==l[i]:
                guess[j]=temp[j]
        f.write(' '.join(guess))
        f.write('\n')

