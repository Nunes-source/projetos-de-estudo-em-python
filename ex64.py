import random

contagem_adv = 0

print('vamos fazer um jogo de adivinhação')
print('pensarei em um número de 1 a 10 e você deverá adivinhar.')
print('não se preocupe, você vai ter chances infinitas até acertar. :) ')

lista = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

num_al = random.choice(lista)

p = int(input('qual o número você acha que eu estou pensando?: '))

if p == num_al:
    print('wow, você conseguiu adivinhar de primeira')
    contagem_adv += 1
else:

    while p != num_al:
      contagem_adv += 1
      if p > num_al:
          p = int(input('menor... tente novamente'))
      elif p < num_al:
          p = int(input('maior... tente novamente'))

      if p == num_al:
          print('conseguiu, adivinhou o número no qual eu estava em mente, e precisou apenas de {} tentativas.'.format(contagem_adv))
          break
print('parabéns')
