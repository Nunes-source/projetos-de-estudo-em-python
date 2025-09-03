#Adiantando eu ja vou logo admitindo minha derrota pois precisei ir nos comentarios do video pra ver se alguem tinha feito,#o exercicio de uma forma parecida com a minha e eu achei.
#Nossos codigos estavam quase os mesmosm com a unica diferença que no codigo do cara ele expecificou pro python onde ele deveria achar o numero inteiro.
#Pra fazer esse exercicio eu usei a logica de que todo numero dividido por 2 é inteiro, porém eu tinha feito desse jeito:


#n = int(input('digite um numero'))

#rs = n / 2

#if rs == int:

#   print('par')

#else:
#    print('impar')

#como você pode ver, o codigo esta quase identico ao o de baixo, com a unica falta de um mizero (rs):, eu achei que eu não precisava identificar pro python onde que ele deveria trabalhar então eu acho que vai ser bom anotar esse codigo
#pra eu não me esquecer de que eu posso fazer esse lance do (rs) como exemplificado no codigo de baixo


n = int(input('digite um numero'))

rs = n / 2

if rs == int(rs):

    print('par')

else:
    print('impar')

