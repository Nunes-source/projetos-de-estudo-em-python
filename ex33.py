#sempre que usar split e quiser indicar uma das partes divididas o correto é sempre usar [*numero desejado*]

print('olá!')

nc = str(input('qual o seu nome completo?')).strip()

n1 = nc.split()

print('seu primeiro nome é:{}'.format(n1[0]))

if n1[1] in ('de', 'DE'):
    print('e o seu segundo nome é:{}'.format(n1[2]))

else:
    print('seu segundo nome é {}'.format(n1[1]))
