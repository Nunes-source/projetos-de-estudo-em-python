
r = 'f', 'm'

print('digite seu sexo -')

p = str(input('[F]/[M]: '))

while p not in r:
    p1 = str(input('[erro] digite novamente: '))
    if p1 == 'm' or p1 == 'f':
        print('entendido')
        break

print('fim')
