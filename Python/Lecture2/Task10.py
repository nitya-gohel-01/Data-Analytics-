# Order Validation 

quantity = int(input('Enter the quantity of items: '))
unit_price = float(input('Enter the unit price of the item: '))

if quantity > 0 and unit_price > 0:
    print('Order is valid.')
    
else:
    print('Order is invalid. Quantity and unit price must be greater than zero.')