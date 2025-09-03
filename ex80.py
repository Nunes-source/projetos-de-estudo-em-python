list = []

pair_list = []

for n in range(0, 4):
    numbers = int(input('insert a number:'))
    list.append(numbers)

for numbers in list:
    if numbers % 2 == 0:
        pair_list.append(numbers)

tuple(list)
tuple(pair_list)

print(f'you typed the numbers: {list}')

print(f'the number 9 was typed {list.count(9)} time(s).')

if 3 in list:
    print(f'the position of number three is: {list.index(3) + 1}')

else:
    print("there's not any number 3 on the list...")


print(f'the pair numbers are: {pair_list}')
