# Task 6 - Discount Calculation 

amount = float(input('Enter the purchase amount: '))

if amount >= 100000:
    discount = amount * 0.20
    print('Discount: ', discount)
    
elif amount >= 50000:   
    discount = amount * 0.10
    print('Discount: ', discount)
    
elif amount >= 25000:
    discount = amount * 0.05
    print('Discount: ', discount)

else:
    discount = 0
    print('Discount: ', discount)