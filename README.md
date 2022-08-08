
<!-- README.md is generated from README.Rmd. Please edit that file -->

# sosRus

# sosRus <a href="https://ztimpe.github.io/sosRus/"><img src="man/figures/logo.png" align="right" height="139" /></a>

<!-- badges: start -->

[![R-CMD-check](https://github.com/ztimpe/sosRus/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/ztimpe/sosRus/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The goal of sosRus is to tame some gnarly survey data! The functions
included in this package are designed to ease the burden of pulling data
from the SOS API and clean it in preparation for reporting and
evaluation.

## Installation

You can install the development version of sosRus from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("ztimpe/sosRus")
```

## Example

This is a basic example which shows you how to construct the API call:

``` r
library(sosRus)
# Use bracketize to add brackets, slashes, and quotations for the API call
bracketize(letters)
#> [1] "[\"a\",\"b\",\"c\",\"d\",\"e\",\"f\",\"g\",\"h\",\"i\",\"j\",\"k\",\"l\",\"m\",\"n\",\"o\",\"p\",\"q\",\"r\",\"s\",\"t\",\"u\",\"v\",\"w\",\"x\",\"y\",\"z\"]"
```
