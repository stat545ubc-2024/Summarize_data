
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

This is a basic example which shows you how to use package
summarizedata2

``` r
#only download if you have not installed the package
#devtools::install_github("stat545ubc-2024/summarizedata2")
library(summarizedata2)#import the package
library(palmerpenguins)# used penguin data to demonstrate the example 
#Summarize the bill length  data by species and islands without ignoring the missing value
summarize_data(penguins,species,island,summ_vars=bill_length_mm,na.rm=FALSE)
#> # A tibble: 5 × 5
#> # Groups:   species [3]
#>   species   island    median_v mean_v  sd_v
#>   <fct>     <fct>        <dbl>  <dbl> <dbl>
#> 1 Adelie    Biscoe        38.7   39.0  2.48
#> 2 Adelie    Dream         38.6   38.5  2.47
#> 3 Adelie    Torgersen     NA     NA   NA   
#> 4 Chinstrap Dream         49.6   48.8  3.34
#> 5 Gentoo    Biscoe        NA     NA   NA
#Summarize the bill length  data by species and islands when ignoring the missing value
summarize_data(penguins,species,island,summ_vars=bill_length_mm,na.rm=TRUE)
#> # A tibble: 5 × 5
#> # Groups:   species [3]
#>   species   island    median_v mean_v  sd_v
#>   <fct>     <fct>        <dbl>  <dbl> <dbl>
#> 1 Adelie    Biscoe        38.7   39.0  2.48
#> 2 Adelie    Dream         38.6   38.5  2.47
#> 3 Adelie    Torgersen     38.9   39.0  3.03
#> 4 Chinstrap Dream         49.6   48.8  3.34
#> 5 Gentoo    Biscoe        47.3   47.5  3.08
```
