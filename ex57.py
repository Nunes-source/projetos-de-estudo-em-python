#a base mais dificil do programa eu tinha conseguido fazer praticamente de primeira, más como eu não me lembrava nada de progressão aritimetica car o 10 por 11 e por ai vai
#e pra isso funcionar na contagem da linha 13 eu adicionei o 'final + r' pra contar direito DEPOIS VIR NESSE CODIGO PRA ENTENDER MELHOReu tive que ver o video no youtube pra pegar a formula do calculo pra colocar do codigo
#então sempre que for trabalhar com esse conceito é bom se lembrar das formulas das linhas 11 e 13 que pra indicar o decimo número temos que pegar o primeiro termo adicionar 10, subtrair 1 e multiplicar pela razão(se fosse o decimo primeiro so tro

print('programa que lê o primeiro termo e a razão de uma PA (progressão aritimética) e mostra os 10 primeiros resultados')

pm = int(input('digite o primeiro termo :'))

r = int(input('digite a razão :'))

final = pm + (10 - 1) * r

for n in range(pm, final + r, r):
    print(n)
print('...')
