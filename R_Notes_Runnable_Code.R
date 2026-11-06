# R Programming Notes for Absolute Beginners: runnable code
# Part 1: Introduction, Variables and Data Types
# How to use: open this file in RStudio and run it line by line (Ctrl+Enter / Cmd+Enter),
# or run the whole file with Source. Lines starting with '# ' directly before code
# are examples that cause errors on purpose; remove the '# ' to try them.

# ---- Introduction: first lines ----
# This is a comment
print("Hello, R!")
2 + 3
10 / 4
2 * 3 + 4
2 * (3 + 4)
sqrt(16)
# ?sqrt

# ---- Variables: creating ----
age <- 25
age
name <- "Amina"
name
is_student <- TRUE
height = 1.65
30 -> years
years

# ---- Variables: showing values ----
print(age)
cat("My name is", name, "and I am", age, "years old\n")
paste("Hello", name)
paste("Hello", name, sep = "-")
paste0("User", 1)
message("Just a friendly note")

# ---- Variables: updating ----
score <- 50
score <- score + 10
score
counter <- 0
counter <- counter + 1
counter <- counter + 1
counter
a <- 5
b <- a
a <- 100
b
x <- y <- 7
c(x, y)
thing <- 5
class(thing)
thing <- "five"
class(thing)

# ---- Variables: swapping ----
first <- 1
second <- 2
temp <- first
first <- second
second <- temp
c(first, second)

# ---- Variables: calculations ----
length_m <- 8
width_m <- 5
area <- length_m * width_m
area
perimeter <- 2 * (length_m + width_m)
perimeter
price <- 120; quantity <- 3
total <- price * quantity; total

# ---- Variables: names ----
student_age <- 20
studentAge <- 20
student.age <- 20
age2 <- 21
Age <- 30
age <- 25
Age
age
# 2age <- 5
# my age <- 5
# if <- 5

# ---- Variables: managing ----
ls()
exists("age")
rm(score)
exists("score")
assign("city", "Nairobi")
city
get("city")
var_name <- "age"
get(var_name)

# ---- Variables: built-in ----
pi
LETTERS[1:5]
letters[1:3]
month.abb[1:3]
month.name[11]
radius <- 3
pi * radius^2

# ---- Variables: exploring ----
age <- 25
class(age)
typeof(age)
length(age)
str(age)
is.numeric(age)
is.character(age)
name <- "Amina"
nchar(name)
ages <- c(25, 30, 22)
length(ages)
ages[2]
mean(ages)
max(ages)
summary(ages)

# ---- Numeric: basics ----
n <- 42.5
class(n)
typeof(n)
is.numeric(n)
class(7)

# ---- Numeric: arithmetic ----
n + 10
n - 2.5
n * 2
n / 5
n ^ 2
17 %% 5
17 %/% 5
10 %% 2 == 0

# ---- Numeric: maths functions ----
x <- -7.68
abs(x)
round(x)
round(x, 1)
ceiling(x)
floor(x)
trunc(x)
signif(123456, 2)
sqrt(81)
exp(1)
log(100)
log10(100)
log2(8)
log(8, base = 2)
factorial(5)
choose(5, 2)
sin(pi / 2)
max(3, 9, 2)
min(3, 9, 2)
sum(1:10)
mean(c(2, 4, 6))

# ---- Numeric: formatting ----
1e6
format(1e6, scientific = FALSE)
format(1234567.891, big.mark = ",")
round(3.14159, 2)
sprintf("%.2f", 3.14159)
sprintf("%05d", 42L)

# ---- Numeric: special values and precision ----
1 / 0
-1 / 0
0 / 0
sqrt(-1)
is.finite(5)
is.infinite(1 / 0)
is.nan(0 / 0)
0.1 + 0.2 == 0.3
isTRUE(all.equal(0.1 + 0.2, 0.3))
sqrt(2)^2 == 2
.Machine$double.eps

# ---- Integer ----
i <- 5L
class(i)
is.integer(5)
is.integer(5L)
as.integer(7.9)
as.integer("12")
5L + 3L
class(5L + 3L)
5L / 2L
class(5L / 2L)
5L %/% 2L
1:5
class(1:5)
.Machine$integer.max
.Machine$integer.max + 1L

# ---- Character: basics ----
greeting <- "Hello, World"
class(greeting)
is.character(greeting)
'Single quotes work too'
class("123")
nchar(greeting)
nchar("")

# ---- Character: operations ----
toupper(greeting)
tolower(greeting)
substr(greeting, 1, 5)
paste("Good", "morning")
paste("a", "b", sep = "-")
paste0("ID", 1:3)
paste(c("a", "b", "c"), collapse = "")
strsplit("cat,dog,pig", ",")
unlist(strsplit("cat,dog,pig", ","))
gsub("o", "0", "foo boo")
sub("o", "0", "foo boo")
grepl("World", greeting)
startsWith(greeting, "Hello")
endsWith(greeting, "x")
trimws("   hi   ")
toString(1:3)
rev(c("a", "b", "c"))
sort(c("pear", "apple", "mango"))
"apple" < "banana"
"apple" == "Apple"

# ---- Character: sprintf and escapes ----
sprintf("My name is %s and I am %d", "Amina", 25L)
sprintf("Price: %.2f", 19.5)
cat("Line1\nLine2\n")
cat("Name:\tAmina\n")
cat("She said \"Hi\"\n")
print("She said \"Hi\"")

# ---- Character: reverse challenge ----
word <- "R is fun"
letters_list <- strsplit(word, "")[[1]]
rev(letters_list)
paste(rev(letters_list), collapse = "")

# ---- Logical: basics ----
is_adult <- TRUE
class(is_adult)
5 > 3
5 < 3
5 >= 5
5 == 3
5 != 3

# ---- Logical: combining ----
TRUE & FALSE
TRUE | FALSE
!TRUE
xor(TRUE, FALSE)
age <- 25
age >= 18 & age <= 65
age < 18 | age > 65
isTRUE(age > 18)

# ---- Logical: vectors and counting ----
results <- c(TRUE, FALSE, TRUE, TRUE)
sum(results)
mean(results)
any(results)
all(results)
which(results)
!results
scores <- c(40, 75, 62, 90)
scores > 60
scores[scores > 60]
sum(scores > 60)
ifelse(scores >= 50, "Pass", "Fail")
as.numeric(TRUE)
TRUE + TRUE

# ---- Complex ----
z <- 3 + 4i
class(z)
Re(z)
Im(z)
Mod(z)
Conj(z)
z + (1 + 2i)
z * 2
sqrt(as.complex(-1))

# ---- Raw ----
charToRaw("A")
as.raw(255)
rawToChar(as.raw(72))
class(as.raw(1))

# ---- Dates ----
today <- Sys.Date()
class(today)
d <- as.Date("2026-11-05")
d
format(d, "%d/%m/%Y")
format(d, "%A")
weekdays(d)
months(d)
format(d, "%Y")
d + 30
as.Date("2026-12-25") - d
as.numeric(as.Date("2026-12-25") - d)
d > as.Date("2026-01-01")
seq(d, by = "month", length.out = 3)
as.Date("05/11/2026", format = "%d/%m/%Y")
typeof(d)
class(Sys.time())

# ---- Factor ----
sizes <- factor(c("small", "large", "medium", "small"))
sizes
levels(sizes)
nlevels(sizes)
table(sizes)
as.integer(sizes)
grade <- factor(c("low", "high", "medium"), levels = c("low", "medium", "high"), ordered = TRUE)
grade
grade[2] > grade[1]
class(grade)

# ---- Factor: the number trap ----
f <- factor(c("10", "20", "10"))
as.numeric(f)
as.numeric(as.character(f))

# ---- Special values ----
x <- c(5, NA, 8)
is.na(x)
sum(x)
sum(x, na.rm = TRUE)
mean(x, na.rm = TRUE)
sum(is.na(x))
which(is.na(x))
x[!is.na(x)]
ifelse(is.na(x), 0, x)
NA + 1
NA == NA
NA & FALSE
NA | TRUE
class(NA)
class(NA_character_)
length(NULL)
is.null(NULL)
is.na(NaN)
is.nan(NA)
Inf - Inf

# ---- Checking types ----
v <- 3.5
class(v)
typeof(v)
mode(v)
storage.mode(v)
str(v)
str("hi")
str(TRUE)
str(5L)
inherits(v, "numeric")
class(NULL)
class(mean)
class(matrix(1:4, 2))

# ---- Converting types ----
as.numeric("42")
as.numeric("abc")
as.integer(3.9)
as.character(99)
as.character(TRUE)
as.logical("TRUE")
as.logical("yes")
as.logical(0)
as.logical(5)
as.numeric(TRUE)
as.complex(2)
as.Date("2026-01-15")
as.numeric(as.Date("1970-01-02"))
# "5" + 3
as.numeric("5") + 3

# ---- Coercion ----
c(1, "a", TRUE)
c(1, TRUE, FALSE)
c(1L, 2.5)
class(c(1L, 2.5))
class(c(TRUE, 5L))

# ---- Answers ----
# Exercise 1
price <- 249.99
class(price)
typeof(price)
round(price)
# Exercise 2
topic <- "data science"
toupper(topic)
nchar(topic)
sub("science", "analysis", topic)
# Exercise 3
v <- c(15, 22, 8, 31, 4)
sum(v > 10)
v[v > 10]
# Exercise 4
as.Date("2026-12-25") - as.Date("2026-01-01")
# Exercise 5
w <- c(4, NA, 10, 6)
mean(w, na.rm = TRUE)
ifelse(is.na(w), 0, w)
# Exercise 6
class(c(1, "2", TRUE))
