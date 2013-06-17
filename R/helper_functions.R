# The convert.time.series is a hidden function in Quantmod (written by Jeff
# Ryan, et. al and has been included here since we still need this for 
# converting the data that we get into known time series classes.

# convert.time.series {{{
.convert.time.series <- function(fr,return.class) {
	if('quantmod.OHLC' %in% return.class) {
    	class(fr) <- c('quantmod.OHLC','zoo')
        return(fr)
    } else 
       if('xts' %in% return.class) {
         return(fr)
       }
       if('zoo' %in% return.class) {
         return(as.zoo(fr))
       } else
       if('ts' %in% return.class) {
         fr <- as.ts(fr)
         return(fr)
       } else
       if('data.frame' %in% return.class) {
         fr <- as.data.frame(fr)
         return(fr)
       } else
       if('matrix' %in% return.class) {
         fr <- as.data.frame(fr)
         return(fr)
       } else
       if('its' %in% return.class) {
         if("package:its" %in% search() || suppressMessages(require("its", quietly=TRUE))) {
           fr.dates <- as.POSIXct(as.character(index(fr)))
           fr <- its::its(coredata(fr),fr.dates)
           return(fr)
         } else {
           warning(paste("'its' from package 'its' could not be loaded:",
                         " 'xts' class returned"))
         }
       } else 
       if('timeSeries' %in% return.class) {
         if("package:timeSeries" %in% search() || suppressMessages(
			 require("timeSeries",quietly=TRUE))) {
           fr <- timeSeries(coredata(fr), charvec=as.character(index(fr)))
           return(fr)
         } else {
           warning(paste("'timeSeries' from package 'timeSeries' could not be loaded:",
                   " 'xts' class returned"))
         }
       }
}#}}}
