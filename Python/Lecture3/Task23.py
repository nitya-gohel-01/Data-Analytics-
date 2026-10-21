# Prime Number

num = int(input("Enter any number: "))
count = 0

if num > 1:
    
    for i in range(1, num + 1):
        
        if num % i == 0:
            count += 1

    if count == 2:
        print(num, "is a Prime Number")
    else:
        print(num, "is not a Prime Number")
else:
    print(num, "is not a Prime Number")
