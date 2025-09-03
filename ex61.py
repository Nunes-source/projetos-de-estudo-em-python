#no exercico 55 do curso de python fomos instruidos a criar um programa que lesse e indicasse o maior e o menor peso entre 5 pessoas.
#vou explicar como fiz o programa ja que a aula de explicação do professor guanabara me pareceu meio confusa. Então decidi fazer o codigo por mim mesmo com a ajuda do chat gpt
#e eu acredito que dessa forma fica bem mais facil pra compreender e pra usar em codigos futuros ja que usa menos linhas do que no metodo 'convencional' ensinado no curso.
#EXPLICAÇÂO: na linha 10 criei uma lista vazia, assim no futuro eu poderia usar a função .append pra transformar as informações do 'for' da linha 12 em uma lista, e assim poder usar as outras
#funções 'max' e 'min' pra indicarem o maior e menor numero tirados do 'for' ja que as funções 'max' e 'min' funcionam apenas com listas.




lista = []

for pessoas in range(1,6):
    peso = float(input('digite o peso da {} pessoa: '.format(pessoas)))
    lista.append(peso)

maior = max(lista)
menor = min(lista)


print('o maior peso foi {} e o menor foi {}'.format(maior, menor))
