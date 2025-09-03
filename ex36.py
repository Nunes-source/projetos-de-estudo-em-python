#fazer um programa que pense em um numero aleatorio de 1 até 5 e que peça pra voce tentar acertar o numero que ele escolheu, se voce acertar ou errar ele vai te indicar se voce errou ou acertou.


import random

print('vamos fazer um jogo de adivinhação!')

nc = random.choice([1, 2, 3, 4, 5])

r = int(input('em qual numero de um a cinco eu estou pensando?'))

if r == nc:

    print('acertou mizeravi')

else:

    print('errou trouxa XD')
