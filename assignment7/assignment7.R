#1. Data
data(mtcars)
head(mtcars)
str(mtcars)

#2. Generics
#summary() has a data.frame method.
summary(mtcars)

#mean() does not have a data.frame method.
has_mean_df <- "mean.data.frame" %in% methods("mean")
has_mean_df
mean(mtcars)

#3. S3
print.student_s3 <- function(x, ...) {
  cat("student_s3\n")
  cat("name:", x$name, "\n")
  cat("age:", x$age, "\n")
  cat("GPA:", x$GPA, "\n")
  invisible(x)
}

s3_obj <- list(name = "Myself", age = 29, GPA = 3.5)
class(s3_obj) <- "student_s3"

s3_obj
s3_obj$name
class(s3_obj)
typeof(s3_obj)
isS4(s3_obj)

#4. S4
setClass(
  "student_s4",
  slots = c(name = "character", age = "numeric", GPA = "numeric")
)

setMethod(
  "print",
  "student_s4",
  function(x) {
    cat("student_s4\n")
    cat("name:", x@name, "\n")
    cat("age:", x@age, "\n")
    cat("GPA:", x@GPA, "\n")
    invisible(x)
  }
)

s4_obj <- new("student_s4", name = "Myself", age = 29, GPA = 3.5)

print(s4_obj)
s4_obj@name
class(s4_obj)
typeof(s4_obj)
isS4(s4_obj)

s3_obj$GPA
s4_obj@GPA