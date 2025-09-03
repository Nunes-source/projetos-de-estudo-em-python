#esse desafio daqui eu também tive um pouco de dificuldade pra fazer e eu tive que ver o codigo do professor pra entender melhor.
#explicando sobre o que eu entendi do codigo:
#primeiramente ele colocou o menor e o maior valor sendo o n1 ja eliminando algumas linhas de codigo no futuro, o que me deixou encucado foi mais o fato de que o if e o elif podem mudar um resultado que voce havia colocado antes.
#como ta explicado no codigo, menor = 1(então na minha cabeça o menor sempre seria =n1) porém com o if ele pôde mudar o resultado do maior e do menor colocando dessa forma do codigo.
#tradução do codigo: *menor é igual a n1, se n2 é menor que n1 e n2 menor que n3 o menor será substituido por n2*
#e eu não sabia que dava pra fazer isso, então eu acredito que esse é o motivo de eu ter rachado tanto pra fazer esse codigo :(((





print('ola, digite 3 numeros e eu vou te indicar o maior e o menor deles')

n1 = int(input('digite o primeiro numero :'))

n2 = int(input('digite o segundo numero :'))

n3 = int(input('agora o terceiro numero :'))

menor = n1

if n2 < n1 and n2 < n3:

    menor = n2

if n3 < n1 and n3 < n2:

   menor = n3


maior = n1

if n2 > n1 and n2 > n3:

    maior = n2

if n3 > n1 and n3 > n2:

   maior = n3

print('O número com maior valor é {}'.format(maior))

print('O número com menor valor é {}'.format(menor))


#nota importante, nesse codigo eu poderia também ter usado um módulo chamado ,sort(), ele faz os numeros de uma lista aparecerem em uma ordem crescente...