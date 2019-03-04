## Put comments here that give an overall description of what your
## functions do

#Creates a "special"matrix which is a list containing a function to:
# 1. set the value of the matrix
# 2. get the value of the matrix
# 3. set the vaue of the inverse
# 4. get the value of the inverse
makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  
  get <- function() x
  setinverse <- function(solve) m <<- solve
  getinverse <- function() m
  
  list(set = set, get = get, 
       setinverse = setinverse, 
       getinverse = getinverse)
}

#Calculates the inverse of the "special" matrix and returns the inverse if it has already been calculated
cacheSolve <- function(x, ...) {
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  m
}
