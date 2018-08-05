#' @import utils
.onLoad <- function(libname = find.package("someRutils"), pkgname = "someRutils"){

  # CRAN Note avoidance
  if(getRversion() >= "2.15.1") {
    utils::globalVariables(
      # data.frame column names used in ggplot (cannot use aes_string due to transformations to the column in aes())
      c("variable","value","specID","pvalue","spectra")
      )
    invisible()
  }
}

.onAttach <- function(libname, pkgname) {
  packageStartupMessage(
    paste("\nThese are some R utility functions, version", utils::packageVersion("someRutils"), "\n"))
}
