print('---PROGRAMA TABUADA---')

while True:
    n = int(input('você deseja ver a tabuada de qual número?: '))
    if n <= 0: #essa é a condição de finalização do laçõ, aqui, colocamos ela logo no começo ja que não interfere em nada o nosso calculo, e também fica melhor pra compreender
        break
    print('-' * 30) #estilização do código
    for t in range(1, 11):
        print(n, 'X', t, '=', n * t)#poderia ter usado -fprint- pra ficar melhor de entender, más ta valendo
    print('-' * 30)
    continue#repete o código até que a condição de finalização seja acionada

print('fim')
