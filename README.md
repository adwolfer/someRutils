
<!-- README.md is generated from README.Rmd. Please edit that file -->

# someRutils

[![Build
Status](https://travis-ci.org/adwolfer/someRutils.svg?branch=master)](https://travis-ci.org/adwolfer/someRutils)
[![codecov](https://codecov.io/gh/adwolfer/someRutils/branch/master/graph/badge.svg)](https://codecov.io/gh/adwolfer/someRutils/branch/master)

A compilation of `R` utility functions for data cleaning, correction and
visualisation

## Installation

``` r
# Install devtools
if(!require("devtools")) install.packages("devtools")
devtools::install_github("adwolfer/someRutils")
```

## Usage

``` r
# Plot one or multiple NMR spectra, colored by user defined colour, p-value or STOCSY
someRutils::NMR_plot_spectra_pval_stocsy(ppm=ppm, data=NMR_data)
```

## Copyright

`someRutils` is licensed under the
[GPLv3](http://choosealicense.com/licenses/gpl-3.0/)

As a summary, the GPLv3 license requires attribution, inclusion of
copyright and license information, disclosure of source code and
changes. Derivative work must be available under the same terms.

© Arnaud Wolfer (2018)
