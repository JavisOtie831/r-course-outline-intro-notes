# ============================================================
# Data Structures in R: Comprehensive annotated examples
# Base R first; tidyverse examples second.
# Run block-by-block in R/RStudio. Some tidyverse blocks require packages.
# ============================================================

# -----------------------------
# PART A. BASE R FOUNDATIONS
# -----------------------------

# 1. Scalars: in R, a scalar is usually a length-one vector
a <- 10
name <- "Ana"
length(a); typeof(a); class(a)
a + 5; a^2; sqrt(a)
paste("Hello", name); nchar(name)
a[1]; a[2]; a[-1]

# 2. Numeric vectors: creation, indexing, operations
x <- c(10, 20, 30, 40)
y <- 1:4
z <- seq(0, 1, by = 0.25)
length(x); typeof(x); summary(x)
x[1]; x[c(1, 3)]; x[-2]; x[x > 20]
x2 <- x; x2[2] <- 99; x2[x2 > 30] <- 100
x + y; x * 2; sum(x); mean(x); max(x) - min(x)
marks <- c(Ana = 80, Ben = 75, Chao = 90)
marks["Ben"]; marks[c("Ana", "Chao")]

# 3. Character vectors and strings
s <- "data science"
words <- c("data", "models", "impact")
sent <- paste(words, collapse = " -> ")
length(s); nchar(s); length(words); nchar(words)
toupper(words); tolower("DATA")
words[2]
words[words == "models"] <- "algorithms"
substr(s, 1, 4)
grepl("da", words); grep("a", words); gsub("science", "analytics", s)
strsplit(c("A:B", "C:D:E"), ":")
paste("ID", 1:3); paste0("ID", 1:3); paste(letters[1:3], collapse = ",")

# 4. Matrices
M <- matrix(1:6, nrow = 2, byrow = TRUE)
N <- matrix(10:15, nrow = 2, byrow = TRUE)
C <- cbind(a = 1:3, b = 4:6)
dim(M); nrow(M); ncol(M)
rownames(M) <- c("r1", "r2"); colnames(M) <- c("c1", "c2", "c3")
M[1, 2]; M[1, ]; M[, c("c1", "c3")]; M[1, , drop = FALSE]
M2 <- M; M2[1, 2] <- 99; M2[, "c3"] <- c(7, 8); M2[M2 > 50] <- NA
M + N; M * 2; M %*% t(M); t(M)
rowSums(M); colMeans(M); apply(M, 1, mean); apply(M, 2, max)
I <- diag(3); diag(I); diag(matrix(1:9, 3))

# 5. Arrays
A <- array(1:24, dim = c(3, 4, 2))
dim(A); A[, , 1]
dimnames(A) <- list(student = paste0("s", 1:3), test = paste0("t", 1:4), term = c("T1", "T2"))
A["s1", "t2", "T1"]; A[, , "T2"]; A["s1", , , drop = FALSE]
A + 100; A * 2; sqrt(A)
apply(A, 1, mean); apply(A, c(1, 3), sum); apply(A, 3, max)
as.vector(A)[1:6]; as.data.frame.table(A)
dim(aperm(array(1:24, c(2, 3, 4)), c(3, 1, 2)))

# 6. Factors
grp <- factor(c("low", "high", "medium", "low"))
grp; levels(grp); as.integer(grp)
risk <- factor(c("low", "high", "medium"), levels = c("low", "medium", "high"))
risk_ord <- factor(risk, ordered = TRUE)
risk_ord > "low"
grp[1:2]; grp[1] <- "medium"
grp2 <- grp[grp != "high"]; droplevels(grp2)
table(grp); relevel(grp, ref = "medium"); interaction(grp, c("A", "B", "A", "B"))
f <- factor(c("10", "20", "30")); as.numeric(f); as.numeric(as.character(f))

# 7. Lists
L <- list(id = "S01", marks = c(70, 80, 90), passed = TRUE)
str(L)
L["marks"]; L[["marks"]]; L$marks
lengths(L); lapply(L, class); sum(L$marks); unlist(L$marks)
L$mean_mark <- mean(L$marks); L[["grade"]] <- "A"; L$passed <- NULL
student <- list(profile = list(name = "Ana", age = 21), scores = list(math = 80, stats = 88))
student[["profile"]][["name"]]
fit <- lm(mpg ~ wt, data = mtcars)
names(fit)[1:6]; coef(fit); summary(fit)$r.squared

# 8. Data frames
DF <- data.frame(id = 1:3, name = c("Ana", "Ben", "Chao"), mark = c(80, 75, 90), pass = c(TRUE, TRUE, TRUE))
str(DF); dim(DF); nrow(DF); ncol(DF); names(DF); head(DF); summary(DF)
DF[1, 3]; DF[1:2, c("name", "mark")]; DF$mark; DF["mark"]
DF[DF$mark >= 80, ]; DF[order(DF$mark, decreasing = TRUE), ]
subset(DF, mark >= 80, select = c(name, mark))
DF$grade <- ifelse(DF$mark >= 80, "A", "B")
DF2 <- transform(DF, scaled = mark / 100)
DF$group <- c("G1", "G1", "G2")
aggregate(mark ~ group, DF, mean); tapply(DF$mark, DF$group, mean); table(DF$group, DF$grade)
extra <- data.frame(id = 1:3, age = c(21, 22, 20))
merge(DF, extra, by = "id"); rbind(DF[1, ], DF[2, ])

# 9. Missing values and conversion
x_na <- c(10, NA, 30)
is.na(x_na); mean(x_na); mean(x_na, na.rm = TRUE)
dmiss <- data.frame(x = c(1, NA, 3), y = c(NA, 2, 3))
complete.cases(dmiss); dmiss[complete.cases(dmiss), ]
as.matrix(DF["mark"]); as.data.frame(M); as.vector(M)
c(1, TRUE, 3); c(1, "two", 3)
1:4 + 10; 1:4 + c(10, 20)
M[1, ]; M[1, , drop = FALSE]
DF[, "mark"]; DF[, "mark", drop = FALSE]

# -----------------------------
# PART B. TIDYVERSE CONTEXT
# -----------------------------
# Uncomment after installing packages: install.packages("tidyverse")
# library(tibble); library(dplyr); library(stringr); library(purrr)
# tb <- tibble(id = 1:3, name = c("Ana", "Ben", "Chao"), mark = c(80, 75, 90))
# class(tb); dim(tb); names(tb); glimpse(tb)
# tb["mark"]; tb[["mark"]]; tb$mark
# tb %>% filter(mark >= 80)
# tb %>% select(name, mark)
# tb %>% mutate(grade = if_else(mark >= 80, "A", "B"))
# tb2 <- tb %>% mutate(group = c("G1", "G1", "G2"))
# tb2 %>% group_by(group) %>% summarise(avg = mean(mark), n = n(), .groups = "drop")
# extra_tb <- tibble(id = 1:3, age = c(21, 22, 20))
# left_join(tb, extra_tb, by = "id")
# bind_rows(tb, tb)
# str_detect(tb$name, "a|A")
# str_replace("data science", "science", "analytics")
# L <- list(a = 1:3, b = 10:12)
# map(L, mean)
# map_dbl(L, mean)
# tb_nested <- tibble(id = 1:2, scores = list(1:3, 4:6))
# tb_nested$scores[[1]]
# tb_nested %>% mutate(avg = map_dbl(scores, mean))

# -----------------------------
# PART C. QUICK BASE VS TIDYVERSE COMPARISON
# -----------------------------
# Base:       DF[DF$mark >= 80, ]
# Tidyverse:  filter(tb, mark >= 80)
# Base:       DF[c("name", "mark")]
# Tidyverse:  select(tb, name, mark)
# Base:       DF$grade <- ifelse(DF$mark >= 80, "A", "B")
# Tidyverse:  mutate(tb, grade = if_else(mark >= 80, "A", "B"))
# Base:       aggregate(mark ~ group, DF, mean)
# Tidyverse:  group_by(tb2, group) %>% summarise(avg = mean(mark))
# Base:       merge(DF, extra, by = "id")
# Tidyverse:  left_join(tb, extra_tb, by = "id")

# ============================================================
# Added practical mini-cases used in the readable slide revision
# ============================================================

# 1) Clean a numeric score vector
marks <- c(67, 81, -4, 55, 103, 72)
marks[marks < 0 | marks > 100] <- NA
mean(marks, na.rm = TRUE)
range(marks, na.rm = TRUE)
marks[!is.na(marks) & marks >= 70]

# 2) Standardise student names: Base R and stringr
nm <- c("  alice mwangi", "BOB OTIENO  ", "Carol  Njeri")
base_clean <- tools::toTitleCase(tolower(trimws(gsub(" +", " ", nm))))
base_clean
if (requireNamespace("stringr", quietly = TRUE)) {
  stringr::str_to_title(stringr::str_squish(nm))
}

# 3) Matrix marks by student and assessment
M <- matrix(c(70,80,65, 62,75,71, 88,91,84), nrow=3, byrow=TRUE,
            dimnames=list(c("A","B","C"), c("CAT1","CAT2","Exam")))
M["B", "Exam"]
M[, "CAT2"]
rowMeans(M)
colMeans(M)
which.max(colMeans(M))

# 4) 3-D array for repeated measurements
A <- array(1:24, dim=c(4,3,2),
           dimnames=list(Student=paste0("S",1:4),
                         Var=c("Math","R","Stats"), Sem=c("S1","S2")))
A["S2", , "S1"]
A[, "R", ]
apply(A, c(1,3), mean)

# 5) Ordered factor
response <- factor(c("High","Low","Medium","High"),
                   levels=c("Low","Medium","High"), ordered=TRUE)
table(response)
response[1] > response[2]
levels(response)
as.integer(response)

# 6) List as a model-result container
fit <- lm(mpg ~ wt, data=mtcars)
res <- list(model=fit, coef=coef(fit), fitted=head(fitted(fit)), note="demo")
res$coef
res[["note"]]
res[c("coef","note")]

# 7) Base data-frame workflow
students <- data.frame(name=c("A","B","C"), mark=c(78,61,88), programme=c("DS","Stats","DS"))
students[students$programme == "DS", ]
students$grade <- ifelse(students$mark >= 70, "A/B", "C-or-below")
aggregate(mark ~ programme, students, mean)

# 8) Tidyverse equivalent
if (requireNamespace("tibble", quietly = TRUE) && requireNamespace("dplyr", quietly = TRUE)) {
  students |>
    tibble::as_tibble() |>
    dplyr::filter(programme == "DS") |>
    dplyr::mutate(grade = dplyr::if_else(mark >= 70, "A/B", "C-or-below")) |>
    dplyr::summarise(mean_mark = mean(mark), n = dplyr::n())
}
