lista = []
maior = 0


op = 0

while op != 5:

    num1 = int(input('digite o primeiro valor: '))

    num2 = int(input('digite o segundo valor: '))

    print('digite:')
    print('[1] para somar')
    print('[2] para multiplicar')
    print('[3] para indicar o maior numero')
    print('[4] para digitar novos valores')
    print('[5] para sair')
    print('')

    p = int(input('qual a opção desejada?'))

    if p == 1:
        print('a soma dos números selecionados é: {}'.format(num1 + num2))

    elif p == 2:
        print('a multiplicação dos números selecionados é: {}'.format(num1 * num2))

    elif p == 3:
        lista = [num1, num2]
        maior = max(lista)
        print('o maior número entre os indicados é: {}'.format(maior))

    elif p == 4:
        continue

    else:
        break
