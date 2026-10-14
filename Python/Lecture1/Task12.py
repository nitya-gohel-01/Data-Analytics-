# Homework 

# Problem 3 - Monthly Sales Analysis 

january_sales = float(input("Enter January Sales: "))
february_sales = float(input("Enter February Sales: "))
march_sales = float(input("Enter March Sales: "))

total_sales = january_sales + february_sales + march_sales
average_sales = total_sales / 3
highest_sales = max(january_sales, february_sales, march_sales)
lowest_sales = min(january_sales, february_sales, march_sales)

print("\n--- Sales Analysis ---")
print("Total Sales:", total_sales)
print("Average Sales:", average_sales)
print("Highest Sales:", highest_sales)
print("Lowest Sales:", lowest_sales)
