# Print Fibonaci Series

n = int(input("Enter the number of terms: "))

a = 0
b = 1

for i in range(n):
    print(a, end="\n")
    
    c = a + b
    a = b
    b = c
