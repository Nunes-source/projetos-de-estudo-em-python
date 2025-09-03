import random

numbers = []

for n in range(0, 5):
   a = numbers.append(random.randint(0, 10))

#tuple(numbers)

print('the random numbers were: {}'.format(numbers))
print(f'the largest number was: {max(numbers)}\n'
      f'and the smallest number was: {min(numbers)}')
