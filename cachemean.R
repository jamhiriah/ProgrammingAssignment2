makeVector<-function(x=numeric()){
	m<-NULL
	set<-function(y){
		x<<-y
		m<<-NULL
	}
	get<-function()x  			# give x to get
	setmean<-function(mean) m<<-mean
	getmean<-function() m 			#this function take nothing
	list(set=set,get=get,
		setmean=setmean,
		getmean=getmean)
}

cachemean<-function(x,...){  
	m<-x$getmean()  			#get the m value
	if(!is.null(m)){  			#if m is not null
		message("getting cached data")
		return(m)
	}
						#if the m is null do this
	data<-x$get()
	m<-mean(data,...)
	x$setmean(m)
	m
}


