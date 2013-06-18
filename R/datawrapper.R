.onAttach <- function(libname,pkgname) {
	packageStartupMessage(paste(pkgname, "loaded in session"))
}
