% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/NMR_plot_spectra_pval_stocsy.R
\name{NMR_plot_spectra_pval_stocsy}
\alias{NMR_plot_spectra_pval_stocsy}
\title{Plot one or multiple NMR spectra, colored by user defined colour, p-value or STOCSY}
\usage{
NMR_plot_spectra_pval_stocsy(ppm, data, spectraColour = NULL,
  pval = NULL, driver = NULL, verbose = TRUE, debug = FALSE)
}
\arguments{
\item{ppm}{(float) vector of ppm values (x-axis)}

\item{data}{(data.frame) spectra intensity values matching \code{ppm} (spectra as rows, ppm as columns)}

\item{spectraColour}{(str) NULL or vector of colour for each sample (same length as the number of row of \code{data})}

\item{pval}{(float) NULL or vector of p-value for each ppm (same length as \code{ppm} and the number of columns of \code{data})}

\item{driver}{(float) NULL or ppm value of the driver feature for STOCSY (the closest ppm value will be used)}

\item{verbose}{(bool) If TRUE message progress}

\item{debug}{(bool) If TRUE returns the data to plot instead of the ggplot object}
}
\value{
Grob (ggplot object)
}
\description{
Plot one or multiple NMR spectra with ppm as x-axis and intensity as y-axis; the colour of each spectra can be defined using \code{spectraColour} (default grey for one spectra, rainbow for multiple ones). If a vector of \code{pval} (one per ppm) is passed as input, each datapoint will be colored depending on the p-value. If a \code{driver} ppm is passed as input, the correlation of all variables to this driver will be calculated (statistical total correlation spectroscopy - STOCSY) and used to colour the median spectra. Only one colouring method (\code{spectraColour}, \code{pval} or \code{driver}) can be used at any given time). Require \code{ggplot2}, \code{reshape2}, \code{scales}, \code{grDevices}, \code{stats}
}
\examples{
{
# load data (2.95 - 3.5 ppm)
inPPM  <- someRutils::exampleNMR$ppm[711:821]
inData <- someRutils::exampleNMR$data[,711:821]

# default plot
NMR_plot_spectra_pval_stocsy(ppm=inPPM, data=inData)

# set each spectra colour (3 spectra)
inSpectraColour <- c('blue', 'red', 'green')
NMR_plot_spectra_pval_stocsy(ppm=inPPM[1:3], data=inData[1:3], spectraColour=inSpectraColour)

# colour by p-value
inPval  <- rep(c(0.0000001, 0.001, 0.01, 0.05, 0.1, 0.25, 0.5, 1), 14)[1:111]
NMR_plot_spectra_pval_stocsy(ppm=inPPM, data=inData, pval=inPval)

# STOCSY (driver peak is 3.2765ppm)
NMR_plot_spectra_pval_stocsy(ppm=inPPM, data=inData, driver=3.2765)
}

}
\concept{NMR}
