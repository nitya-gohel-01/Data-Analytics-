# Task 5 - Customer Segementation   

purchase_amount = float(input('Enter the purchase amount: '))

if purchase_amount >= 100000:
    print('Customer is a Premium member.')
    
elif purchase_amount >= 50000:
    print('Customer is a Gold member.')
    
elif purchase_amount >= 25000:
    print('Customer is a Silver member.')
    
else:
    print('Customer is a Regular member.')