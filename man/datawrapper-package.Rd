\name{datawrapper-package}
\alias{datawrapper-package}
\alias{datawrapper}
\docType{package}
\title{
A collection of wrappers for Quantmod getSymbols to retrieve data from various sources
}
\description{
A collection of wrappers for Quantmod getSymbols to retrieve data from various sources
}
\details{
\tabular{ll}{
Package: \tab datawrapper\cr
Type: \tab Package\cr
Version: \tab 0.1\cr
Date: \tab 2013-06-15\cr
Depends: \tab R (>= 3.0.0), quantmod (>= 0.4.0)\cr
Suggests: \tab RMySQL, Quandl\cr
Enhances: \tab quantmod\cr
License: \tab GPL-3\cr
URL: \tab https://github.com/chibondking/datawrapper\cr
URL: \tab http://www.quantmod.com\cr
}
\emph{About}
This package is a collection of wrappers that extends Quantmod's 
getSymbols functionality to use a variety of data sources. Quantmod contains
a variety of wrappers already that can be used as is, however these are designed
to be templates for extending your own custom data wrappers. This package provides
a small sample of wrappers that I have found useful in retrieving certain types of
data stored locally and through various third party data providers.

}
\author{
Cedrick Johnson, with code used from the Quantmod project (Jeffery Ryan, et. al)

Maintainer: Cedrick Johnson <cedrickj@atysbonds.com>
}
\references{

}
\keyword{ package }
\keyword{ quantmod }
\keyword{ getSymbols }
\seealso{
  \code{\link[quantmod]{quantmod}}
}
}