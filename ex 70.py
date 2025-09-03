contador = 0 #contador classico começando com 0

lista = []#lista dessa vez começando sem nada, pois a variavel menor da linha 17 vai sempre cair 0 se eu colocar 0 no inicio

while True: #começando o while sem condições no inicio pois o programa não demanda ja que o importante são as informações adquiridas com o loop
    n = int(input('digite um número: '))
    contador += 1 #adicionando +1 no contador pois assim eu consigo calcular a média com base na quantidade de números digitados
    lista.append(n) #fazendo os números da variavel de pergunta irem pra lista em ordem
    p = str(input('deseja continuar? [S/N]: ')) #criando variavel de condição pro fim do loop acontecer quando o usuario quiser
    if p == 's': #se a resposta for 's', o programa se repete
        continue #repetindo o programa se a resposta da variavel de condição for s
    else: #caso o contrario, o laço termina
        break #terminando o laço

maior = max(lista) #indicando o maior número da lista que contem os numeros digitados pelo user

menor = min(lista) #fazendo a mesma coisa que a linha 15 so que com o menor numero

r = sum(lista) #somando as quantias da lista

print('a média dos números apresentados foi:{:.2f}'.format(r / contador)) #apresentando e fazendo o calculo da média no proprio -.format- ja que é um calculo simples

print('e o número de maior quantia foi:{}, enquanto o de menor quantia foi:{}.'.format(maior, menor))
