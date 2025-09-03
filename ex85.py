info = list() #list that'll be added to a seccond one, so i can make a doubule list and have more control over the info

people = list()#main list that'll contain the info

amount_people = 0#counter for the amount of people registered on the program

heavy_people = list()#list for the heaviest people registered

light_people = list()#list for the lightest people registered

while True:
    info.append(str(input('enter a name:')))#adding the infos in the "first" list
    info.append(float(input("enter the person's weight: ").strip()))
    people.append(info[:])#making a double list without linking both "first" and "seccond" lists ("info[:]" makes a copy)
    info.clear()#cleaning the "first" list so it won't interfere with the "appending loop"
    amount_people += 1
    print('[Y/N]')
    yn = str(input('do you wish to continue?')).strip().upper()
    if yn == 'Y':
        continue

    else:
        break

max_weight = max(p[1] for p in people)#creating a variable to find the largest number -in people-, max(p[1]) was used to refer
#to the largest number in -people- and for p in people can be translated by just "in people", the -for- is the way how python sweeps lists, touples, etc...
min_weight = min(p[1] for p in people)

for p in people: #p is the entire registration, like weight and name, p[0] = "name" and p[1] = "weigt"
    if p[1] >= max_weight: #if the weight is larger than our (max_weight) variable, wich is the "largest" weight/number in people (our "main/seccond" list)...
        heavy_people.append(p)

    if p[1] <= min_weight: #same stuff, but for the lightest people
        light_people.append(p)


print(f'the total amount of registered people: {amount_people}')
print(f'the people who registered on the program were: {people}')
print(f'the heavyest people were {heavy_people}')
print(f'the lightest people were {light_people}')



#vou escrever em portugues msm fds
#o desafio era fazer um programa onde registrassemos pessoas com seus nomes e pesos, e no final indicar o total de pessoas registradas, os mais leves e os mais pesados.
#eu acho que essa tarefa seria mais facil usando dicionarios, más valeu a pena a pratica.
#acho que se eu fosse melhor em python eu poderia encurtar mais esse programa, más pelomenos eu consegui fazer ele funcionar, mesmo eu admitindo que está um pouco feio
#esse monte de print no final ta me fazendo querer cagar um tijolo, más eu fiquei com preguiça de ir procurar o caractere de barra inversa so pra copiar e colar ja que meu teclado é paia.
#tentei deixar o programa bem explicado pra caso no futuro eu precise revisitar pra entender algo, eu consiga fazer isso mais rapido.

#como eu já imaginava, depois de um tempo eu tive que voltar nesse programa pra entender algumas coisinhas e algo que vale ressaltar é que como -people- é uma lista de listas, p[1] significa
#os pesos de cada um na lista de listas, então todas as pessoas na lista vão ter seu peso, ou seja, todos vão ter o seu p[1]
#deixei anotado no discord
