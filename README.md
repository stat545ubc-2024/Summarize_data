
<!-- README.md is generated from README.Rmd. Please edit that file -->

# summarizedata2 Package Description

<!-- badges: start -->
<!-- badges: end -->

The function summarize_data intends to calculate the median, mean, and
standard deviation (sd) under certain grouping conditions in a dataset.
An na.rm argument is used to indicate if missing value (NA) should be
removed or not from the data.

**Please note** that the package is named as”summarizedata2” to
differentiate from another student’s package with “summarizedata” in
Stat545 repo

## Installation

You can install the development version of summarizedata from
[GitHub](https://github.com/) with:

``` r
# 
devtools::install_github("stat545ubc-2024/summarizedata2")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
#devtools::install_github("stat545ubc-2024/summarizedata2")
library(summarizedata)
library(palmerpenguins)# used penguin data to demonstrate the example 
summarize_data(penguins,species,island,summ_vars=bill_length_mm,na.rm=TRUE)
#> # A tibble: 5 × 5
#> # Groups:   species [3]
#>   species   island    median  mean    sd
#>   <fct>     <fct>      <dbl> <dbl> <dbl>
#> 1 Adelie    Biscoe      38.7  39.0  2.48
#> 2 Adelie    Dream       38.6  38.5  2.47
#> 3 Adelie    Torgersen   38.9  39.0  3.03
#> 4 Chinstrap Dream       49.6  48.8  3.34
#> 5 Gentoo    Biscoe      47.3  47.5  3.08
summarize_data(penguins,sex,island,summ_vars=bill_depth_mm,na.rm=TRUE)
#> # A tibble: 9 × 5
#> # Groups:   sex [3]
#>   sex    island    median  mean     sd
#>   <fct>  <fct>      <dbl> <dbl>  <dbl>
#> 1 female Biscoe      14.5  15.2  1.72 
#> 2 female Dream       17.8  17.6  0.828
#> 3 female Torgersen   17.4  17.6  0.880
#> 4 male   Biscoe      16    16.6  1.66 
#> 5 male   Dream       19    19.1  0.911
#> 6 male   Torgersen   19.2  19.4  1.08 
#> 7 <NA>   Biscoe      14.4  14.6  0.810
#> 8 <NA>   Dream       18.9  18.9 NA    
#> 9 <NA>   Torgersen   17.7  18.2  1.42
## basic example code
```
