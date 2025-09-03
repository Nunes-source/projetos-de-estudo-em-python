num = []

for n in range(0,5):
    question = num.append(int(input('insert a number: ')))

for keys, numbers in enumerate(num):
    print(f'the number {numbers} key is {keys}')


print(f'the smallest number on the list was: {min(num)} and the key for it was: {num.index(min(num))}.\n'
      f'the largest number on the list was: {max(num)} and the key for it was: {num.index(max(num))}.')

#it's good to keep on mind that both -enumerate- and -index- return the key for the user but -index- is more precise while -enumerate- is good for sequences