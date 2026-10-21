
# Reverse String

temp_strings = input('Enter any string to reverse: ')
temp = ''

for i in range(len(temp_strings)-1, -1, -1):
    
    temp += temp_strings[i]

print(temp)
