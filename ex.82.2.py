l = (30 * '=')
list = []
list2 = []

while True:
    numbers = int(input('insert a number: '))
    list.append(numbers)
    while True:
        if numbers not in list2:
            list2.append(numbers)
        else:
            print('number already in list, tpye again.')
        break
    print('continue?')
    q = str(input('[Y/N]: ')).strip().upper()

    if q == 'Y':
        continue
    else:
        break
print('you entered all numbers.')
print(l)

print(sorted(list2))
