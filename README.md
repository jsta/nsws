<!-- README.md is generated from README.Rmd. Please edit that file -->
National Surface Water Survey Package
=====================================

[![lifecycle](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg) [![CRAN status](http://www.r-pkg.org/badges/version/nsws)](https://cran.r-project.org/package=nsws) [![DOI](https://zenodo.org/badge/114264836.svg)](https://zenodo.org/badge/latestdoi/114264836)

Metadata
--------

See the [eastern](https://archive.epa.gov/emap/archive-emap/web/html/els.html) and [western](https://archive.epa.gov/emap/archive-emap/web/html/wls.html) survey pages.

Installation
------------

``` r
# install development version from Github
# install devtools if not found - install.packages("devtools")
devtools::install_github("jsta/nsws", update_dependencies = TRUE)
```

Usage
-----

``` r
library(nsws)
```

``` r
# Download raw data
nsws_east_get(version = "1")
nsws_west_get(version = "1")
```

``` r
# Load data from cache
dt <- nsws_load("1")

# View tables
names(dt)
#> [1] "bathym"   "elsds4"   "fasfim01" "spsfim01" "suschla"  "susfim01"
#> [7] "suszoop"  "wlsds4"
tibble::as.tibble(dt$bathym)
#> # A tibble: 129 x 14
#>     FRATE LAKE_ID  LAT_DD LITTAREA  LONG_DD MAXDPM MEANDPM RUNOFF  SAREA
#>    <fctr>  <fctr>  <fctr>    <dbl>   <fctr>  <dbl>   <dbl> <fctr>  <dbl>
#>  1    1.2 1A1-003 43.9569      5.1 -74.9583   11.6     4.6   76.2   13.5
#>  2   33.4 1A1-008 43.7083    266.4  -74.475    3.0     1.1   88.9  266.4
#>  3    1.5 1A1-012 43.5875     17.3 -74.5624   12.2     3.9   88.9   42.6
#>  4    5.4 1A1-015 44.0875     52.1 -74.0667   21.9     6.1   76.2  102.1
#>  5   15.9 1A1-017 43.8333     13.0 -74.7958    4.0     2.1   76.2   20.7
#>  6    1.8 1A1-028 44.3528     10.6 -74.4374    4.0     1.6   63.5   27.7
#>  7    3.1 1A1-029 44.3389     21.3 -74.3792    3.4     1.5   63.5   24.8
#>  8    0.5 1A1-033 44.2958     18.9 -74.1583   13.1     7.2   76.2  113.0
#>  9    1.4 1A1-039 44.1125      3.1 -74.7639    7.6     3.1   63.5    5.9
#> 10    9.3 1A1-044 44.0417    773.5 -74.3666   13.7     3.3   63.5 1626.9
#> # ... with 119 more rows, and 5 more variables: SHORLN <dbl>,
#> #   SHRDEV <dbl>, VOLDV <dbl>, VOLUME <dbl>, WAREA <dbl>

# Load archived package data
# data(nsws)
```
