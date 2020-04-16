load("CachingofInvMatrix.R") # loading the source file

# This is test case to test matrix inverse functions

#2X2 matrxi test
m <- matrix(c(0, 2, 1, 0), nrow = 2, ncol = 2, byrow = TRUE)
m
m1 = makeCacheMatrix(m)
cacheSolve(m1)

#3X3 matrix
anotherMatrix  = matrix( c(5, 1, 0,
                           3,-1, 2,
                           4, 0,-1), nrow=3, byrow=TRUE)
anotherMatrix
am1 = makeCacheMatrix(anotherMatrix)
cacheSolve(am1)
