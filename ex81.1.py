num = []

for n in range(0, 5):
    question = num.append(int(input('insert a number: ')))

for keys, numbers in enumerate(num):
    print(f'the number is: {numbers} key is: {keys}')

minnum = min(num)
minkeys = [index for index, value in enumerate(num) if value == minnum]

maxnum = max(num)
maxkeys = [index for index, value in enumerate(num) if value == maxnum]

print(f'the smallest number on the list was: {minnum} and the key for it was: {minkeys}.\n'
      f'the largest number on the list was: {maxnum} and the key for it was: {maxkeys}.')

#it's good to keep on mind that both -enumerate- and -index- return the key for the user but -index- is more precise while -enumerate- is good for sequences

#about the list comprehensions, it's quite simple to understand but hard to replicate sometimes...
#it consists in create a list with an entire logic by spending only one code line.
#the structure is: #1: the main variable/value you want to add to your list, 2# loop variable -for-, #3 the condition -if-
#so you kinda read it backwards comparing with the "usual" way that i've ben doing so far
