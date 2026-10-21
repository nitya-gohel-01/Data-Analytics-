
# Count Vowels

words = input('Enter any word: ')
count = 0

for i in range(0, len(words), 1):

    if words[i].lower() == 'a' or words[i].lower() == 'e' or words[i].lower() == 'i' or words[i].lower() == 'o' or words[i].lower() == 'u':
        count += 1

print('Total vowels =', count)
