lines = ('=' * 30)
soccer_teams = ('botafogo', 'palmeiras', 'fortaleza', 'flamengo', 'são paulo', 'bahia', 'cruzeiro', 'internacional', 'atletico - mg',
                'vasco', 'juventude', 'gremio', 'athletico', 'bragantino', 'criciuma', 'ec vitoria', 'corinthians', 'fluminense',
                'cuiaba', 'atletico - go')

print(lines)

print('on the five first places:')
for first_5 in soccer_teams[0:5]:
    print('{:^30}'.format(first_5))

print(lines)

print('on the last four places:')
for last_4 in soccer_teams[-4:]:
    print('{:^30}'.format(last_4))

print(lines)

print('the position of atletico - mg is: {} '.format(soccer_teams.index('atletico - mg') + 1))

print(lines)

print('the teams in alphabetic order:')
print(tuple(sorted(soccer_teams)))
