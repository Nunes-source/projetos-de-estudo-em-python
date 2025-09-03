import random

print('VAMOS VER QUEM GANHA NO PAR OU IMPAR!!')

cont = 0

impar = 0

par = 0

while True:
    print('-' * 30)
    print('[I] para impar / [P] para par')
    ip = str(input('Você escolhe impar ou par?: ')).strip().lower()
    print('-' * 30)

    if ip == 'p':
        print('beleza, então serei -impar-')
    else:
        print('okay, então serei -par-')

    n1 = int(input('qual número você escolhe?: '))
    n2 = random.randint(0, 10)
    result = (n1 + n2)
    print('-' * 30)

    if (result % 2) == 0:
        par = 1
    else:
        impar = 1

    if ip == 'p' and par == 1:
        print('aaaaaah, eu perdi!!, {} + {} = {}, que  é par.'.format(n1, n2, result))
        cont += 1

    elif ip == 'p' and par == 0:
        print('opaaa, eu ganhei!!, {} + {} = {}, que é impar.'.format(n1, n2, result))

    elif ip == 'i' and impar == 1:
        print('que droga, eu perdi!, {} + {} = {} que é impar.'.format(n1, n2, result))
        cont += 1

    elif ip == 'i' and impar == 0:
        print('aí sim!!!, eu ganhei!, {} + {} = {}, que é par'.format(n1, n2, result))

    print('-' * 30)
    print('[S] para sim / [N] para não.')
    p = str(input('você aceita outra rodada?: ')).strip().lower()
    print('-' * 30)

    if p == 's':
        continue

    else:
        print('adorei jogar impar ou par com você, você teve um total de {} vitória(s)...'.format(cont))
        break

print('fim')
