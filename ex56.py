#desafio 50 do curso em video python, desenvolva um programa que leia seis numeros inteiros e mostra a soma apenas daqueles que foram pares. se o valor digitado for impar, desconsidere-o.

#IMPORTANTE: é sempre bom lembrar que o 'for in' funciona com input ou print ou qualquer outra coisa além de apenas numeros

#IMPORTANTE: importande lembrar também que o exemplo da linha 11 e 15 que funciona como um armasenador de valores que começa com 0 más no final recebe o valor dele mesmo mais a soma por 'p' que são os valores inputados

#NÃO TÃO IMPORTANTE: pra deixar o codigo bonito e com mais sentido eu usei o '.format' na linha 14 pra induzir o ultilisador do codigo de uma forma mais intuitiva ao invés de deixar uma frase pré definida e nem um pouco dinamica.

print('digite 6 numeros inteiros')

soma = 0

for n in range(1, 7):
  p = int(input('digite o {} valor :'.format(n)))
  if p % 2 == 0:
      soma = soma + p

print(soma)
