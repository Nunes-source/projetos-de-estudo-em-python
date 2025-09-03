import random

print ('vamo jogar um jokenpo?')

a = ['pedra', 'papel', 'tesoura']

b = (random.choice(a))

c = input('*escolha entre pedra papel e tesoura* : ' )

if b == 'pedra' and c == 'papel':
    print('DROGA!, eu tinha escolhido pedra :(...')

elif b == 'pedra' and c == 'tesoura':
    print('AHAHA!!!, eu ganhei dessa vez, eu tinha escolhido pedra >:)')

elif b == 'tesoura' and c == 'pedra':
    print('NAAAAAOOOO, sua pedra estrassalhou minha tesoura :,(')

elif b == 'tesoura' and c == 'papel':
    print('GANHEI!, sinta-se cortado pela minha tesoura >:))))')

elif b == 'papel' and c == 'tesoura':
    print('PORCARIA >:((, você ganhou dessa vez... meu papel foi totalmente picotado pela sua tesoura ;) s2s2')

elif b == 'papel' and c == 'pedra':
    print('ISSO!!!, eu ganhei dessa vez, meu papel sufocou sua pedra >:)')

else:

    print('eu me caguei')