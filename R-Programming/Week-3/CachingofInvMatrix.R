# Assumption : Supplied matrix is invertible
makeCacheMatrix = function(mtrx = matrix()) 
{
  j = NULL
  set = function(y) 
  {
    mtrx <<- y
    j <<- NULL
  }
  get = function() mtrx
  setinverse = function(inverse) j <<- inverse
  getinverse = function() j
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}

cacheSolve = function(mtrx, ...) 
{
  print("original matrix is:")
  mtrx
  invmtrx = mtrx$getinverse()
  #Checking if the inverse is already calculated
  if (!is.null(invmtrx)) 
  {
    print("getting cached data")
    return(invmtrx)
  }
  data = mtrx$get()
  invmtrx = solve(data, ...) # calling solve function to inverse the matrix
  mtrx$setinverse(invmtrx)
  invmtrx
}
