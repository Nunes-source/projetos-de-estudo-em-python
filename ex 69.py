lista = [0] #começando lista com 0 para ir adicionando os números com o while futuramente e também visando usar o sum() ja que é uma boa mão na roda pra somar os números da lista facilmente

contador = 0 #começando contador classico com 0 pra ir adicionando +1 a cada vez que eu digitar um número no meu loop, assim podendo mostrar quantas vezes eu digitei no final.

while True: #começando o while sem alguma condição especifica, assim eu não preciso fazer 2 inputs diferentes, salvando linhas e paciencia.
    perg = int(input('digite um numero inteiro: '))
    contador += 1
    lista.append(perg) #as informações (números) digitados no input -perg- agora vão ser guardados na minha lista, assim podendo somar eles depois
    if perg == 999:#criando a condição pra finalizar o loop
        break

r = sum(lista) -999 #somando os números da lista e retirando o 999 da condição de finalização

print('você digitou {} vezes e a soma dos números digitados foi: {}'.format(contador -1, r))
