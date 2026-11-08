tukey.outlier <- function(x) {
  rep(FALSE, length(x))
}

tukey_multiple <- function(x) {
  outliers <- array(TRUE, dim = dim(x))
  for (j in 1:ncol(x)) {
    outliers[, j] <- outliers[, j] && tukey.outlier(x[, j])
  }
  outlier.vec <- vector("logical", length = nrow(x))
  for (i in 1:nrow(x)) {
    outlier.vec[i] <- all(outliers[i, ])
  }
  return(outlier.vec)
}

set.seed(123)
test_mat <- matrix(rnorm(50), nrow = 10)

cat("Original call:\n")
tryCatch(
  print(tukey_multiple(test_mat)),
  error = function(e) cat("Error:", conditionMessage(e), "\n")
)

corrected_tukey <- function(x) {
  outliers <- array(TRUE, dim = dim(x))
  for (j in 1:ncol(x)) {
    outliers[, j] <- outliers[, j] & tukey.outlier(x[, j])
  }
  outlier.vec <- vector("logical", length = nrow(x))
  for (i in 1:nrow(x)) {
    outlier.vec[i] <- all(outliers[i, ])
  }
  return(outlier.vec)
}

cat("\nCorrected call:\n")
result <- corrected_tukey(test_mat)
print(result)
cat("length:", length(result), "\n")
cat("typeof:", typeof(result), "\n")