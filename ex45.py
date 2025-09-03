#uma explicação rapida sobre if porque eu ja fiz programa pra k7 com isso, bom... eu acho que eu não preciso falar  nada sobre o if, más o elif é sempre importante ressaltar que elif funciona como um if dentro de um if, é meio confuso más como
#essas anotações são so pra mim eu acho que ta entendivel...

print('bem vindo ao programa de imprestimo residencial!!')

nome = str(input('como voce deseja ser chamado?'))

valor_casa = int(input('qual o valor da residencia desejada? R$:'))

print('entendido!.')

valor_salario = int(input('qual a sua renda mensal? R$:'))

print('certo, estamos quase terminando.')

anos_debito = int(input('em quantos anos voce pretende pagar a residencia desejada? R$:'))

prestacao = valor_casa // anos_debito

resultado = prestacao // anos_debito

print('muito bem sr(a) {} aqui está o resultado:'.format(nome))

if prestacao > valor_salario * 30 / 100:

    print('O seu imprestimo foi aprovado com sucesso!!!')
    print('você irá pagar sua querida residencia em {} vezes de R${}.'.format(anos_debito, resultado))

elif prestacao < valor_salario * 30 / 100:
    print('seu imprestimo foi recusado por motivos de:')
    print('renda mensal insurficiente.')

else:
    print('eu me caguei')
