# ============================================================
# R PRACTICE FILE: Control statements, loops, iteration and functions
# Type your answers under each '# YOUR CODE HERE' line and run them
# (Ctrl+Enter / Cmd+Enter). Try WITHOUT looking at the answers first!
# SAFETY: save this file (Ctrl+S) before running any loop. If R gets stuck,
# press Esc or the red STOP sign in the Console.
# ============================================================

# ---- Warm-up: run these and change the numbers ----
marks <- 72
if (marks >= 50) print("Pass") else print("Fail")
for (i in 1:3) print(i)
sq <- function(x) x^2
sq(7)

# ================= PART B: CODING =================

# B1. Write is_even(n) that returns TRUE or FALSE. Test with 10 and 7.
# YOUR CODE HERE

# B2. Write grade(marks): A for 80+, B for 70-79, C for 60-69, D otherwise.
#     Test with sapply(c(85, 72, 64, 40), grade).
# YOUR CODE HERE

# B3. Use a for loop to print "1 squared is 1" ... "5 squared is 25".
# YOUR CODE HERE

# B4. Use a while loop: how many times can you halve 100 before it drops below 1?
# YOUR CODE HERE

# B5. Write count_above(x, limit = 50). Test with c(30, 60, 80, 45), then limit = 40.
# YOUR CODE HERE

# B6. Write max_min(x) that returns a list with the highest and lowest. Test with c(5, 2, 9).
# YOUR CODE HERE

# B7. Write calc(a, b, op = "+") using switch for + - * /. Test calc(8, 2), calc(8, 2, "/").
# YOUR CODE HERE

# B8. Use a loop and next to collect 1..10 that are NOT multiples of 3.
# YOUR CODE HERE

# B9. Use repeat and break to find the first number above 20 divisible by 6.
# YOUR CODE HERE

# B10. Use sapply() to find the sum of each item of list(a = 1:3, b = 4:6).
# YOUR CODE HERE

# ================= PART C: REAL-LIFE APPLICATIONS =================

# C1. taxi_fare(km, student = FALSE): base 100; first 5 km at 40/km; after that 30/km;
#     students get 10% off. Find the fare for 3 km, 8 km, and 8 km as a student.
# YOUR CODE HERE

# C2. summarise_marks(marks, pass_mark = 50) returning the mean, highest and number of passes.
#     Use c(45, 72, 58, 90, 33).
# YOUR CODE HERE

# C3. data_cost(gb): first 1 GB costs 100, next 4 GB cost 80/GB, above 5 GB cost 60/GB.
#     Find the cost for 0.5, 3 and 8 GB.
# YOUR CODE HERE

# C4. months_to_save(goal, monthly, max_months = 1200) with a while loop.
#     Months to reach 10000 at 1500 a month? What if monthly is 0?
# YOUR CODE HERE

# C5. password_strength(pw): Strong if 8+ characters and has a digit; Medium if 6+; else Weak.
#     Test "abc", "hello1", "secure2026".  Hint: nchar(pw) and grepl("[0-9]", pw)
# YOUR CODE HERE

# C6. scores <- c(Ana = 72, Ben = 45, Chao = 50, Dee = 88)
#     Write a function that prints how many passed (50+) and their names.
# YOUR CODE HERE

# ================= CHALLENGES =================
# 1. Write times_table(n) that prints the table for n from 1 to 12 using a loop.
# 2. Write a function bill_with_tax(prices, tax = 0.16) that adds tax to each price and returns the total.
# 3. Change years_to_target() so it also prints the balance after each year.
# 4. Write is_palindrome(word) that says whether a word reads the same backwards.
#    Hint: paste(rev(strsplit(word, "")[[1]]), collapse = "")
# YOUR CODE HERE
