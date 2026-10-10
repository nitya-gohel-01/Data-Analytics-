# Challenge Task - customer classification

customer_name = input('Enter the customer name: ')
purchase_amount = float(input('Enter the purchase amount: '))
number_of_orders = int(input('Enter the number of items purchased: '))


if purchase_amount >= 100000 and number_of_orders >= 10:
    print('Premium Customer.')
    
elif purchase_amount >= 50000 and number_of_orders >= 5:
    print('Gold Customer.')
    
elif purchase_amount >= 25000 and number_of_orders >= 3:
    print('Silver Customer.')
    
else:
    print('Regular Customer.')