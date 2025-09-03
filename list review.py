lista = [1, 2, 3, 4, 5]

lista.insert(2, 0)

print(lista)

print(f'essa lista tem {len(lista)} elementos')

print('fim')
#--------

lista2 = [2, 5, 1, 3, 6]

lista2.append(4)

lista2.sort(reverse=True)

print(lista2)
#-----------

lista3 = [0]

for n in range(0, 5):
    p = int(input('digite um numero: '))

    lista3.append(p)

print(lista3)
#-----------

lista4 = list()

for n in range(0, 5):
    lista4.append(int(input('digite um número:')))

for c, v in enumerate(lista4):
    print(f'na posição {c} está o numero {v}')


#é interessante como o codigo da lista 3 e 4 são parecidos, más o resultado sai diferente, o codigo da lista 3 apresenta um 0 como primeiro valor "obrigatorio"
#ja na lista 4 podemos indicar o valor da -chave 0-


a = [3, 2, 1, 6, 7]
b = a[:]

b[1] = 4

print(f'lista A:{a}\n'
      f'lista B: {b}')

#no programa das listas A e B serve pra me mostrar outra forma de trocar itens da lista como visto na linha 47
#ao invés de usar o .append eu posso indicar a lista, a chave do valor, e o novo valor a ser adicionado naquela chave.
#más eu acredito que o .append seja mais adequado pra substituição, más outra coisa importante é sobre copias de listas.
#se eu tivesse feito apenas: b = a, eu não teria criado uma copia independente da lista a, más sim criado outra lista que tem ligação com a lista a.
#então tudo que eu fizesse com a lista B iria acontecer com A mesmo que o comando viesse depois.
#pra evitar isso, usamos um modulo do fatiamento de strings dizendo que: b = a[:]. Assim fazemos uma copia independente de uma lista.


