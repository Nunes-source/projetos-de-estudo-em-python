#achei que esse lance de false e true so funcionava com if, elif e else, mas não se voce indica com == como ta indicado na linha 5, é como se fosse o modulo if más so de verdadeiro ou falso
#bom esse programa indica se voce mora em uma cidade que tem 'santo' no nome
#relembrando que esse[:5] serve pra indicar quantos caracteres a palavra tem que ter antes de um possivel espaço, ja o .upper serve pra não cofundir o programa na hora que alguem escrever o nome santo de uma forma "errada"
#ja que o == esta se referindo a um "santo" totalmente com letras maiusculas então o .upper coloca tudo em maiusculo pra o programa indicar se é verdadeiro de a cordo com o santo que indicamos com o ==.

cidade = str(input('qual cidade que voce nasceu? - ')).strip()

print(cidade[:5].upper() == 'SANTO')
