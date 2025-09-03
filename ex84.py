exp = str(input('type your expression: '))

if exp.count('(') == exp.count(')'):
    print('expression correct!.')

else:
    print('expression incorrect!.')

#preferi fazer essa explicação em portugues já que o codigo é bem bobinho msm ent fds
#o desafio era criar um codigo que lesse uma expressão/formula  matematica e analisasse se a mesma está correta.
#de começo parece algo bem dificil, más usando os parenteses pra analisar a estrutura da expressão, se torna algo bobo
#acho que esse desafio foi mais pra uma pegadinha, só usar o .count pra analisar se os números de '(' e ')' são iguais.
#caso sim, a formula está correta, e fodase to com preguiça de digitar com acento. ┌∩┐(ಠ_ಠ)┌∩┐