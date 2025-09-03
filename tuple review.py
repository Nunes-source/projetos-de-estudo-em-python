snacks = ('chocolate', 'juice', 'potatoes', 'cake', 'icecream')

for amount, food in enumerate(snacks):
    print("i'll eat {} and it's position is: {}".format(food, amount))

#it's interesting how -enumerate- works, it becomes some new kind of variable wich can be assigned, so it's important to pay attention in the order.
#i'll leave the program here so i can review if i need.

a = ('john', 'Luiz', 'Leon', 'mago')

b = ('silvio', 'Karalhauser', 'dos games', 'lepra', 'merda')

c = a + b

print(c)
print(c.index('silvio'))

d = (1, 2, 5, 0)

f = (8, 5, 2, 7)

g = d + f

print(g)
print(g.index(5))

#there are two ways to indicate a tuple's variable position by typing the string or the number.

#ATENTION: tuples are immutable, unless if you delete it's variables with the function -del- that's the only way to change a tuple inside of a running code.

#ATENTION index is used for indicate the key of a tuple, list etc... review exercise 81 for better comprehension (i had to use chat gpt on this one)