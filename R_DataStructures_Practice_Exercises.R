# ============================================================
# R PRACTICE FILE: Matrices, Arrays, Lists, Factors, Data Frames, Tibbles
# Type your answers under each '# YOUR CODE HERE' line, then run them
# (Ctrl+Enter / Cmd+Enter). Try WITHOUT looking at the answers first!
# ============================================================

# ---- Starting data used in several exercises ----
students <- data.frame(
  id = 1:6,
  name = c("Amina", "Brian", "Chebet", "Dennis", "Esther", "Farid"),
  programme = c("DS", "Stats", "DS", "Stats", "DS", "Stats"),
  test1 = c(78, 61, 88, 55, 92, 70),
  test2 = c(82, 65, 90, 60, 85, 74)
)
str(students)   # a first look at the data

# ---- Warm-up: explore a matrix (run these, then change the numbers) ----
A <- matrix(1:9, nrow = 3, byrow = TRUE)
A
dim(A); A[2, ]; A[, 3]; A * 2; A %*% A; t(A)

# ================= PART B: CODING =================

# B1. Make a 3 x 4 matrix m from 1:12, filled row by row.
#     Show its dimensions, row 2 and column 4.
# YOUR CODE HERE

# B2. Multiply every value in m by 10 and find each row's sum.
# YOUR CODE HERE

# B3. Add a new row (13, 14, 15, 16) to m. What are the dimensions now?
# YOUR CODE HERE

# B4. arr <- array(1:24, dim = c(2, 3, 4)). What is in row 2, column 3, layer 4?
# YOUR CODE HERE

# B5. Make a list pet: name "Mimi", age 3, vaccinated TRUE, toys c("ball", "rope").
#     Show the 2nd toy, add weight = 4.5, remove age, then show the names.
# YOUR CODE HERE

# B6. ratings <- c("good", "poor", "good", "excellent", "poor", "good")
#     Make an ordered factor (poor < good < excellent) and count each level.
# YOUR CODE HERE

# B7. Data frame of 4 products: item (Pen, Book, Bag, Cap),
#     price (50, 120, 800, 250), stock (100, 40, 15, 60).
#     Add value = price * stock. Show products with value above 5000.
# YOUR CODE HERE

# B8. x <- c(12, NA, 15, 9, NA)
#     Count the NAs, find the mean ignoring them, then replace the NAs with that mean.
# YOUR CODE HERE

# B9. Join a = (id 1:3, name Ann, Bob, Cy) and b = (id 1 and 3, city Nairobi, Kisumu) by id.
# YOUR CODE HERE

# B10. Turn the products data frame from B7 into a tibble (needs the tibble package).
# install.packages("tibble")   # run once if needed
# library(tibble)
# YOUR CODE HERE

# ================= PART C: APPLICATIONS =================

# C1. Which programme has the higher average on test2? (use the students data)
# YOUR CODE HERE

# C2. Stock matrix: Pen, Book, Bag in ShopA (10, 5, 8) and ShopB (7, 12, 3), with names.
#     Find the total of each product and each shop.
# YOUR CODE HERE

# C3. answers <- c("Yes", "No", "Yes", "Maybe", "Yes", "No")
#     Make a factor, count each answer, and give rounded percentages.
# YOUR CODE HERE

# C4. patient <- list(id = "P01", name = "Zawadi", temps = c(36.8, 37.5, 38.2))
#     Find the highest temp, check if any is above 38, add status "Fever" or "Normal".
# YOUR CODE HERE

# C5. sales: month (Jan, Feb, Mar), revenue (1200, 1500, 1100), cost (800, 900, 950).
#     Add profit, find the best month, and the total profit.
# YOUR CODE HERE

# ================= CHALLENGE =================
# Add a column 'average' to students (mean of test1 and test2),
# then a column 'grade': 'A' if average >= 80, 'B' if >= 65, otherwise 'C'.
# Hint: nested ifelse().  Then count how many students got each grade with table().
# YOUR CODE HERE
