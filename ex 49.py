print('vamos ver o seu indice de massa corporea com base no seu imc')

peso = float(input('digite seu peso : '))

altura = float(input('digite sua altura : '))

imc = peso / (altura)**2

if imc < 18.5:
    print('você está abaixo do peso ideal pois seu imc é {:.1f}.'.format(imc))

elif imc > 18.5 and imc <25:
    print('voce está no seu peso ideal pois seu imc é de {:.1f}.'.format(imc))

elif imc > 25 and imc < 40:
    print('você está com sobre peso pois seu imc é de {:.1f}.'.format(imc))

elif imc > 40:
    print('você está com obesidade morbida pois seu imc é de {:.1f}'.format(imc))

else:
    print('eu me caguei')
