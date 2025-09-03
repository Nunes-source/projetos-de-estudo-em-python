c = 3

contador = int(input('digite um valor: '))

n1 = 0

n2 = 1

print('{} - {}'.format(n1, n2), end=' ')

while c <= contador:
    c += 1
    n3 = (n1 + n2)
    print('-', n3, '-', end=' ')
    n1 = n2
    n2 = n3
print('fim')
