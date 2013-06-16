\name{getSymbols.Fogbank}
\alias{getSymbols.Fogbank}
\alias{getSymbols}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Load data from a MySQL database
}
\description{
Function that provides a MySQL wrapper to the quantmod getSymbols function to 
retrieve data and store it in the user's current R session.
}
\usage{
getSymbols.Fogbank(Symbols = NULL,
  env = parent.frame(),
  return.class="xts",
  db.fields=c("Date","o","h","l","c","v","a"),
  field.names=c("Open","High","Low","Close","Volume","Adjusted"),
  dbname=NULL
  host="localhost",
  port=3306,
  ...)
}
\arguments{
\item{Symbols}{ a character vector specifying the names of each symbol to load}
\item{env}{ where to create the symbol objects}
\item{return.class}{ what type of class should the symbol object be returned as}
\item{db.fields}{ each of the column names that exist in each symbol table located
    in the MySQL database.}
\item{field.names}{ on the returned object, what should be name each of the columns
    on the object}
\item{dbname}{ the database table name}
\item{host}{ the hostname of the MySQL database. Default is localhost}
\item{port}{ the port to connect to the MySQL database with. Default 3306}
} 
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
Cedrick Johnson
}
\seealso{
\code{\link{getSymbols}}
\code{\link{quantmod}}
}
\examples{
  \dontrun{
    # gets a symbol from the MySQL database using custom user, pass and hostname
    setDefaults(getSymbols.Fogbank, user="user", password="password", host="localhost")
    getSymbols("SPX", src="Fogbank")
    
    #Override default column and field names
    setDefaults(getSymbols.Fogbank, user="user", password="pass", host="localhost",
      port=3306, dbname="histdata", db.fields=c('Date','o','h','l','c','v'), 
      field.names=c("Open","High","Low","Close","Volume"))
    getSymbols("SPX", src="Fogbank")
    head(SPX)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ getSymbols.Fogbank }
\keyword{ getSymbols }
