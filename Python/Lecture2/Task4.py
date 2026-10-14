# Task 4 - Check Profit and Lost

cost_price = float(input('Enter the cost price: '))
selling_price = float(input('Enter the selling price: '))

if selling_price > cost_price:
    profit = selling_price - cost_price
    print('Profit: ',profit)
    
else:
    loss = cost_price - selling_price
    print('Loss: ',loss)