# Initial author of the code from the Quantmod project (Jeff Ryan, et. al)
# modified to not assume a fixed set of field.names when retrieving data
# from the database.

# getSymbols.Fogbank {{{
"getSymbols.Fogbank" <- function(Symbols,env,return.class='xts',
  db.fields=c('date','o','h','l','c','v','a'),
  field.names = c("Open","High","Low","Close","Volume","Adjusted"),
  user=NULL,password=NULL,dbname=NULL,host='localhost',port=3306, ...) {
	
		 
		# Import default values as specified using setDefaults for this function name
		# will override function defaults specified above
		importDefaults("getSymbols.Fogbank")
		this.env <- environment()
		for(var in names(list(...))) {
				# import all named elements that are NON formals
				assign(var, list(...)[[var]], this.env)
		}
		if(missing(verbose)) {
				verbose <- FALSE
		}
  
		if(missing(auto.assign)) {
				auto.assign <- TRUE
		}
		if('package:DBI' %in% search() || require('DBI',quietly=TRUE)) {
				if('package:RMySQL' %in% search() || require('RMySQL',quietly=TRUE)) {
				} else { 
						warning(paste("package:",dQuote("RMySQL"),"cannot be loaded" )) 
				}
		} else {
				stop(paste("package:",dQuote('DBI'),"cannot be loaded."))
		}
		if(is.null(user) || is.null(password) || is.null(dbname)) {
				stop(paste('At least one connection argument (',sQuote('user'),
               sQuote('password'),sQuote('dbname'),") is not set"))
		}
		con <- dbConnect("MySQL",user=user,password=password,dbname=dbname,host=host,
				port=port)
		db.Symbols <- dbListTables(con)
		if(length(Symbols) != sum(Symbols %in% db.Symbols)) {
				missing.db.symbol <- Symbols[!Symbols %in% db.Symbols]
				warning(paste('could not load symbol(s): ',paste(missing.db.symbol,
						collapse=', ')))
				Symbols <- Symbols[Symbols %in% db.Symbols]
		}
		for(i in 1:length(Symbols)) {
				if(verbose) {
						cat(paste('Loading ',Symbols[[i]],paste(rep('.',10-nchar(Symbols[[i]])),
								collapse=''),sep=''))
				}
				query <- paste("SELECT ",paste(db.fields,collapse=',')," FROM ",
						Symbols[[i]]," ORDER BY date")
				rs <- dbSendQuery(con, query)
				fr <- fetch(rs, n=-1)
				fr <- xts(as.matrix(fr[,-1]), order.by=as.Date(fr[,1],origin='1970-01-01'),
            src=dbname,updated=Sys.time()) 
        colnames(fr) <- paste(Symbols[[i]], field.names, sep='.')
				fr <- .convert.time.series(fr=fr,return.class=return.class)
				if(auto.assign) {
						assign(Symbols[[i]],fr,env)
				}
				if(verbose) {
						cat('done\n')
				}
		}
		dbDisconnect(con)
		if(auto.assign) {
				return(Symbols)
		} else {
				return(fr)
		}
}

"getSymbols.Fogbank" <- getSymbols.Fogbank
# }}}
