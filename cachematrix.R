## This function creates a special matrix object that can cache its inverse
## using solve function 

## 

makeCacheMatrix <- function(x = matrix()) {
	m<-NULL
	set<-function(y){
	x<<-y
	m<<-NULL
}
get<-function() x
setmatrixinverse<-function(solve) m<<-solve
getmatrixinverse<-function() m
list(set=set, get=get,
	setmatrixinverse=setmatrixinverse,
        getmatrixinverse=getmatrixinverse)
}


## This function computes the inverse of the matrix returned by above function.
## if the inverse is not null, inverse is taken from cached data
cacheSolve <- function(x, ...) {
        m<-x$getmatrixinverse()
	if(!is.null(m)){
		message("getting cached data")
		return(m)
	}
	matrix<-x$get()
	m<-solve(matrix,...)
	x$setmatrixinverse(m)
	m
        ## Return a matrix that is the inverse of 'x'
}
