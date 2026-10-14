# Task 5 - Average Marks 

python_marks = int(input("Enter Python Marks: "))
sql_marks = int(input("Enter SQL Marks: "))
excel_marks = int(input("Enter Excel Marks: "))
power_bi_marks = int(input("Enter Power BI Marks: "))
statistics_marks = int(input("Enter Statistics Marks: "))

total_marks = (
    python_marks
    + sql_marks
    + excel_marks
    + power_bi_marks
    + statistics_marks
)

average_marks = total_marks / 5

print("\n--- Marks Details ---")
print("Total Marks:", total_marks)
print("Average Marks:", average_marks)