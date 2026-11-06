# R Programming Notes: Matrices, Arrays, Lists, Factors, Data Frames, Tibbles. Runnable code
# How to use: open this file in RStudio and run it line by line (Ctrl+Enter / Cmd+Enter),
# or run the whole file with Source. Lines starting with '# ' directly before code
# are examples that cause errors on purpose; remove the '# ' to try them.
# The tibble and dplyr parts need those packages (installed automatically if missing).

# ---- Matrices: creating ----
A <- matrix(1:9, nrow = 3, byrow = TRUE)
A
B <- matrix(1:6, nrow = 2)
B
matrix(1:6, nrow = 2, byrow = TRUE)
matrix(0, nrow = 2, ncol = 2)
M <- matrix(1:9, nrow = 3, byrow = TRUE,
  dimnames = list(c("r1", "r2", "r3"), c("x", "y", "z")))
M
M["r2", "y"]
M["r1", ]

# ---- Matrices: special ones ----
matrix(5, 3, 3)
diag(c(5, 3, 3))
diag(3)

# ---- Matrices: checking ----
class(A)
is.matrix(A)
typeof(A)
dim(A)
nrow(A)
ncol(A)
length(A)
str(A)
is.numeric(A)
anyNA(A)

# ---- Matrices: accessing ----
A[2, ]
A[, 3]
A[2, 3]
A[1:2, 1:2]
A[-1, ]
A[2, , drop = FALSE]
A[A > 5]
which(A == 5)
A[5]

# ---- Matrices: modifying ----
A2 <- A
A2[3, 3] <- 30
A2[2, ] <- 0
A2
A2[A2 > 20] <- NA
A2
A[3, 3]

# ---- Matrices: adding ----
rbind(A, c(10, 11, 12))
cbind(A, c(10, 11, 12))
rbind(A[1, ], c(10, 11, 12), A[-1, ])
A3 <- rbind(A, c(10, 11, 12))
dim(A3)
# cbind(A, matrix(c(10, 11, 12), nrow = 1))

# ---- Matrices: deleting ----
A[-2, ]
A[, -2]
A4 <- A[-2, ]
dim(A4)

# ---- Matrices: arithmetic ----
A + 10
A * 2
B2 <- matrix(9:1, nrow = 3, byrow = TRUE)
A + B2
A * B2
A %*% B2
t(A)
P <- matrix(1:4, nrow = 2, byrow = TRUE)
Q <- matrix(5:8, nrow = 2, byrow = TRUE)
P %*% Q
det(P)
solve(P)
A > 5
sum(A)
mean(A)
max(A)

# ---- Matrices: row and column summaries ----
rowSums(A)
colSums(A)
rowMeans(A)
colMeans(A)
apply(A, 1, max)
apply(A, 2, min)
diag(A)
sum(diag(A))

# ---- Matrices: mixing types ----
matrix(c(1, "a", 3, 4), nrow = 2)

# ---- Matrices: mistakes ----
matrix(1:5, nrow = 2)
A[3, 1]
A[1, 3]
A * A

# ---- Arrays: creating ----
arr <- array(1:12, dim = c(2, 3, 2))
arr
arr_n <- array(1:12, dim = c(2, 3, 2),
  dimnames = list(c("row1", "row2"), c("col1", "col2", "col3"), c("Arr1", "Arr2")))
arr_n

# ---- Arrays: checking ----
dim(arr)
length(arr)
class(arr)
is.array(arr)
typeof(arr)

# ---- Arrays: accessing ----
arr[1, 2, 2]
arr[, , 1]
arr[2, , ]
arr[, 2, ]
arr_n["row2", "col3", "Arr1"]
arr_n[, , "Arr2"]
arr[arr > 10]

# ---- Arrays: modifying ----
arr2 <- arr
arr2[1, 1, 1] <- 100
arr2[1, 1, 1]
arr2[, , 2] <- 0
sum(arr2)

# ---- Arrays: maths ----
sum(arr)
mean(arr)
max(arr)
apply(arr, 3, sum)
apply(arr, 1, sum)
apply(arr, c(1, 3), sum)
arr * 2
as.vector(arr)

# ---- Arrays: mistakes ----
# arr[1, 2]
arr[1, 2, 1]

# ---- Lists: creating ----
list(1, "a", TRUE)
student_info <- list(name = "Amina", age = 21,
  scores = c(78, 82, 90), passed = TRUE)
student_info

# ---- Lists: checking ----
class(student_info)
is.list(student_info)
length(student_info)
names(student_info)
str(student_info)
sapply(student_info, class)

# ---- Lists: accessing ----
student_info$name
student_info[["age"]]
student_info[[3]]
student_info[[3]][2]
student_info$scores[2]
student_info["age"]
class(student_info["age"])
class(student_info[["age"]])
student_info[c("name", "age")]

# ---- Lists: modifying ----
student_info$age <- 22
student_info$city <- "Nairobi"
student_info$passed <- NULL
student_info[["scores"]][4] <- 95
length(student_info)
names(student_info)
mean(student_info$scores)
names(student_info[-1])

# ---- Lists: combining ----
extra <- list(grade = "A")
combined <- c(student_info, extra)
names(combined)
lst1 <- list(1, 2, 3)
lst2 <- list("Sun", "Mon")
new_list <- c(lst1, lst2)
str(new_list)
c(c("Debi", "Sandeep"), c(34, 23))
nums <- c(1, 5, 6, 3)
append(nums, 45)
nums

# ---- Lists: converting ----
unlist(list(a = 1, b = 2, c = 3))
unlist(list(1:3, 4:5))
lst <- list(c(1, 2, 3), c(4, 5, 6))
matrix(unlist(lst), nrow = 2, byrow = TRUE)

# ---- Lists: sapply ----
scores_list <- list(Amina = c(78, 82), Brian = c(61, 65), Chebet = c(88, 90))
sapply(scores_list, mean)
sapply(scores_list, max)
sapply(scores_list, length)

# ---- Lists: nested ----
school <- list(name = "Hill School",
  teachers = list(maths = "Ms Ode", science = "Mr Kim"))
school$teachers$maths
school[["teachers"]][["science"]]

# ---- Lists: data frames underneath ----
df_small <- data.frame(a = 1:2, b = c("x", "y"))
is.list(df_small)
typeof(df_small)
length(df_small)

# ---- Factors: creating and checking ----
gender <- factor(c("female", "male", "male", "female"))
gender
levels(gender)
nlevels(gender)
class(gender)
is.factor(gender)
typeof(gender)
as.integer(gender)
as.character(gender)
table(gender)
summary(gender)

# ---- Factors: accessing and modifying ----
gender[3]
gender[c(2, 4)]
gender[-3]
gender[2] <- "female"
gender
g2 <- factor(c("female", "male"))
g2[1] <- "other"
g2
levels(g2) <- c(levels(g2), "other")
g2[1] <- "other"
g2

# ---- Factors: order and tidying ----
size <- factor(c("small", "large", "medium", "small"),
  levels = c("small", "medium", "large"), ordered = TRUE)
size
size[2] > size[1]
max(size)
sort(size)
g3 <- factor(c("a", "b", "c"))[1:2]
levels(g3)
levels(droplevels(g3))
relevel(gender, ref = "male")
cut(c(15, 25, 45), breaks = c(0, 18, 35, 100),
  labels = c("child", "young", "adult"))

# ---- Factors: in data frames and the number trap ----
df_f <- data.frame(age = c(40, 49, 48),
  group = factor(c("male", "male", "female")))
is.factor(df_f$group)
levels(df_f$group)
table(df_f$group)
f <- factor(c("10", "20", "10"))
as.numeric(f)
as.numeric(as.character(f))

# ---- Data frames: creating ----
students <- data.frame(
  id        = 1:6,
  name      = c("Amina", "Brian", "Chebet", "Dennis", "Esther", "Farid"),
  programme = c("DS", "Stats", "DS", "Stats", "DS", "Stats"),
  test1     = c(78, 61, 88, 55, 92, 70),
  test2     = c(82, 65, 90, 60, 85, 74),
  award     = c(TRUE, FALSE, TRUE, FALSE, TRUE, FALSE)
)
students

# ---- Data frames: checking ----
head(students, 3)
tail(students, 2)
dim(students)
nrow(students)
ncol(students)
names(students)
class(students)
is.data.frame(students)
str(students)
summary(students)
summary(students$test1)
class(students$test1)
is.numeric(students$test1)
is.character(students$name)
sapply(students[, 1:3], class)
anyNA(students)
colSums(is.na(students))

# ---- Data frames: accessing ----
students$test1
students[["name"]]
students[[2]]
students["test1"]
students[2, ]
students[3, "test1"]
students[1:2, c("name", "test1")]
students[, "test1"]

# ---- Data frames: filtering and sorting ----
students$test1 > 75
students[students$test1 > 75, c("name", "test1")]
students[students$programme == "DS" & students$test1 > 80, c("name", "test1")]
sum(students$test1 > 75)
subset(students, programme == "DS", select = c(name, test1, test2))
students[order(-students$test1), c("name", "test1")]
head(students[order(students$test1), c("name", "test1")], 2)

# ---- Data frames: adding rows ----
new_student <- data.frame(id = 7, name = "Grace", programme = "DS",
  test1 = 80, test2 = 84, award = TRUE)
students_plus <- rbind(students, new_student)
nrow(students_plus)
tail(students_plus, 1)
products <- data.frame(id = c(1, 2), item = c("Pen", "Book"))
bad <- rbind(products, c(3, "Ruler"))
str(bad)
good <- rbind(products, data.frame(id = 3, item = "Ruler"))
str(good)

# ---- Data frames: new columns and arithmetic ----
students$total <- students$test1 + students$test2
students$total
students$average <- students$total / 2
students$average
students$grade <- ifelse(students$average >= 70, "Pass", "Fail")
students$grade
table(students$grade)
round(students$test1 / 100, 2)
students$test2 - students$test1
mean(students$test2 - students$test1)
sum(students$total)
students$name[which.max(students$total)]
students$award <- NULL
names(students)

# ---- Data frames: summaries ----
mean(students$test1)
sapply(students[, c("test1", "test2")], mean)
colMeans(students[, c("test1", "test2")])
sapply(students[, c("test1", "test2")], max)
table(students$programme)
aggregate(test1 ~ programme, data = students, FUN = mean)
tapply(students$test1, students$programme, mean)
aggregate(cbind(test1, test2) ~ programme, data = students, FUN = mean)
unique(students$programme)
round(cor(students$test1, students$test2), 2)

# ---- Data frames: simple plots ----
barplot(students$test1, names.arg = students$name)
plot(students$test1, students$test2)

# ---- Data frames: removing ----
tmp <- students[1:3, c("name", "test1", "test2")]
tmp
tmp$test2 <- NULL
tmp
tmp[-2, ]
subset(tmp, test1 > 60)
names(tmp)[2] <- "score"
names(tmp)

# ---- Data frames: combining ----
df1 <- data.frame(Name = c("Alice", "Bob"), Age = c(25, 30), Score = c(80, 75))
df2 <- data.frame(Name = c("Charlie", "David"), Age = c(28, 35), Score = c(90, 85))
rbind(df1, df2)
df3 <- data.frame(Height = c(160, 175), Weight = c(55, 70))
cbind(df1, df3)
cities <- data.frame(id = c(1, 2, 3), city = c("Nairobi", "Mombasa", "Kisumu"))
merge(students[1:3, c("id", "name")], cities, by = "id")

# ---- Data frames: missing values ----
scores <- data.frame(name = c("A", "B", "C"), mark = c(70, NA, 85))
is.na(scores$mark)
colSums(is.na(scores))
mean(scores$mark)
mean(scores$mark, na.rm = TRUE)
na.omit(scores)
complete.cases(scores)
scores[scores$mark > 60, ]
subset(scores, mark > 60)

# ---- Data frames: mistakes ----
# data.frame(a = 1:3, b = 1:2)
students$Test1
students[2]
# rbind(df1, data.frame(Nme = "Zed", Age = 40, Score = 60))

# (The next two lines install the packages only if they are missing. You need internet.)
if (!requireNamespace("tibble", quietly = TRUE)) install.packages("tibble")
if (!requireNamespace("dplyr", quietly = TRUE)) install.packages("dplyr")

# ---- Tibbles: installing ----
# install.packages("tibble")
library(tibble)

# ---- Tibbles: tibble() ----
my_tib <- tibble(
  Id     = 1:4,
  Name   = c("Sandip", "Gaurav", "Ram", "Pratik"),
  Age    = c(25, 29, 30, 35),
  Role   = c("Engineer", "Data Scientist", "Developer", "HR"),
  Salary = c(45000, 60000, 80000, 100000)
)
my_tib

# ---- Tibbles: tribble() ----
people <- tribble(
  ~first_name, ~last_name, ~age, ~city,
  "Saurabh",   "Puri",     24,   "pathardi",
  "Prasad",    "Bade",     22,   "Beed",
  "Manohar",   "Khedkar",  27,   "Ahmednagar"
)
people

# ---- Tibbles: as_tibble() ----
df <- data.frame(name = c("Saurabh", "Prasad", "Manohar"),
  age = c(25, 30, 35),
  city = c("New York", "San Francisco", "Los Angeles"))
tib <- as_tibble(df)
tib
m <- matrix(1:6, nrow = 2, dimnames = list(NULL, c("a", "b", "c")))
as_tibble(m)

# ---- Tibbles: checking ----
class(tib)
is.data.frame(tib)
dim(tib)
names(tib)
glimpse(tib)
as.data.frame(tib)

# ---- Tibbles: the differences in action ----
df_small <- data.frame(x = 1:3, y = c("a", "b", "c"))
df_small[, "x"]
tib_small <- as_tibble(df_small)
tib_small[, "x"]
tib_small$x
df_n <- data.frame(name = c("A", "B"))
df_n$na
as_tibble(df_n)$na
names(data.frame("my col" = 1))
names(tibble("my col" = 1))
library(dplyr)

# ---- Tibbles: a taste of dplyr ----
library(dplyr)
scores_tib <- tibble(name = c("Amina", "Brian", "Chebet"), score = c(78, 61, 88))
scores_tib %>% filter(score > 70)
scores_tib %>% mutate(grade = if_else(score >= 70, "Pass", "Fail"))

# ---- Comparison: the same question asked of each structure ----
v <- c(1, 2, 3)
f <- factor(c("a", "b"))
m <- matrix(1:4, nrow = 2)
a <- array(1:8, dim = c(2, 2, 2))
l <- list(1, "a")
d <- data.frame(x = 1:2)
tb <- tibble(x = 1:2)
class(v)
class(f)
class(m)
class(a)
class(l)
class(d)
class(tb)
dim(v)
dim(m)
dim(a)
dim(d)
length(l)
c(1, "a")
str(list(1, "a"))
str(data.frame(n = 1:2, s = c("a", "b")))

# ---- Answers: Part B ----
# B1
m <- matrix(1:12, nrow = 3, byrow = TRUE)
dim(m)
m[2, ]
m[, 4]
# B2
rowSums(m * 10)
# B3
dim(rbind(m, 13:16))
# B4
arr <- array(1:24, dim = c(2, 3, 4))
arr[2, 3, 4]
# B5
pet <- list(name = "Mimi", age = 3, vaccinated = TRUE, toys = c("ball", "rope"))
pet$toys[2]
pet$weight <- 4.5
pet$age <- NULL
names(pet)
# B6
ratings <- c("good", "poor", "good", "excellent", "poor", "good")
ratings_f <- factor(ratings, levels = c("poor", "good", "excellent"), ordered = TRUE)
table(ratings_f)
# B7
shop <- data.frame(item = c("Pen", "Book", "Bag", "Cap"),
  price = c(50, 120, 800, 250), stock = c(100, 40, 15, 60))
shop$value <- shop$price * shop$stock
shop[shop$value > 5000, ]
# B8
x <- c(12, NA, 15, 9, NA)
sum(is.na(x))
mean(x, na.rm = TRUE)
x[is.na(x)] <- mean(x, na.rm = TRUE)
x
# B9
a <- data.frame(id = 1:3, name = c("Ann", "Bob", "Cy"))
b <- data.frame(id = c(1, 3), city = c("Nairobi", "Kisumu"))
merge(a, b, by = "id")
# B10
as_tibble(shop)

# ---- Answers: Part C ----
# C1
tapply(students$test2, students$programme, mean)
# C2
stock <- matrix(c(10, 5, 8, 7, 12, 3), nrow = 3,
  dimnames = list(c("Pen", "Book", "Bag"), c("ShopA", "ShopB")))
stock
rowSums(stock)
colSums(stock)
# C3
answers <- c("Yes", "No", "Yes", "Maybe", "Yes", "No")
answers_f <- factor(answers)
table(answers_f)
round(prop.table(table(answers_f)) * 100)
# C4
patient <- list(id = "P01", name = "Zawadi", temps = c(36.8, 37.5, 38.2))
max(patient$temps)
any(patient$temps > 38)
patient$status <- ifelse(max(patient$temps) > 38, "Fever", "Normal")
patient$status
# C5
sales <- data.frame(month = c("Jan", "Feb", "Mar"),
  revenue = c(1200, 1500, 1100), cost = c(800, 900, 950))
sales$profit <- sales$revenue - sales$cost
sales$profit
sales$month[which.max(sales$profit)]
sum(sales$profit)
