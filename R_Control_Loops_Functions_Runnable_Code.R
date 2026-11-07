# R Programming Notes: Control Statements, Loops, Iteration and Functions. Runnable code
# How to use: open this file in RStudio and run it line by line (Ctrl+Enter / Cmd+Enter),
# or run the whole file with Source. Lines starting with '# ' directly before code
# are examples that cause errors on purpose (or must NEVER be run, like infinite loops).
# The dplyr / purrr / tibble parts need those packages (installed automatically if missing).
# SAFETY: save before running loops; Esc or the red STOP sign interrupts R.

# ---- Intro: conditions refresher ----
5 > 3
5 == 5
"a" == "A"
age <- 20
age >= 18 & age < 65
age < 18 | age > 65
!(age > 18)
TRUE && FALSE
c(TRUE, FALSE) & c(TRUE, TRUE)
"b" %in% c("a", "b", "c")

# ---- Decisions: if ----
a <- 76
b <- 67
if (a > b) {
  difference <- a - b
  print("condition a > b is TRUE")
  print(paste("Difference between a and b is:", difference))
}
if (a < b) {
  print("a is smaller than b")
}
temp <- 32
if (temp > 30) {
  print("It is hot. Drink water!")
}

# ---- Decisions: if else ----
a <- 67
b <- 76
if (a > b) {
  difference <- a - b
  print("condition a > b is TRUE")
  print(paste("Difference between a and b is:", difference))
} else {
  difference <- a - b
  print("condition a > b is FALSE")
  print(paste("Difference between a and b is:", difference))
}
age <- 17
if (age >= 18) {
  print("You can vote")
} else {
  print("Too young to vote")
}
day <- "Sat"
if (day == "Sat" || day == "Sun") print("Weekend") else print("Weekday")

# ---- Decisions: the ladder ----
marks <- 72
if (marks >= 80) {
  grade <- "A"
} else if (marks >= 70) {
  grade <- "B"
} else if (marks >= 60) {
  grade <- "C"
} else {
  grade <- "D"
}
grade
age <- 8
if (age < 5) {
  price <- 0
} else if (age < 13) {
  price <- 50
} else if (age < 60) {
  price <- 100
} else {
  price <- 40
}
paste("Ticket price:", price)
a <- 67; b <- 76; d <- 99
if (a > b && b > d) {
  print("a > b > d")
} else if (a < b && b > d) {
  print("a < b > d")
} else if (a < b && b < d) {
  print("a < b < d")
}

# ---- Decisions: nested ----
has_account <- TRUE
password_ok <- FALSE
if (has_account) {
  if (password_ok) {
    print("Welcome")
  } else {
    print("Wrong password")
  }
} else {
  print("Please sign up")
}
a <- 10
b <- 11
if (a == 10) {
  if (b == 10) {
    print("a:10 b:10")
  } else {
    print("a:10 b:11")
  }
} else {
  if (a == 11) {
    print("a:11 b:10")
  } else {
    print("a:11 b:11")
  }
}
balance <- 5000
amount <- 8000
if (amount > 0) {
  if (amount <= balance) {
    print("Withdrawal approved")
  } else {
    print("Insufficient funds")
  }
} else {
  print("Enter a positive amount")
}

# ---- Decisions: switch ----
switch(2, "red", "green", "blue")
switch("banana", apple = "red", banana = "yellow", grape = "purple")
switch("kiwi", apple = "red", banana = "yellow", "unknown colour")
z <- switch("kiwi", apple = "red", banana = "yellow")
is.null(z)
switch("b", a = , b = "Group AB", c = "Group C")
day_num <- 3
switch(day_num, "Mon", "Tue", "Wed", "Thu")
light <- "red"
action <- switch(light, red = "Stop", yellow = "Get ready", green = "Go", "Light not working")
action

# ---- Decisions: ifelse ----
scores <- c(45, 72, 58, 90)
ifelse(scores >= 50, "Pass", "Fail")
ifelse(scores >= 80, "A", ifelse(scores >= 60, "B", "C"))
sum(scores >= 50)

# ---- Decisions: mistakes ----
x <- 8
# if (x > 5) {
#   print("big")
# }
# else {
#   print("small")
# }
if (x > 5) {
  print("big")
} else {
  print("small")
}
marks3 <- c(45, 72, 58)
# if (marks3 >= 50) print("Pass")
ifelse(marks3 >= 50, "Pass", "Fail")
# if (NA > 3) print("yes")
value <- NA
if (!is.na(value) && value > 3) print("big") else print("missing or small")
y <- 5
# if (y = 5) print("five")
if (y == 5) print("five")
if (FALSE)
  print("one")
  print("two")
"10" > 9

# ---- Loops: for ----
for (i in 1:5) {
  print(i)
}
for (fruit in c("apple", "banana", "mango")) {
  print(paste("I like", fruit))
}
total <- 0
for (i in c(10, 20, 30)) {
  total <- total + i
}
total
prices <- c(120, 80, 45)
bill <- 0
for (p in prices) {
  bill <- bill + p
}
bill
scores <- c(70, 85, 60)
for (i in seq_along(scores)) {
  cat("Student", i, "scored", scores[i], "\n")
}
marks <- c(Ana = 80, Ben = 65)
for (nm in names(marks)) {
  cat(nm, "->", marks[nm], "\n")
}
students <- list(Ana = c(70, 80), Ben = c(60, 65))
for (nm in names(students)) {
  cat(nm, "average:", mean(students[[nm]]), "\n")
}
for (i in 1:5) {
  cat("7 x", i, "=", 7 * i, "\n")
}
squares <- numeric(5)
for (i in 1:5) {
  squares[i] <- i^2
}
squares
evens <- c()
for (i in 1:10) {
  if (i %% 2 == 0) {
    evens <- c(evens, i)
  }
}
evens

# ---- Loops: nested ----
for (i in 1:3) {
  for (j in 1:3) {
    cat(i * j, " ")
  }
  cat("\n")
}

# ---- Loops: for-loop traps ----
for (i in 1:3) i
for (i in 1:3) print(i)
x <- c()
for (i in 1:length(x)) print(i)
for (i in seq_along(x)) print(i)

# ---- Loops: while ----
count <- 1
while (count <= 3) {
  print(count)
  count <- count + 1
}
n <- 3
while (n > 0) {
  cat(n, "...\n")
  n <- n - 1
}
cat("Liftoff!\n")
balance <- 1000
years <- 0
while (balance < 2000) {
  balance <- balance * 1.10
  years <- years + 1
}
years
round(balance, 2)
n <- 51
while (n %% 7 != 0) {
  n <- n + 1
}
n

# ---- Loops: repeat ----
i <- 0
repeat {
  i <- i + 1
  if (i == 4) {
    break
  }
  print(i)
}
i

# ---- Loops: next and break ----
for (i in 1:6) {
  if (i %% 2 == 0) {
    next
  }
  print(i)
}
for (i in 1:10) {
  if (i > 3) {
    break
  }
  print(i)
}
numbers <- c(4, 9, -2, 7)
for (x in numbers) {
  if (x < 0) {
    cat("Found a negative number:", x, "- stopping\n")
    break
  }
  cat("OK:", x, "\n")
}
total <- 0
for (price in c(50, NA, 30)) {
  if (is.na(price)) {
    next
  }
  total <- total + price
}
total

# ---- Infinite loops: NEVER run these. They are shown only so you can recognise them. ----
# while (TRUE) { print("hi") }
# i <- 1; while (i <= 5) { print(i) }
# x <- 0; while (x != 1) { x <- x + 0.1 }     # decimal trap

# ---- Loops: safe versions ----
i <- 0
while (TRUE) {
  i <- i + 1
  if (i >= 1000) {
    cat("Safety stop!\n")
    break
  }
}
i
x <- 0
while (x < 1) {
  x <- x + 0.1
}
x > 0.99
attempts <- 0
max_attempts <- 5
while (attempts < max_attempts) {
  attempts <- attempts + 1
}
attempts

# ---- Loops: loop or no loop? ----
x <- 1:5
x * 2
doubled <- numeric(5)
for (i in 1:5) {
  doubled[i] <- x[i] * 2
}
doubled

# ---- Iteration: apply family ----
sapply(1:5, function(x) x^2)
sapply(c(a = 1, b = 2), \(x) x * 10)
lapply(1:2, \(x) x * 2)
vapply(1:3, \(x) x * 2, numeric(1))
mapply(function(x, y) x + y, 1:3, 4:6)
m <- matrix(1:6, nrow = 2)
apply(m, 1, sum)
tapply(c(10, 20, 30, 40), c("a", "b", "a", "b"), sum)
sapply(list(a = 1:3, b = 4:6), sum)

# (Installs the packages only if they are missing. You need internet.)
if (!requireNamespace("dplyr", quietly = TRUE)) install.packages("dplyr")
if (!requireNamespace("purrr", quietly = TRUE)) install.packages("purrr")
if (!requireNamespace("tibble", quietly = TRUE)) install.packages("tibble")

# ---- Iteration: across() ----
library(dplyr)
library(tibble)
df <- tibble(a = c(1, 2, 3), b = c(4, 5, 6), c = c(7, 8, 9))
df |> summarize(across(a:c, mean))
df |> summarize(n = n(), across(a:c, median))
df |> mutate(across(a:c, \(x) x * 10))
df |> summarize(across(a:c, list(min = min, max = max)))
df_na <- tibble(a = c(1, NA, 3), b = c(4, 5, NA))
df_na |> summarize(across(a:b, \(x) mean(x, na.rm = TRUE)))

# ---- Iteration: purrr map() ----
library(purrr)
map_dbl(list(a = 1:3, b = 4:6), mean)
map_chr(c("a", "b"), toupper)
map(1:3, \(x) x^2)
map2_dbl(1:3, 4:6, \(x, y) x + y)
safe_log <- possibly(log, otherwise = NA)
map_dbl(list(1, "a", 10), safe_log)
pieces <- list(y2019 = data.frame(sales = c(10, 20)),
  y2020 = data.frame(sales = c(30, 40)))
list_rbind(pieces, names_to = "year")

# ---- Reading many files (illustration only: needs a folder named data with csv files) ----
# paths <- list.files("data", pattern = "[.]csv$", full.names = TRUE)
# all_data <- paths |> map(read.csv) |> list_rbind()

# ---- Functions: first steps ----
add_num <- function(a, b) {
  sum_result <- a + b
  return(sum_result)
}
total <- add_num(35, 67)
total
add_num(1, 2)
add_two <- function(a, b) a + b
add_two(10, 5)
calculate_square <- function(x) {
  result <- x^2
  return(result)
}
calculate_square(5)
calculate_square(-2.5)
area_of_circle <- function(radius) {
  pi * radius^2
}
area_of_circle(2)
f <- function(x) x^2 * 4 + x / 3
f(4)
f(-2)
f(0)

# ---- Functions: ways to pass arguments ----
area_rect <- function(length = 5, width = 4) {
  area <- length * width
  return(area)
}
area_rect(2, 3)
area_rect(width = 8, length = 4)
area_rect()
area_rect(3)
area_rect(width = 10)
divide <- function(a, b) a / b
divide(2, 10)
divide(b = 2, a = 10)

# ---- Functions: returning values ----
rectangle_info <- function(length, width) {
  area <- length * width
  perimeter <- 2 * (length + width)
  result <- list(Area = area, Perimeter = perimeter)
  return(result)
}
res <- rectangle_info(2, 3)
res$Area
res$Perimeter
res["Area"]
double_it <- function(x) {
  y <- x * 2
}
double_it(4)
print(double_it(4))
z <- double_it(4)
z

# ---- Functions: built-in examples ----
sum(4:6)
max(4:6)
min(4:6)
nums <- c(10, 20, 30, 40)
mean(nums)
sd(nums)

# ---- Functions: with a decision ----
even_odd <- function(x) {
  if (x %% 2 == 0) {
    return("Even")
  } else {
    return("Odd")
  }
}
even_odd(4)
even_odd(3)
divisible_by_5 <- function(n) {
  if (n %% 5 == 0) {
    return("number is divisible by 5")
  } else {
    return("number is not divisible by 5")
  }
}
divisible_by_5(100)
divisible_by_5(4)
divisible <- function(a, b) {
  if (a %% b == 0) {
    return(paste(a, "is divisible by", b))
  } else {
    return(paste(a, "is not divisible by", b))
  }
}
divisible(36, 6)
divisible(7, 3)
divisible <- function(a, b = 3) {
  if (a %% b == 0) {
    return(paste(a, "is divisible by", b))
  } else {
    return(paste(a, "is not divisible by", b))
  }
}
divisible(12)
divisible(10, 5)

# ---- Functions: dots ----
total_of <- function(...) {
  sum(...)
}
total_of(1, 2, 3, 4)
count_args <- function(...) {
  length(list(...))
}
count_args(5, "a", TRUE)
describe <- function(n, ...) {
  items <- list(n, ...)
  paste(items, collapse = " ")
}
describe(5, 1L, 6i, TRUE, "hello", "dots")

# ---- Functions: functions as arguments ----
operate <- function(x, y, func) {
  func(x, y)
}
add <- function(a, b) a + b
multiply <- function(a, b) a * b
operate(3, 4, add)
operate(3, 4, multiply)
operate(3, 4, max)
apply_to <- function(x, fun2) {
  return(fun2(x))
}
apply_to(c(1, 2, 3, 4), mean)
(\(x) x + 1)(5)

# ---- Functions: lazy evaluation ----
cylinder <- function(diameter, length, radius) {
  volume <- pi * diameter^2 * length / 4
  return(volume)
}
cylinder(5, 10)
# cylinder2 <- function(diameter, length, radius) {
#   volume <- pi * diameter^2 * length / 4
#   print(radius)
#   return(volume)
# }
# cylinder2(5, 10)
greet <- function(name) {
  if (missing(name)) {
    "Hello, stranger!"
  } else {
    paste("Hello,", name)
  }
}
greet()
greet("Amina")

# ---- Functions: scope ----
x <- 10
f <- function() {
  x <- 5
  x
}
f()
x
g <- function() x + 1
g()
# h <- function() {
#   secret <- 99
# }
# h()
# secret
counter <- 0
add_one <- function() {
  counter <- counter + 1
}
add_one()
counter
add_one <- function(x) x + 1
counter <- add_one(counter)
counter

# ---- Functions: loops and decisions together ----
report <- function(scores, pass_mark = 50) {
  for (name in names(scores)) {
    if (scores[name] >= pass_mark) {
      status <- "PASS"
    } else {
      status <- "FAIL"
    }
    cat(name, ":", scores[name], "-", status, "\n")
  }
}
report(c(Ana = 72, Ben = 45, Chao = 50))
report(c(Ana = 72, Ben = 45), pass_mark = 70)
sum_to_n <- function(n) {
  total <- 0
  for (i in 1:n) {
    total <- total + i
  }
  total
}
sum_to_n(100)
first_multiple <- function(of, above) {
  n <- above + 1
  while (n %% of != 0) {
    n <- n + 1
  }
  n
}
first_multiple(7, 50)
check_login <- function(attempts, correct = "r2026") {
  tries <- 0
  for (guess in attempts) {
    tries <- tries + 1
    if (guess == correct) {
      return(paste("Welcome! Attempt number", tries))
    }
    if (tries == 3) {
      return("Account locked")
    }
  }
  "Login failed"
}
check_login(c("abc", "r2026"))
check_login(c("a", "b", "c", "r2026"))
check_login("a")

# ---- Functions: validation ----
safe_sqrt <- function(x) {
  if (!is.numeric(x)) {
    stop("x must be a number")
  }
  if (x < 0) {
    warning("negative input, returning NA")
    return(NA)
  }
  sqrt(x)
}
safe_sqrt(16)
safe_sqrt(-4)
# safe_sqrt("a")
result <- tryCatch(log("a"), error = function(e) "Oops, could not take log")
result
stopifnot(is.numeric(5), 5 > 0)

# ---- Functions: recursion ----
factorial_r <- function(n) {
  if (n <= 1) {
    return(1)
  }
  n * factorial_r(n - 1)
}
factorial_r(5)
# forever <- function(n) forever(n + 1)
# forever(1)

# ---- Real life 1: electricity bill ----
electricity_bill <- function(units, rate1 = 10, rate2 = 15, rate3 = 20) {
  if (units <= 50) {
    bill <- units * rate1
  } else if (units <= 100) {
    bill <- 50 * rate1 + (units - 50) * rate2
  } else {
    bill <- 50 * rate1 + 50 * rate2 + (units - 100) * rate3
  }
  return(bill)
}
electricity_bill(40)
electricity_bill(80)
electricity_bill(120)
electricity_bill(80, rate2 = 12)

# ---- Real life 2: BMI ----
bmi_category <- function(weight_kg, height_m) {
  bmi <- weight_kg / height_m^2
  if (bmi < 18.5) {
    category <- "Underweight"
  } else if (bmi < 25) {
    category <- "Normal"
  } else if (bmi < 30) {
    category <- "Overweight"
  } else {
    category <- "Obese"
  }
  list(bmi = round(bmi, 1), category = category)
}
result <- bmi_category(60, 1.70)
result$bmi
result$category
bmi_category(95, 1.75)$category
bmi_category(50, 1.80)$category

# ---- Real life 3: shop discount ----
final_price <- function(price, quantity = 1, discount = 0.10, threshold = 5000) {
  if (price < 0 || quantity < 1) {
    stop("Price and quantity must be positive")
  }
  total <- price * quantity
  if (total >= threshold) {
    total <- total * (1 - discount)
  }
  total
}
final_price(1200)
final_price(1200, 5)
final_price(1200, 5, discount = 0.2)
final_price(1200, quantity = 5, threshold = 7000)
# final_price(-5)

# ---- Real life 4: savings goal ----
years_to_target <- function(start, rate, target, max_years = 100) {
  balance <- start
  years <- 0
  while (balance < target && years < max_years) {
    balance <- balance * (1 + rate)
    years <- years + 1
  }
  if (balance < target) {
    return(NA)
  }
  years
}
years_to_target(1000, 0.10, 2000)
years_to_target(1000, 0, 2000)

# ---- Real life 5: temperature converter ----
convert_temp <- function(value, to = "F") {
  switch(to,
    F = value * 9 / 5 + 32,
    C = (value - 32) * 5 / 9,
    K = value + 273.15,
    stop("Unknown unit: use F, C or K")
  )
}
convert_temp(100)
convert_temp(212, "C")
convert_temp(0, "K")
# convert_temp(5, "X")

# ---- Real life 6: leap year ----
is_leap <- function(year) {
  (year %% 4 == 0 && year %% 100 != 0) || year %% 400 == 0
}
is_leap(2024)
is_leap(1900)
sapply(c(1900, 2000, 2024, 2026), is_leap)

# ---- Real life 7: FizzBuzz ----
fizzbuzz <- function(n = 15) {
  for (i in 1:n) {
    if (i %% 15 == 0) {
      cat("FizzBuzz\n")
    } else if (i %% 3 == 0) {
      cat("Fizz\n")
    } else if (i %% 5 == 0) {
      cat("Buzz\n")
    } else {
      cat(i, "\n", sep = "")
    }
  }
}
fizzbuzz(7)

# ---- Real life 8: class statistics ----
class_stats <- function(marks, pass_mark = 50) {
  list(
    mean = mean(marks),
    highest = max(marks),
    passed = sum(marks >= pass_mark)
  )
}
stats <- class_stats(c(45, 72, 58, 90, 33))
stats$mean
stats$highest
stats$passed
class_stats(c(45, 72, 58, 90, 33), pass_mark = 70)$passed

# ---- Real life 9: restock alerts ----
restock <- function(stock, minimum = 10) {
  for (item in names(stock)) {
    if (stock[item] < minimum) {
      cat(item, "needs restocking:", stock[item], "left\n")
    }
  }
}
restock(c(pens = 25, books = 4, bags = 9))

# ---- Real life 10: primes ----
is_prime <- function(n) {
  if (n < 2) return(FALSE)
  if (n < 4) return(TRUE)
  for (i in 2:floor(sqrt(n))) {
    if (n %% i == 0) return(FALSE)
  }
  TRUE
}
is_prime(11)
is_prime(9)
Filter(is_prime, 1:20)

# ---- Mistakes: calling functions ----
# add_num(1)
add_num(1, 2)
# add_num(1, 2, 3)
divide(2, 10)
divide(a = 10, b = 2)

# ---- Mistakes: returning values ----
# two_values <- function(a, b) {
#   return(a, b)
# }
# two_values(1, 2)
two_values <- function(a, b) {
  return(list(first = a, second = b))
}
two_values(1, 2)$second
bad_sum <- function(v) {
  total <- 0
  for (x in v) {
    total <- total + x
    return(total)
  }
  total
}
bad_sum(c(1, 2, 3))
good_sum <- function(v) {
  total <- 0
  for (x in v) {
    total <- total + x
  }
  total
}
good_sum(c(1, 2, 3))
# uses_global <- function() w * 2
# uses_global()
uses_arg <- function(w) w * 2
uses_arg(21)

# ---- Answers: Part B ----
# B1
is_even <- function(n) {
  n %% 2 == 0
}
is_even(10)
is_even(7)
# B2
grade <- function(marks) {
  if (marks >= 80) {
    "A"
  } else if (marks >= 70) {
    "B"
  } else if (marks >= 60) {
    "C"
  } else {
    "D"
  }
}
sapply(c(85, 72, 64, 40), grade)
# B3
for (i in 1:5) {
  cat(i, "squared is", i^2, "\n")
}
# B4
n <- 100
halvings <- 0
while (n >= 1) {
  n <- n / 2
  halvings <- halvings + 1
}
halvings
# B5
count_above <- function(x, limit = 50) {
  sum(x > limit)
}
count_above(c(30, 60, 80, 45))
count_above(c(30, 60, 80, 45), limit = 40)
# B6
max_min <- function(x) {
  list(highest = max(x), lowest = min(x))
}
res <- max_min(c(5, 2, 9))
res$highest
res$lowest
# B7
calc <- function(a, b, op = "+") {
  switch(op,
    "+" = a + b,
    "-" = a - b,
    "*" = a * b,
    "/" = a / b,
    stop("Unknown operator")
  )
}
calc(8, 2)
calc(8, 2, "/")
calc(8, 2, "*")
# B8
keep <- c()
for (i in 1:10) {
  if (i %% 3 == 0) {
    next
  }
  keep <- c(keep, i)
}
keep
# B9
n <- 21
repeat {
  if (n %% 6 == 0) {
    break
  }
  n <- n + 1
}
n
# B10
sapply(list(a = 1:3, b = 4:6), sum)

# ---- Answers: Part C ----
# C1
taxi_fare <- function(km, student = FALSE) {
  if (km <= 5) {
    fare <- 100 + km * 40
  } else {
    fare <- 100 + 5 * 40 + (km - 5) * 30
  }
  if (student) {
    fare <- fare * 0.9
  }
  fare
}
taxi_fare(3)
taxi_fare(8)
taxi_fare(8, student = TRUE)
# C2
summarise_marks <- function(marks, pass_mark = 50) {
  list(mean = mean(marks), highest = max(marks), passed = sum(marks >= pass_mark))
}
s <- summarise_marks(c(45, 72, 58, 90, 33))
s$mean
s$highest
s$passed
# C3
data_cost <- function(gb) {
  if (gb <= 1) {
    100
  } else if (gb <= 5) {
    100 + (gb - 1) * 80
  } else {
    100 + 4 * 80 + (gb - 5) * 60
  }
}
data_cost(0.5)
data_cost(3)
data_cost(8)
# C4
months_to_save <- function(goal, monthly, max_months = 1200) {
  saved <- 0
  months <- 0
  while (saved < goal && months < max_months) {
    saved <- saved + monthly
    months <- months + 1
  }
  if (saved < goal) {
    return(NA)
  }
  months
}
months_to_save(10000, 1500)
months_to_save(10000, 0)
# C5
password_strength <- function(pw) {
  n <- nchar(pw)
  has_digit <- grepl("[0-9]", pw)
  if (n >= 8 && has_digit) {
    "Strong"
  } else if (n >= 6) {
    "Medium"
  } else {
    "Weak"
  }
}
password_strength("abc")
password_strength("hello1")
password_strength("secure2026")
# C6
pass_list <- function(scores, pass_mark = 50) {
  passed <- names(scores)[scores >= pass_mark]
  cat("Passed:", length(passed), "\n")
  cat("Names:", passed, "\n")
}
pass_list(c(Ana = 72, Ben = 45, Chao = 50, Dee = 88))
