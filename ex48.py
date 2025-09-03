print('esse programa lê a media de duas notas de um aluno, se a média for menor que 5 ele está reprovado, se tiver entre 5 e 5.9 está em reculperação e se for de 6 pra cima está aprovado.')

nota1 = float(input('qual foi a primeira nota?: '))

nota2 = float(input('qual foi a segunda nota?: '))

resultado = (nota1 + nota2)

if resultado < 5:
    print('o aluno foi reprovado por ter a média menor que 5')

elif resultado > 5 and resultado < 6:
    print('o aluno ficou em reculperação')

elif resultado >5.9:
    print('o aluno foi aprovado!')


# é bom lembrar que agente pode sempre fazer como na linha 12 (eu fiquei preso porque tinha esquecido da possibilidade de fazer isso.)