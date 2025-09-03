#i wish i knew how to make the inputs repeat if the the answers are not the expected ones, but the course hasn't taught me yet.(at lest by an way that doesn't make the program look weird


lines = 30 * '-'#asthetic stuff

count_adults = 0 #starting counter for the amount of adults registered on the program

count_registered_men = 0#sarting counter for the number of men registered on the program

count_women_over_twenty = 0#starting counter for the number of women registered on the program(random af)

while True: #iniciating loop
    age = int(input('insert your age: '))#inputing ages to identify who's adult and who's not
    print('insert your gender: ')#asking before the input for asthetic purposes
    gender = str(input('[M/F]: ')).strip().upper()#inputing genders (.strip and upper are mandatories for any input tho)

    if age >= 18: #if the answer of the age input is over 18, the adults counter will recive +1
        count_adults += 1

    if gender == 'M':#if the answer of the gender input is 'M' the men counter will recive +1
        count_registered_men += 1

    if age >= 20 and gender == 'F': #if the age input is over 20 and the gender input is 'F' the counter for women over twenty will recive +1
        count_women_over_twenty += 1

    print('do you wish to continue the program?') #asthetix again
    program_ending = str(input('[Y/N]')).strip().upper()

    if program_ending == 'Y': #if the answer is Y it'll keep the program
        continue

    else: #the program ends anyway
        break
print('{} the quantity of men registered on the program: {} {}.'.format(lines, count_registered_men, lines))

print('{} the quantity of adults registered on the program: {} {}'.format(lines, count_adults, lines))

print('{} the quantity of women over twenty years of age registered on the program: {} {}'.format(lines,count_women_over_twenty,lines))
