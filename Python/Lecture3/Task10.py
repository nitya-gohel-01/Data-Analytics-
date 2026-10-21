# Count how many students passed, given a list of marks and a passing score of 35

students_marks = [45, 67, 23, 89, 34, 56, 78, 12, 90, 33]
count_passed = 0

for marks in students_marks:
    if marks >= 35:
        count_passed += 1
        
print("Number of students who passed:", count_passed)   