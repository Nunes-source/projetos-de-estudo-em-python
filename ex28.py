#Sobre o .upper/.lower fica bem facil de entender más o que eu vou anotar aqui é mais sobre o lance dos epsaços entre e fora dos nomes, é sempre importante usar o .strip no input do nome, a não ser que eu queir a contar os espaços de fora do nome
#por exemplo se o .strip não fosse colocado no codigo e a pessoa digitasse -    lucas foda    . o .len iria contar os espaços antes do ((l) de lucas) e depois do ((a) de foda).
#bom, como o len() serve pra dizer em numeros os caracteres lidos normalmente em um nome completo que possui espaço entre os nomes ele iria citar os espaços na leitura, porem com a ajuda do (- a.count (' '))) ele desconsiderou os espaços entre os nomes
#ele funciona como se fosse em um modulo matematico (NOTA, eu nunca iria imaginar que dava pra usar menos dessa forma sem ser em um modulo matematico) então como o (.format(len(a)) foi posto primeiro ele contou o nome com os espaços e com o (- a.count(' '))
#ele removeu unica e exclusivamente por causa do (-) ja que o .count sem sinal de menos serve pra contar um numero de caracteres, por exemplo:
# ~~~~~~~~~ a = Roberto ~~~~~~~~~~
# ~~~~~~~~~ print(a.count(o)) ~~~~~~~~~~
# ~~~~~~~~ 2 ~~~~~~~~


#sobre o .find(' ') ele funcionou de forma normal graças ao .strip() tambem, ja que se tivesse espaços antes da primeira letra talvez ele fosse contar de forma "errada", o .find funciona da seguinte maneira: entre os parenteses de .find() voce vai digitar algum
#caractere em formato de string e então ele vai contar os caracteres até achar o caractere escolhido e no final nos dando a resposta em formato de numero.



a = input('digite o seu nome completo - ').strip()

print('seu nome com todos os caracteres maiusculos - {:}'.format(a.upper()))

print('seu nome com todos os caracteres minusculos - {:}'.format(a.lower()))

print('seu nome tem: {:} caracteres'.format(len(a) - a.count(' ')))

print('seu primeiro nome tem : {:}'.format(a.find(' ')))
