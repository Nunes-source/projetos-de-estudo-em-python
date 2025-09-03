print('programa que lê o ano de nasncimento de 7 pessoas e indica quantas são maiores de idade')

contador1 = 0

contador2 = 0

for data in range(1, 8):
    a = int(input('qual a data de nascimento da pessoa em qusetão? - '))

    if 2024 - a > 18 or 2024 - a == 18:
        contador1 += 1

    elif 2024 - a < 18:
        contador2 += 1

print('com a data de nascimento das pessoas em questão temos {} maior(es) e {} menor(es)'.format(contador1, contador2))
