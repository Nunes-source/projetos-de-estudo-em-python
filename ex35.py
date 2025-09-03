p = input('qual o nome do aluno? :')

n1 = float(input('digite uma nota pra fazer uma média de um aluno :'))

n2 = float(input('agora digite a segunda nota :'))

n3 = float(input('se por acaso tiver uma terceira nota :'))

s1 = float(input('alguma subtração na nota por mal comportamento etc? :'))

nf = n1 + n2 + n3 - s1

if nf <= 50:

    print('O aluno {:} não atingiu a media necessaria...'.format(p))

elif nf <= 99:

    print('Parabens pro aluno {}, pois ele atingiu a media necessaria...'.format(p))

else:

    print('O aluno {} atingiu a média com a nota maxima!!!...'.format(p))
