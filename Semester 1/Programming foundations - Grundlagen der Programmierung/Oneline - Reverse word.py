func=lambda: open('oneline_out.txt','w').write((open('oneline_in.txt','r').read())[::-1])
func()