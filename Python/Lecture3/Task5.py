# Count how many sales values exceed ₹50,000

sales = [45000, 60000, 75000, 30000, 80000, 55000, 40000]
count=0

for sale in sales:
    if sale > 50000:
        count += 1
        
print("The number of sales values exceeding ₹50,000 is:", count)