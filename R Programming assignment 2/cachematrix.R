## This function creates a special "matrix" object 
## that can cache its inverse
makeCacheMatrix <- function(x = matrix()) {
    i <- NULL
    set <- function(y) {
        x <<- y
        i <<- NULL
    }
    get <- function() x
    setInverse <- function(inverse) i <<- inverse
    getInverse <- function() i
    list(set = set, 
         get = get,
         setInverse = setInverse,
         getInverse = getInverse)
}

## This function computes the inverse of 
## the special "matrix" 
cacheSolve <- function(x, ...) {
    i <- x$getInverse()
    if (!is.null(i)){
        message("getting cached inverse")
        return (i)
    }
    data <- x$get()
    i <- solve(data)
    x$setInverse(i)
    i
}

