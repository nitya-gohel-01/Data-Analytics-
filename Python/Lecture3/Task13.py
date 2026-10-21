# Stop processing a list when the first value greater than ₹1,00,000 is found.

num_list = [50000, 75000, 120000, 90000, 150000, 80000]

for num in num_list :
    
    if num > 100000:
        print("Found a value greater than ₹1,00,000:", num) 
        break