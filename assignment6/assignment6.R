A <- matrix(c(2, 0, 1, 3), ncol = 2)
B <- matrix(c(5, 2, 4, -1), ncol = 2)
A
B
A + B
A - B

D <- diag(c(4, 1, 2, 3))
D

M <- diag(3, 5)
M[1, 2:5] <- 1
M[2:5, 1] <- 2
M