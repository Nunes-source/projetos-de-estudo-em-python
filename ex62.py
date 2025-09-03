# começando os contadores

cont_idade = 0
qtd_mulheres = 0
mais_velho = 0
nome_do_mais_velho = ''

#iniciando o laço de repetição

for p in range(1,5):
    print('--- {}ª pessoa ---'.format(p))
    nome = str(input('nome: '))
    idade = int(input('idade: '))
    print('sexo: ')
    sexo = str(input('[M/F]: '))
    cont_idade += idade # deixando o calculo do contador na mesma linha do contador já que quero saber a idade de todas as 'pessoas do grupo'

#iniciando as condicionais

    if idade == 1 and sexo == ('m' or 'M'): #se -idade for 1 ou maior e -sexo for m ou M
        mais_velho = idade #a variavel mais_velho (que é iniciada com 0) receberá o mesmo valor de -idade
        nome_do_mais_velho = nome #a variavel nome_do_mais_velho receberá o mesmo 'valor' de -nome

    elif idade > mais_velho and sexo == ('m' or 'M'): #se idade for maior que a variavel mais_velho (que receberá um valor graças as condicionais passadas) e -sexo for m ou M
        mais_velho = idade #a variavel mais_velho terá o valor substituido pelo indicado
        nome_do_mais_velho = nome #a variavel nome será substituida pelo nome do 'homem' cujo a idade é mais avançada (graças a linha anterior)


    if idade < 20 and sexo == ('f' or 'F'): # se a idade for menor que 20 e -sexo for 'f' ou 'F'
        qtd_mulheres += 1 #a variavel qtd_mulheres recebe +1


#demonstando as informações requisitadas

print('a media de idade do grupo é {}'.format(cont_idade / 4)) #como a media de idade é calculada dividindo o valor de todas as idades pelo número de pessoas eu decidi fazer o calculo aqui msm

print('o nome do homem mais velho do grupo é: {}'.format(nome_do_mais_velho))

print('no grupo, a quantidade de mulheres com menos de 20 anos de idade é: {}'.format(qtd_mulheres))
