##This set of R functions compute and cache the inverse of a matrix.

## This function creates a special matrix object where we can cache its inverse. This function returns a list containing functions to a) set the matrix, b) get the matrix c) set the inverse d) get the inverse the will be passed as input to the second function cache Solve().

makeCacheMatrix <- function(x = matrix()) {
    # x is a square invertible matrix
        inv  <- NULL
        set <- function(y) {
            x <<- y
            inv <<- NULL
        }
        get <- function() x
        setinverse <- function(solve) inv <<- solve
        getinverse <- function()inv
        list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)

}


## This function returns a matrix that is the inverse of the a certain matrix 'x'.  It first checks if the inverse has already been computed and previously stored. If so, it uses this result and skips the computation. If not, it computes the inverse using the function solve() and sets the value in the cache using the setinverse() function.

cacheSolve <- function(x, ...) {
    #the function checks if the inverse has been cached already
            inv <- x$getinverse()
            if(!is.null(inv)) {
                message("Getting cached data")
                return(inv)
            }
            # if it does not find inv, it computes the inverse of the matrix x using the function solve()
            data <- x$get()
            inv <- solve(data)
            x$setinverse(inv)
            inv
        
}
