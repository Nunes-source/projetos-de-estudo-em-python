#aqui temos um bom exemplo de SEMPRE REVISE SUAS PROPRIAS ANOTAÇÕES SEU MACACO
# eu tinha esquecido completamente do lance o rfind ou lfind, que indicam o lado no qual o programa vai começar a ler sendo l left e r right

#sobre o .upper e o .strip eu tinha achado que pra colocar esses 2 na mesma linha eu deveria colocar virgula, más não so coloca na tora mesmo


n = str(input('qual o seu nome? - ')).upper().strip()

print('a letra A aparece {:} vezes no seu nome'.format(n.count('A')))

print('a primeira letra A apareceu na posição :  {}'.format(n.find('A')+1))

print('a primeira letra A apareceu na posição :  {}'.format(n.rfind('A')+1))
