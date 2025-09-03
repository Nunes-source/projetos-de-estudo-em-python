#anotações: pra descobrir se um numero é multiplo do outro é so fazer igual na linha 8 na qual eu digo que se a divisão entre os numeros requisitados são iguais a 0 ou seja a divisão foi exata, vai adicionar no resultado ja que divisão e multiplicação funcionam do mesmo jeito
#na linha 6 eu criei um acumulador que serve caso queiramos fazer contas mais complexas com a juda do 'for in' más não queremos mostrar a listagem dos calculos ou seja como visto na linha 13 ele pega os numeros da variavel c e soma toda vez que um número multiplo de 3 é encontrado no 'for in' fazendo a variavel resultado receber o valor de c e somar com ela mesma
#na linha 8 é possivel ver um contador que tem o valor de 0 no começo, más como resultado ele recebe o valor de +1 toda vez que a variavel c executa uma ação na linha 11
print('programa que calcula a soma entre todos os numeros impares que são multiplos por 3 e que se encontram no intervalo de 1 e 500')

resultado = 0

contador = 0

for c in range(1, 501, 2):
    if c % 3 == 0:
        contador = contador + 1
        resultado = resultado + c
print(' o resultado entre todas as {} somas de numeros impares multiplos por 3 entre 1 e 500 é: {}'.format(contador, resultado))
