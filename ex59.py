print('programa que le um numero inteiro de diz se é numero primo.')

contador = 0

p = int(input('digite um numero inteiro - '))

for n in range(1, p + 1):
    if p % n == 0:
        contador += 1

if contador > 2 or contador == 2:

    print('em uma contagem de 1 a 10 o número {} foi divisivel {} vezes por tanto ele não é primo.'.format(p, contador))

elif contador < 2:

    print('em uma contagem de 1 a 10 o número {} foi divisivel por menos de duas vezes por tanto ele é primo.'.format(p))


else:
    print('erro :(((')
    