numbers = [[], []]

for n in range(0, 7):
    a = (int(input(f'enter the #{n+1} number: ')))
    if a % 2 == 0:
        numbers[0].append(a)

    else:
        numbers[1].append(a)

print(f'even :{numbers[0]}\n'
      f'odd: {numbers[1]}')