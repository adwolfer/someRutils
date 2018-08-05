#' Plot one or multiple NMR spectra, colored by user defined colour, p-value or STOCSY
#' 
#' Plot one or multiple NMR spectra with ppm as x-axis and intensity as y-axis; the colour of each spectra can be defined using \code{spectraColour} (default grey for one spectra, rainbow for multiple ones). If a vector of \code{pval} (one per ppm) is passed as input, each datapoint will be colored depending on the p-value. If a \code{driver} ppm is passed as input, the correlation of all variables to this driver will be calculated (statistical total correlation spectroscopy - STOCSY) and used to colour the median spectra. Only one colouring method (\code{spectraColour}, \code{pval} or \code{driver}) can be used at any given time). Require \code{ggplot2}, \code{reshape2}, \code{scales}, \code{grDevices}, \code{stats}
#'
#' @param ppm (float) vector of ppm values (x-axis)
#' @param data (data.frame) spectra intensity values matching \code{ppm} (spectra as rows, ppm as columns)
#' @param spectraColour (str) NULL or vector of colour for each sample (same length as the number of row of \code{data})
#' @param pval (float) NULL or vector of p-value for each ppm (same length as \code{ppm} and the number of columns of \code{data})
#' @param driver (float) NULL or ppm value of the driver feature for STOCSY (the closest ppm value will be used)
#' @param verbose (bool) If TRUE message progress
#' @param debug (bool) If TRUE returns the data to plot instead of the ggplot object
#' 
#' @return Grob (ggplot object)
#' 
#' @examples {
#' # load data (2.95 - 3.5 ppm)
#' inPPM  <- someRutils::exampleNMR$ppm[711:821]
#' inData <- someRutils::exampleNMR$data[,711:821]
#' 
#' # default plot
#' NMR_plot_spectra_pval_stocsy(ppm=inPPM, data=inData)
#' 
#' # set each spectra colour (3 spectra)
#' inSpectraColour <- c('blue', 'red', 'green')
#' NMR_plot_spectra_pval_stocsy(ppm=inPPM[1:3], data=inData[1:3], spectraColour=inSpectraColour)
#' 
#' # colour by p-value
#' inPval  <- rep(c(0.0000001, 0.001, 0.01, 0.05, 0.1, 0.25, 0.5, 1), 14)[1:111]
#' NMR_plot_spectra_pval_stocsy(ppm=inPPM, data=inData, pval=inPval)
#' 
#' # STOCSY (driver peak is 3.2765ppm)
#' NMR_plot_spectra_pval_stocsy(ppm=inPPM, data=inData, driver=3.2765)
#' }
#' 
#' @family NMR
#'  
#' @export
NMR_plot_spectra_pval_stocsy <- function(ppm, data, spectraColour=NULL, pval=NULL, driver=NULL, verbose=TRUE, debug=FALSE) {
  
  ## Check input
  # By default, colour by spectra
  useSpecCol    <- TRUE
  usePvalCol    <- FALSE
  useStocsyCol  <- FALSE
  
  # ppm and data dim agree
  if (!(typeof(ppm) %in% c('integer','double'))) {
    stop('Error: "ppm" must be a vector of integer or double')
  }
  if (!is.data.frame(data)) {
    stop('Error: "data" must be a data.frame')
  }
  if (length(ppm) != ncol(data)) {
    stop('Error: "ppm" length and "data" number of columns are different')
  }
  minppm  <- floor(min(ppm))
  maxppm  <- ceiling(max(ppm))
  nbSpec  <- nrow(data)
  
  # data and spectraColour dim agree
  # default case
  if (nbSpec==1) {
    colourSpec  <- "grey20"
  } else {
    colourSpec  <- grDevices::rainbow(nbSpec)
  }
  # check
  if (!is.null(spectraColour)) {
    if (nbSpec==length(spectraColour)) {
      colourSpec <- spectraColour
    } else {
      if (verbose) {message('Warning: "spectraColour" length must match the number of spectra: default colour used')}
    }
  } 
  
  # use pval
  if (!is.null(pval)) {
    # ppm and pval dim agree
    if (length(ppm) != length(pval)) {
      stop('Error: "ppm" and "pval" length are different')
    } else {
      useSpecCol <- FALSE
      usePvalCol <- TRUE
    }
    
  # use STOCSY
  } else if (!is.null(driver)) {
    if(length(driver)!=1 | !(typeof(driver) %in% c('integer','double'))) {
      stop('Error: "driver" must be a single integer or double')
    } else {
      useSpecCol    <- FALSE
      useStocsyCol  <- TRUE
    }
  }
  
  
  ## Prepare data
  colnames(data)    <- ppm
  suppressMessages( readyData <- reshape2::melt(data) )
  readyData$specID  <- paste('spec', seq(1:nbSpec), sep="") # repeat the spectraID for each variable
  # convert `variable`to numeric instead of factors
  readyData$variable  <- as.numeric(levels(readyData$variable))[ readyData$variable ]

  # spectra colour
  if (useSpecCol) {
    # create an ID for each spectra, attached each spectraID to a colour
    spectraID         <- paste('spec', seq(1:nbSpec), sep="")
    names(colourSpec) <- spectraID
    
    # debug
    if (debug) {
      if (verbose) {message('- Debugging mode "spectraColour", only the data table to be plotted is returned -')}
      return(list(data=readyData, colour=colourSpec))
    }
  }
  
  # pval
  if (usePvalCol) {
    # df of pval (repeated for as many row as data to ease binding)
    tmp_pval            <- data.frame(matrix( rep(x=pval, nrow(data)), nrow=nrow(data), byrow=TRUE))
    colnames(tmp_pval)  <- ppm
    suppressMessages( tmp_pval <- reshape2::melt(tmp_pval) )
    readyData$pvalue    <- tmp_pval$value
    
    # debug
    if (debug) {
      if (verbose) {message('- Debugging mode "pval", only the data table to be plotted is returned -')}
      return(readyData)
    }
  }

  # STOCSY
  if (useStocsyCol) {
    # median spectra
    medianSpec            <- data.frame(t(as.numeric(apply(data, 2, stats::median))))
    colnames(medianSpec)  <- ppm
    
    # find target
    ppm_target            <- which(abs(ppm-driver)==min(abs(ppm-driver)))
    
    # correlation
    corr                  <- apply(data, 2, function(x){ stats::cor.test(x, data[,ppm_target], method='pearson')$estimate })
    
    # combine STOCSY results
    readySingleSpec           <- data.frame(t(rbind(medianSpec, corr, ppm)))
    colnames(readySingleSpec) <- c('spectra', 'corr', 'ppm')
    
    # debug
    if (debug) {
      if (verbose) {message('- Debugging mode "STOCSY", only the data table to be plotted is returned -')}
      return(readySingleSpec)
    }
  }
  
  
  ## Plot
  # spectra colour
  if (useSpecCol) {
    if (verbose) {message('Plotting ',nbSpec,' spectra')}
    
    p <- ggplot2::ggplot(data=readyData, ggplot2::aes(x=variable, y=value, group=factor(specID))) 
    p <- p + ggplot2::geom_line(ggplot2::aes(color=factor(specID)))
    p <- p + ggplot2::scale_color_manual(values=colourSpec)
    p <- p + ggplot2::scale_x_reverse(breaks=seq(minppm,maxppm,1)) + ggplot2::xlab('ppm') + ggplot2::ylab('Intensity') + ggplot2::theme_bw()
    p <- p + ggplot2::theme(legend.position="none")
    return(p)
    
  # pval
  } else if (usePvalCol) {
    if (verbose) {message('Plotting ',nbSpec,' spectra coloured by p-value')}
    
    p <- ggplot2::ggplot(data=readyData, ggplot2::aes(x=variable, y=value, group=factor(specID))) 
    p <- p + ggplot2::geom_line(ggplot2::aes(color=pvalue), size=0.75)
    p <- p + ggplot2::scale_x_reverse(breaks=seq(minppm,maxppm,1)) + ggplot2::xlab('ppm') + ggplot2::ylab('Intensity') + ggplot2::theme_bw()
    p <- p + ggplot2::scale_color_gradient(trans='log', high='grey20', low='green', breaks=c(0,0.001,0.05,0.5))
    return(p)
    
  # STOCSY  
  } else if (useStocsyCol) {
    if (verbose) {message('Plotting the STOCSY on median spectra with ',driver,'ppm as a driver')}
    
    p <- ggplot2::ggplot( data=readySingleSpec, ggplot2::aes(x=ppm, y=spectra)) 
    p <- p + ggplot2::geom_line( ggplot2::aes(color=corr), size=0.75)
    p <- p + ggplot2::scale_x_reverse(breaks=seq(minppm,maxppm,1)) + ggplot2::xlab('ppm') + ggplot2::ylab('Intensity') + ggplot2::theme_bw()
    p <- p + ggplot2::geom_vline(xintercept=driver, color='black', linetype=2) 
    p <- p + ggplot2::scale_colour_gradient2(limits=c(-1,1), high=scales::muted("red"), low=scales::muted("blue"))
    return(p)
  }
  
  
  
}
