# Sales Classification

sales = float(input('Enter the sales amount: '))

if sales >= 10000:
    print('Excellent sales performance.')
    
elif sales >= 75000:
    print('Good sales performance.')
    
elif sales >= 50000:    
    print('Average sales performance.')
    
else:
    print('Poor sales performance.')