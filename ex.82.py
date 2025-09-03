l = (30 * '=')
list = []

while True:
    numbers = int(input('insert a number: '))
    list.append(numbers)
    print('continue?')
    q = str(input('[Y/N]: ')).strip().upper()

    if q == 'Y':
        continue
    else:
        break
print('you entered all numbers.')
print(l)

print(set(sorted(list)))
