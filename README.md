Purpose
=======

**Note: This documentation is very preliminary and sparse at the time**

This package is designed to add new functions to extend the functionality of 
quantmod's getSymbols function by adding and enhancing new wrappers to retrieve
data from a variety of sources. Currently this package contains a function for
retrieving data from a MySQL instance, but I have plans to add Quandl and other
data providers in the future.

Currently MySQL is a *suggested* package, if you are using a function which requires
a certain external package, then it will be *required*

Installation
============

Since this package is extending functionality of the quantmod package, it requires
that quantmod (version 0.4 or later) already installed on your machine. If you're 
installing this package from CRAN (which we hope to have soon), then typing in the 
following commands will satisfy this dependency:

`install.packages('datawrapper', dependencies=TRUE)`

If you're not installing this package from CRAN, then you should make sure that
the latest version of quantmod is installed:

`install.packages('quantmod')`

Installation From Github
------------------------
Using the `devtools` package, you can also install datawrapper directly from this
github repository. You can read more about [devtools by clicking here](
http://github.com/hadley/devtools).

Example:
>
> install.packages('devtools') #Installs devtools from CRAN
>
> library(devtools)
>
> install_github('datawrapper', username='chibondking')

This will ensure that you are installing the latest development version of this
package.


Usage
=====

Currently this package has the function `getSymbols.Fogbank` installed. You can
retrieve data by specifying values in the function call to retrieve a symbol that
currently exists in your MySQL instance. You can also override column defaults
if your columns are different than some of the standard ways of storing symbol
data.

Please note that each symbol in your MySQL database must be stored in it's own 
table in order for the `getSymbols.Fogbank` function to work properly.

### Using Defaults
Example using defaults to get symbols:
>
>library(datawrapper)
>
>getSymbols("YHOO", src="Fogbank")

This will load the quantmod package when loading the datawrapper package.

References
==========

* [quantmod Package Home](http://www.quantmod.com)
* [Quantmod CRAN Page](http://cran.r-project.org/web/packages/quantmod/index.html)
* [Quantmod Reference Manual](http://cran.r-project.org/web/packages/quantmod/quantmod.pdf)
