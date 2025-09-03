print('digite 3 valores e vamos descobrir se eles formam um triangulo 0:')

a = float(input('digite o valor da lateral esquerda :'))

b = float(input('digite o segundo valor da lateral direita :'))

c = float(input('agora digite o terceiro valor da base :'))

if a + b > c:

    print('sim, é possivel fazer um triangulo com esses seguimentos...')


else:

    print('não seria possivel fazer um triangulo com esses seguimentos...')