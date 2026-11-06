# ====================================================================
#  R DATA STRUCTURES: BEGINNER PRACTICE FILE
# ====================================================================
#  How to use this file
#  1. Open it in RStudio (File > Open File).
#  2. Put your cursor on a line and press Ctrl+Enter (Windows/Linux)
#     or Cmd+Enter (Mac) to run ONE line at a time.
#  3. Read what appears in the Console before moving on.
#  4. Change numbers and names, run again, and see what happens.
#     Breaking things on purpose is the fastest way to learn.
#
#  Anything after a # is a comment: a note for humans. R ignores it.
#
#  Sections
#   0. Setup
#   1. Vectors
#   2. Data frames
#   3. Tibbles
#   4. Matrices
#   5. Arrays
#   6. Lists
#   7. Factors
#   8. Checking your data
#   9. Arithmetic
#  10. Converting between structures
#  11. Your turn (exercise answers)
# ====================================================================


# ---- 0. SETUP -------------------------------------------------------
# Run this once. It downloads the tibble package only if you do not have it.
if (!requireNamespace("tibble", quietly = TRUE)) install.packages("tibble")
library(tibble)    # switch the package on for this session


# ---- 1. VECTORS: one row of values, all the same type ---------------
ages <- c(25, 29, 30, 35)       # c() means "combine"
print(ages)                     # [1] 25 29 30 35
ages[2]                         # second item -> 29 (R counts from 1)
ages[2:3]                       # items 2 to 3 -> 29 30
ages[-1]                        # everything EXCEPT the first
length(ages)                    # how many items -> 4
1:5                             # counting shortcut -> 1 2 3 4 5
c(1, "two", TRUE)               # mixed types all become text


# ---- 2. DATA FRAMES: a table, one column per variable ---------------
staff <- data.frame(
  Name   = c("Sandip", "Gaurav", "Ram", "Pratik"),
  Age    = c(25, 29, 30, 35),
  Salary = c(45000, 60000, 80000, 100000)
)
print(staff)

# Getting things out: staff[rows, columns]
staff$Name                      # one column, using $
staff[2, ]                      # row 2, all columns
staff[2, 3]                     # row 2, column 3 -> 60000
staff[staff$Age > 28, ]         # filter: only people older than 28

# Changing things
staff$Bonus <- staff$Salary * 0.10     # add a new column
staff$Age[1] <- 26                     # change one value
staff$Bonus <- NULL                    # delete a column
nrow(staff)                            # number of rows
ncol(staff)                            # number of columns

# Drawing things (charts appear in the Plots panel)
barplot(staff$Salary, names.arg = staff$Name,
        main = "Salary by Person", ylab = "Salary", col = "steelblue")
plot(staff$Age, staff$Salary, pch = 19, col = "tomato",
     xlab = "Age", ylab = "Salary", main = "Age vs Salary")
hist(staff$Age, main = "Age Distribution", col = "lightgreen")


# ---- 3. TIBBLES: a friendlier data frame ----------------------------
# a) from vectors
my_tib <- tibble(
  Id   = 1:3,
  Name = c("Sandip", "Gaurav", "Ram"),
  Age  = c(25, 29, 30)
)
print(my_tib)                   # notice <int>, <chr>, <dbl> under the names

# b) tribble: type the table the way it looks (names start with ~)
small_tib <- tribble(
  ~first_name, ~age, ~city,
  "Saurabh",   24,   "Pathardi",
  "Prasad",    22,   "Beed",
  "Manohar",   27,   "Ahmednagar"
)
print(small_tib)

# c) convert an existing data frame
tib_from_df <- as_tibble(staff)
print(tib_from_df)

# d) convert a matrix (columns are named V1, V2... and R may show a
#    harmless warning about names)
as_tibble(matrix(1:6, nrow = 3))


# ---- 4. MATRICES: a grid, all the same type -------------------------
A <- matrix(1:9, nrow = 3, byrow = TRUE)
print(A)

matrix(1:6, nrow = 2)                   # fills column by column (default)
matrix(1:6, nrow = 2, byrow = TRUE)     # fills row by row

# Checking
dim(A)                          # 3 3
nrow(A)                         # 3
ncol(A)                         # 3
length(A)                       # 9

# Accessing
A[1, 2]                         # row 1, column 2 -> 2
A[2, ]                          # whole row 2 -> 4 5 6
A[ , 2]                         # whole column 2 -> 2 5 8
A[1:2, 2:3]                     # a sub-grid

# Changing, adding, deleting
A[3, 3] <- 30                   # change one cell
rbind(A, c(10, 11, 12))         # add a ROW (a bigger copy is shown)
cbind(A, c(1, 1, 1))            # add a COLUMN
A[-2, ]                         # show A without row 2
A[ , -2]                        # show A without column 2

# Names for rows and columns
matrix(1:4, nrow = 2,
       dimnames = list(c("r1", "r2"), c("c1", "c2")))

# Special matrices
matrix(5, 3, 3)                 # every cell is 5
diag(3)                         # identity matrix (1s on the diagonal)
diag(c(5, 3, 3))                # diagonal matrix with 5, 3, 3

# A mistake on purpose (remove the # to see the error, then fix it):
# cbind(A, matrix(1:3, nrow = 1))   # Error: number of rows must match


# ---- 5. ARRAYS: stacks of matrices ----------------------------------
arr <- array(1:12, dim = c(2, 3, 2))    # 2 rows x 3 columns x 2 layers
print(arr)
dim(arr)                        # 2 3 2
arr[1, 2, 2]                    # row 1, column 2, layer 2 -> 9
arr[2, 3, 1]                    # row 2, column 3, layer 1 -> 6
arr[ , , 1]                     # the whole first layer
sum(arr)                        # 78
arr * 10                        # multiply every value

array(1:12, dim = c(2, 3, 2),
      dimnames = list(c("r1", "r2"),
                      c("c1", "c2", "c3"),
                      c("Layer1", "Layer2")))

# Editing a vector step by step
x <- c(1, 2, 3, 4, 5)
x <- c(x, 6);                 print(x)    # add to the end
x <- append(x, 99, after = 2); print(x)   # insert after position 2
x <- x[x != 3];               print(x)    # remove every 3
x <- x[!x %in% c(4, 6)];      print(x)    # remove several values
x[1] <- 0;                    print(x)    # update one value
x[2:3] <- -1;                 print(x)    # update several values

y <- c(1, 2, 3)
y[6] <- 9                       # writing past the end fills gaps with NA
print(y)


# ---- 6. LISTS: a bag that holds anything ----------------------------
empList <- list(
  ID    = c(1, 2, 3, 4),
  Names = c("Debi", "Sandeep", "Subham", "Shiba"),
  Total = 4
)
print(empList)

names(empList)                  # "ID" "Names" "Total"
length(empList)                 # 3
empList$Names                   # by name
empList[[2]]                    # by position (double brackets: the item itself)
empList[2]                      # single brackets: a small LIST (the pocket)
empList[[2]][2]                 # "Sandeep"

empList$Total <- 5              # change an item
empList$Age <- c(34, 23, 18, 45)    # add a new item
empList$Age <- NULL                 # delete an item
empList[-3]                     # view without item 3 (original unchanged)
str(empList)                    # structure at a glance

merged <- c(list(1, 2, 3), list("Sun", "Mon", "Tue"))
length(merged)                  # 6
unlist(list(1:5))               # list -> vector
sapply(list(math = c(70, 80, 90), art = c(60, 75)), mean)


# ---- 7. FACTORS: categories with levels -----------------------------
gender <- factor(c("female", "male", "male", "female"))
print(gender)
levels(gender)                  # "female" "male"
is.factor(gender)               # TRUE
class(gender)                   # "factor"
as.integer(gender)              # 1 2 2 1 (stored as numbers inside)
table(gender)                   # counts per level
gender[3]                       # one item (levels are shown too)
gender[-3]                      # everything except item 3

gender[3] <- "other"            # WARNING: "other" is not a level, so NA
print(gender)
levels(gender) <- c(levels(gender), "other")   # add the level first...
gender[3] <- "other"                           # ...then it works
print(gender)

size <- factor(c("small", "large", "medium"),
               levels = c("small", "medium", "large"),
               ordered = TRUE)
print(size)                     # Levels: small < medium < large
size[1] < size[2]               # TRUE

employee <- data.frame(
  age    = c(40, 49, 48),
  gender = factor(c("male", "male", "female"))
)
is.factor(employee$gender)      # TRUE
summary(employee)               # counts each level


# ---- 8. CHECKING YOUR DATA ------------------------------------------
scores <- data.frame(
  Name   = c("Ann", "Ben", "Cy", "Di"),
  Age    = c(25, 29, NA, 35),            # one value is missing on purpose
  Salary = c(45000, 60000, 80000, 100000)
)

class(scores)                   # "data.frame"
typeof(1:3)                     # "integer"
typeof(c(1.5, 2))               # "double"
dim(scores)                     # 4 3
str(scores)                     # type and first values of each column
head(scores, 2)                 # first 2 rows
summary(scores)                 # quick statistics (notice NA's for Age)
names(scores)                   # column names
is.numeric(scores$Age)          # TRUE
is.na(scores$Age)               # FALSE FALSE TRUE FALSE
sum(is.na(scores$Age))          # 1 missing value
colSums(is.na(scores))          # missing values per column
mean(scores$Age)                # NA (one missing value spoils it)
mean(scores$Age, na.rm = TRUE)  # 29.66667 (ignore the NA)
scores[complete.cases(scores), ]    # keep only fully filled rows
duplicated(c(1, 2, 2, 3))       # FALSE FALSE TRUE FALSE
unique(c(1, 2, 2, 3))           # 1 2 3

# ---- 9. ARITHMETIC --------------------------------------------------
7 / 2                           # 3.5
2 ^ 3                           # 8
7 %% 2                          # 1 (remainder)
7 %/% 2                         # 3 (whole-number division)

a <- c(1, 2, 3)
b <- c(10, 20, 30)
a + b                           # 11 22 33
a * b                           # 10 40 90 (item by item)
a * 2                           # 2 4 6
a ^ 2                           # 1 4 9
sum(a); mean(a); max(a); cumsum(a)
c(1, 2, 3, 4) + c(10, 20)       # recycling: 11 22 13 24

# Data frame columns
scores$Salary / 1000            # 45 60 80 100
scores$Salary * 0.7             # 31500 42000 56000 70000
sum(scores$Salary)              # 285000
mean(scores$Salary)             # 71250
colMeans(scores[ , c("Age", "Salary")], na.rm = TRUE)

# Matrices: two kinds of multiplication
A2 <- matrix(1:4, nrow = 2)
B2 <- matrix(5:8, nrow = 2)
A2 + B2                         # cell by cell
A2 * B2                         # cell by cell
A2 %*% B2                       # true matrix multiplication
t(A2)                           # transpose
rowSums(A2); colSums(A2)

# Factors are categories, not numbers
# factor(c("a", "b")) + 1       # gives NA and a warning (try it!)


# ---- 10. CONVERTING BETWEEN STRUCTURES ------------------------------
unlist(list(1:5))                                   # list -> vector
matrix(unlist(list(1, 2, 3, 4, 5, 6)),
       nrow = 2, byrow = TRUE)                      # list -> matrix
as.data.frame(matrix(1:6, nrow = 2))                # matrix -> data frame
as_tibble(scores)                                   # data frame -> tibble


# ---- 11. YOUR TURN (exercise answers) -------------------------------
# Try the exercises in the notes FIRST, then peek here.

# Q1 temps
temps <- c(24, 27, 22, 30, 26)
max(temps); min(temps); mean(temps)

# Q2 matrix by row, then column 2
m <- matrix(1:12, nrow = 3, byrow = TRUE)
dim(m)
m[ , 2]

# Q3 factor of sizes
sz <- factor(c("small", "large", "medium", "small"),
             levels = c("small", "medium", "large"))
table(sz)

# Q4 list with a vector inside
me <- list(name = "Amina", age = 28,
           foods = c("rice", "beans", "mango"))
me$foods[2]

# Q5 array
arr5 <- array(1:12, dim = c(2, 3, 2))
arr5[2, 3, 1]                   # 6

# Q6 shop sales matrix
sales <- matrix(c(12, 15, 11, 14, 18,
                  9, 10, 13, 8, 12,
                  20, 22, 19, 25, 21),
                nrow = 3, byrow = TRUE,
                dimnames = list(c("Branch1", "Branch2", "Branch3"),
                                c("Mon", "Tue", "Wed", "Thu", "Fri")))
rowSums(sales)                  # total per branch
colSums(sales)                  # total per day
which.max(colSums(sales))       # best day overall

# Q7 class results
results <- data.frame(
  Student = c("Asha", "Brian", "Chen", "Dina"),
  Maths   = c(80, 65, 90, 55),
  English = c(70, 60, 85, 75),
  Grade   = factor(c("A", "B", "A", "C"))
)
results$Average <- (results$Maths + results$English) / 2
results[results$Average > 70, ]
barplot(table(results$Grade), main = "Grade counts", col = "orange")

# Q8 missing ages
clinic <- c(30, NA, 45, NA, 52)
sum(is.na(clinic))                          # 2
mean(clinic, na.rm = TRUE)                  # 42.33333
clinic[is.na(clinic)] <- mean(clinic, na.rm = TRUE)
clinic

# Q9 rainfall array: 12 months x 3 towns x 2 years
rain <- array(round(runif(72, 0, 200)), dim = c(12, 3, 2))
rain[ , 2, 2]                   # Town 2, Year 2, all months

# Q10 survey bundled in a list
survey <- list(
  answers     = data.frame(id = 1:3, score = c(4, 5, 3)),
  respondents = 3,
  summary     = "Most people were satisfied."
)
survey$respondents

# Q11 the fix for the cbind error
A3 <- matrix(1:6, nrow = 3)
B3 <- matrix(1:3, nrow = 3)     # now B3 also has 3 rows
cbind(A3, B3)

# Q12 conversions
as_tibble(data.frame(x = 1:3, y = c("a", "b", "c")))
matrix(unlist(list(1, 2, 3, 4, 5, 6)), nrow = 2, byrow = TRUE)
