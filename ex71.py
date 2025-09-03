#aqui vemos uma forma de fazer com que a condição de parada do laço não seja adicionada ao resultado final quando queremos o resultado de um devido -input-
#também vemos que não precisamos de lista e usar o -sum- pra indicar a soma de um contador (caso tenha dúvida, só checar a linha 5 e 14) por mais que eu ache que com o -sum- fique mais intuitivo
#ATENÇÂO essa é outra forma de fazer o ---ex69---, uma forma mais fácil e sem a gambiarra do -999, por mais que eu ache que não seja tão gambiarra assimkkkk

soma = 0

cont = 0

while True:
    n = int(input('digite um número'))
    cont += 1
    if n == 999:
        break
    soma += n

print('você digitou: {} vezes e a soma dos números digitados foi: {}'.format(cont, soma))
