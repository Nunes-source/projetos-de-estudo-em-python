numbers = list()
even_numbers = list()
odd_numbers = list()

for n in range(0, 7):
    numbers.append(int(input(f'enter the #{n+1} number: ')))

for number in numbers:
    if number % 2 == 0:
            even_numbers.append(number)

    if number % 2 != 0:
        odd_numbers.append(number)

print(f'the list with even numbers: {sorted(even_numbers)}\n'
      f'the list with odd numbers: {sorted(odd_numbers)}\n') 
