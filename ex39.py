print('imagine que voce vai comprar uma passagem pra viajar e eu serei responsavel por calcular o preço da sua passagem com base nos km percorridos sendo 0,50R$ pra viagens abaixo de 200km e 0,45R$ pra viagens acima de 200')

km = float(input('qual a distancia da sua viagem?: km-'))

v1 = km * 0.50

v2 = km * 0.45

if km <= 200:

    print('sua viagem custaria R${}'.format(v1))

elif km >= 200:

    print('sua viagem custaria R${}'.format(v2))
