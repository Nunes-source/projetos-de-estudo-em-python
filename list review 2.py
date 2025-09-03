#para o primeiro exemplo é bom lembrar de como os indices funcionam pra entender o codigo, o desafio é escolher um nome ou idade, ou as informações do individuo e printar.
lista = [['Carlos', 14], ['Beebos', 25], ['Bangos', 47], ['Anderson', 34], ['Letocia', 83]]

print(lista[3][1])

print('fim do exemplo 1.')
print('' * 1)
#============================================

info = [['João', 53], ['Pedro', 19], ['Emanubixa', 18], ['Bruna', 20], ['Leticio', 56]]

for p in info:
    print(f'{p[0]} tem {p[1]} anos de idade.')

print('fim do exemplo 2')
print('' * 1)
#============================================

pessoas = list()
inform = list()

for q in range(0, 3):
    inform.append(str(input('digite um nome: ')))
    inform.append(int(input('digite uma idade: ')))

    pessoas.append(inform[:])
    inform.clear()

for g in pessoas:
    if g[1] < 20:
        pessoas.remove(g)


print(pessoas)


print('fim do exemplo 3.')
print('' * 1)
