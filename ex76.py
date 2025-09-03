lines = ('=' * 30)

banknotes_50 = 0
banknotes_20 = 0
banknotes_10 = 0
banknotes_1 = 0

print(lines)
print('{:^30}'.format('ATM BANK'))
print(lines)

withdrawing = int(input('how much you wish to withdraw?: '))
total = withdrawing

while True:
    if total >= 50:
        total -= 50
        banknotes_50 += 1

    elif total >= 20:
        total -= 20
        banknotes_20 += 1

    elif total >= 10:
        total -= 10
        banknotes_10 += 1

    elif total >= 1:
        total -= 1
        banknotes_1 += 1

    else:
        break

print('[{}] 50U$ dollar notes\n[{}] 20U$ dollar notes\n[{}] 10U$ dollar notes\n[{}] 1U$ dollar notes'.format(banknotes_50, banknotes_20, banknotes_10, banknotes_1))
