#esse codigo foi bem facil de fazer, más ainda sim ele tem algo de importante pra anotar aqui.
#com certeza eu ja fiz esse tipo de codigo envolvendo porcentagem dentro do python, porém esse codigo deve estar no meu hd cheio dos meus outros codigos que eu fiz do python que eu esqueci de salvar e agora preciso comprar uma case sata 3 pra recuperar esses -
#codigos de volta. Enfim, ressaltando o lance de porcentagem dentro do python o simbolo de % normalmente serviria pra calucar um valor com porcentagem, más esse simbolo serve pra calucar o resto de uma divisão, então agente usa porcentagem de uma forma mais
#"primitiva/literal", usando os denomidadores base de uma porcentagem pra calucar o valor pedido.
#no meu codigo pra fazer as adições de 15% e de 10% eu fiz da seguinte maneira:

#s = float(input('digite aqui o seu salario :'))

#ad15 = s * 15 / 100 + s           - o valor de s seria multiplicado por: 15 dividido por 100 que tem o resultado de 15% o valor de s sendo assim o resultado de s se fosse 1250 seria de 125, e então adicionei +s no final pra juntar o salario (base) com o aumento.

#ad10 = s * 10 / 100 + s           - e fiz o mesmo usando apenas valores diferentes más com a mesma base de valor vezes 10 dividido por 100 mais valor denovo

#if s < 1250:

#    print('o seu salario de {} aumentou pra {} graças ao aumento de 15%.'.format(s, ad15))

#else:

#    print('o seu salario de {} foi pra {} graças ao aumento de 10%'.format(s, ad10))


#então no caso a formula de divisão seria: (numero * pocentagem desejada / 100)


# -CODIGO-


print('*uma empresa esta aumentando os salarios de seus funcionarios*')

print('uma adição de 10% praqueles que recebem mais de 1.250.00R$, e uma de 15% praqueles que recebem menos que isso.')

s = float(input('digite aqui o seu salario :'))

ad15 = s * 15 / 100 + s

ad10 = s * 10 / 100 + s

if s < 1250:

    print('o seu salario de {}R$ aumentou pra {}R$ graças ao aumento de 15%.'.format(s, ad15))

else:

    print('o seu salario de {}R$ foi pra {}R$ graças ao aumento de 10%'.format(s, ad10))
