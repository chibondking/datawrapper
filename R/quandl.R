# Quandl Wrapper for Quantmod
# Cedrick Johnson <cedrickj@atysbonds.com>

"getSymbols.Quandl" <- function(Symbols, return.class="xts", start_date=NULL,
		end.date=Sys.Date(), collapse=NULL, meta=FALSE, authcode=NULL,...) {
	
	importDefaults("getSymbols.Quandl")
	this.env <- environment()

	if(missing(verbose)) {
		verbose <- FALSE
	}

	if(missing(auto.assign)) {
		auto.assign <- TRUE
	}

	.checkQuandl(authcode=authcode)

	if(is.null(collapse)) {
		warning("Collapsing data to Monthly by default. To override, specify
			a valid quandl collapse name")
		collapse <- "monthly"
	}

	for(i in 1:length(Symbols)) {
		if(verbose) {
			cat(paste("Downloading ", Symbols[[i]]))
		}

		if(is.null(start.date)) {
			start.date <- "1970-01-01"
		}
		data <- Quandl(code=Symbols[[i]], ...)
		
		if(auto.assign) {
			assign(Symbols[[i]], data, env)
		}
		if(verbose) {
			cat("done\n")
		}
	}

	if(auto.assign) {
		return(Symbols)
	} else {
		return(data)
	}

}


"quandlSearch" <- function(query, page=1, source=NULL, silent=FALSE, 
		authcode=NULL,...) {

	importDefaults("quandlSearch")

	.checkQuandl(authcode=authcode)

	if(missing(auto.assign)) {
		auto.assign <- TRUE
	}

	result <- Quandl.search(...)

	if(auto.assign) {
		assign("QuandlResult", result, env)
	} else {
		return(result)
	}
}

".checkQuandl" <- function(authcode=NULL) {
	
	if('package:Quandl' %in% search() || require('Quandl', quietly=TRUE)) {
	} else {
		warning(paste("package:",dQuote("Quandl"), "cannot be loaded"))
	}

	if(is.null(authcode)) {
		warning("Quandl package requires an authcode if you are downloading a
			lot of data. The API may refuse connections if this isn't supplied
			after a few requests")
	}
}
