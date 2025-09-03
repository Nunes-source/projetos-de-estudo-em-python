print('vamos calcular o preço final do produto com base na forma de pagamento')

a = float(input('digite o valor base do produto - '))

b = int(input('agora pressione [1] para pagar a vista no cartão, [2] para especie ou cheque, [3] para 2x no cartão e [4] para 3x no cartão - '))

if b == 1:
    print(a - (a / 100 * 10))

elif b == 2:
    print(a - (a / 100 * 10))

elif b == 3:
    print(a)

elif b == 4:
    print(a + (a / 100 * 20 ))