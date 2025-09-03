# o desafio é fazer um programa que leia um numero de 0 a 999 e mostre na tela cada um dos digitos separados.
#ex digite um numero:1234
#unidade:4 dezena:3 centena:2 milhar:1
#confesso que tive que ver o video da resolução pra conseguir completar os desafios 28 e 29, e o 29 até agora não entrou direito na minha cabeça...
#eu começei tentando fazer usando os numeros como string, assim eu poderia usar o split e fazer de forma facil, más não funcionou :(((
#então decidi ver o video e ele fez dessa forma:
#começamos fazendo uma divisão inteira e com o (%) pegamos o modulo da divisão que fizemos, ou seja o resto da divisão(e foi isso que eu não entendi direito).
#LEMBRAR DE PERGUNTAR SOBRE ISSO DEPPOIS.


a = int(input('digite um numero de até 4 digitos - '))

u = a // 1 % 10

d = a // 10 % 10

c = a // 100 % 10

m = a // 1000 % 10

print('unidade - {:}'.format(u))

print('dezena - {:}'.format(d))

print('centena - {:}'.format(c))

print('milhar - {:}'.format(m))
