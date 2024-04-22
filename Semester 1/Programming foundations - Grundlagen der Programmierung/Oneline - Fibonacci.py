f = lambda x, y, n, list: f(x+y, x, n-1, list+[x]) if n > 0 else print(list)
f(1, 1, 10, [])
