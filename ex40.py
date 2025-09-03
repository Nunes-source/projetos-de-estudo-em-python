print('vamos descobrir se voce nasceu em um ano bissexto')

n = int(input('digite o ano que voce nasceu'))

rs = n / 4

if rs == int(rs):

    print('massa!, você nasceu em um ano bissexto...')

else:
    print('putz!, você não nasceu em um ano bissexto, por mais que não signifique muito...')