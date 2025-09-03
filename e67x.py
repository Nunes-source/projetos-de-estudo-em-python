contador = 0

final = 10

p1 = int(input('digite o primeiro termo: '))

r = int(input('digite a razão do pa: '))

print(p1)

while contador != final:
    print(p1 + r)
    p1 += r
    contador += 1 #loop do while vem até aqui mostrando os 10 primeiros termos.
    if contador != final:#até que para aqui por causa do continue ja que o final chegou até 10.
        continue
    p = int(input('mais quantos termos você deseja ver?'))
    final += p #agora pra ele continuar a sequenciar junto da repetição passada, o final recebe o valor de p, assim podendo escolher mais quantos termos eu quero ver.
print('fim') #digitando 0 o laço termina.