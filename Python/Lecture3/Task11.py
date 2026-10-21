# Print customer names from a list, skipping empty strings.

customer_names = ["Nitya","Kirtan","","Kalu","","Parth"]

for name in customer_names:
    
    if name == "":
        continue
    
    print(name)