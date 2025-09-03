lines = 30*'-'
count_1k = 0 #iniciating the counter for products taht cost over 1000
price_list = [] #creating a list for the prices, so i can use -sum- to determinate the total price and -min- to indicate the lowest price
cheapest_product_name = '' #cerating a variable for the name of the cheapset product,(starting with empty strings because the variable will be set in the -while loop-)
products = {} #creating a dictionary so i can asociate the -cheapest_product_name-(key) with the -cheapest_product-(value) and it makes the code more 'understandable'

while True: #iniciating loop
    product_name = str(input('insert the name of your product: '))
    product_price = float(input('insert the price of your product: '))

    products[product_name] = product_price #asociating the key and the value of the dictionary

    price_list.append(product_price) #putting the prices on the list

    cheapest_product = min(price_list) #indicating the lowest price on the list
    total_price = sum(price_list) #suming all prices on the list to indicate the total price
    cheapest_product_name = min(products, key=products.get) #using this line to get the key of my product wich is the -product_name- and replace the -cheapest product name- with the key using -min- to indicate that i want it to be asociated with the lowest value on my dictionary

    if product_price >= 1000:
        count_1k += 1

    print('do you wish to run the program again?')
    yn = str(input('[Y/N]: ')).strip().upper()
    if yn == 'Y':
        continue
    else:
        break

print('the quantity of products that cost more than a thousand bucks:{}'.format(count_1k))
print('the cheapest product is: {} wich costs: {}'.format(cheapest_product_name, cheapest_product))
print('the sum of all your products is: {}'.format(total_price))
