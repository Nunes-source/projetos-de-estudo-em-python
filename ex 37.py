print('vamos ver se você esta seguindo as placas de segurança...')

v = float(input('digite em apenas numeros a velocidade o seu carro está andando na via? :'))

if v <= 80:

    print('ebaaaaa, você não foi mutado d:')

elif v >= 80:

    multa = (v-80) * 7

    print('você foi mutado em {:.2f} por violar os alertas de segurança da via e ultrapaçar a velocidade de 80 kmh'.format(multa))


else:

    print('eu disse apenas numeros >:( ...')
