list = []
list_odd = []
list_even = []


while True:
    p = int(input('insert a number:'))
    list.append(p)
    for p in list:
        if p % 2 == 0:
            list_even.append(p)

        elif p % 2 != 0:
            list_odd.append(p)

    print('continue?')
    yn = str(input('[Y/N:]')).upper()
    if yn == 'Y':
        continue
    else:
        break
print(f'the list is: {(list)}')
print(f'the list with odd numbers is :{set(list_odd)}')
print(f'the list with even numbers is: {set(list_even)}')
