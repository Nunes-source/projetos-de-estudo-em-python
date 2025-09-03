#desafio pra ver se algm deve se vai ou se ja perdeu o tempo de se alistar no exercito

print('esse programa feito em 2023 indica se você esta na hora, ja passou ou quanto tempo falta pra se alistar no exercito')

ano = int(input('qual o ano que você nasceu?'))

anoa = 2023 - ano

anob = ano - 2023 + 18

if ano == 2005:
    print('você esta na idade indicada de alistameto!!')

elif ano < 2005:
    print('você ja passou da idade adequada há {} anos, você deve se alistar imediatamente.'.format(anoa))

elif ano > 2005:
    print('você ainda não está com a idade adequada de alistamento, ainda faltam {} anos'.format(anob))
