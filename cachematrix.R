## Matrix inversion is a costly computation and there may be some benefit 
## to caching the inverse of a matrix rather than computing it repeatedly/ 
## Below are two functions that cache the inverse of a matrix.

## Function 'makeCacheMatrix' creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
  
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  set_inverse <- function(solve) inv <<- solve
  get_inverse <- function() inv
  list(set = set, get = get,
       set_inverse = set_inverse,
       get_inverse = get_inverse)
  
}


##  Function 'cacheSolve' computes the inverse of the special "matrix" returned by 'makeCacheMatrix' above.
##  If the inverse has already been calculated (and the matrix has not changed), 
##  then cacheSolve should retrieve the inverse from the cache.


cacheInverse <- function(x, ...) {
  
  inv <- x$get_inverse()
  if(!is.null(inv)) {cI
    message("getting cached data")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data, ...)
  x$set_inverse(inv)
  inv
  
    ## Return a matrix that is the inverse of 'x'
}

